public class Player implements Renderable, Collidable {
  private float hor,ver; // angles of player's view
  private float x,y,z;
  private int w,h,d;
  private float x2,y2;
  private int speed;
  private PShape bow;

  public Player(){
    x=0;
    y=-40;
    z=0;
    w=40;
    d=40;
    h=160;
    hor=0;
    ver=0;
    speed=10;
    //bow = loadShape("bow.OBJ");
  }

  public void update(){
    camera(x,0,z,x+cos(ver)*cos(hor),0+sin(ver),z+cos(ver)*sin(hor),0,1,0);  
    move();
    //arrow();
  }
  
  public boolean colHelp(Structure struct){
    if (!(insideX(struct.x(), struct.w()) && insideZ(struct.z(),struct.d()))){
      return false;
    }else{
      return true;
    }
    }
  
  public boolean colliding(Collidable e){
    return false; 
  }
  
  public boolean colliding(Structure c){
    return colHelp(c);
  }
  
  public boolean inside(Structure struct){
      return insideX(struct.x(),struct.w()) && insideY(struct.y(),struct.h()) && insideZ(struct.z(),struct.d());
  }
  
  private boolean insideX(int xx, int ww){
    if(ww>=0){
      return x>=xx && x+w<=xx+ww;
    } else {
      return x>=xx+ww && x+w<=xx;
    }
  }
  private boolean insideY(int yy, int hh){
    if(hh>=0){
      return y>=yy && y+h<=yy+hh;
    } else {
      return y>=yy+hh && y+h<=yy;
    }
  }
  private boolean insideZ(int zz, int dd){
    if(dd>=0){
      return z<=zz && z-d>=zz-dd;
    } else {
      return z+d>=zz && z<=zz-dd;
    }
  }
  
  public void move(){
  if(keys[W]==true)
      inc(speed,0);
  if(keys[A]==true)
      inc(speed,-PI/2);
  if(keys[S]==true)
      inc(speed,PI);
  if(keys[D]==true)
      inc(speed,-3*PI/2);
  }

  public void inc(float forward, float angle){
    x += forward*cos(hor+angle);
    z += forward*sin(hor+angle);
  }
  
  public void mousemove(){
    float dx = x2-mouseX;
    float dy = y2-mouseY;
    hor -= dx/width*2*PI;
    ver -= dy/height*2*PI;
    if(ver/PI/2*360>89){
        ver = 89./180*PI;
    } else if (ver/PI/2*360<-89){
        ver = -89./180*PI;
    }
    x2=mouseX;
    y2=mouseY;
  }
  
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  public float getZ(){
    return z;
  }
  
  public void arrow(){
    pushMatrix();
      translate(x,y,z-50);
      rotateZ(PI/2);
      rotateX(PI/2);
      shape(bow,0,0,200,20);
    popMatrix();
  }
  
  public void launch(){
    Arrow a = new Arrow(x,y+40,z,hor,ver);
    arrows.add(a);
  }

}

class Arrow implements Collidable, Renderable {
  PShape arrow;
  int speed = 60;
  PVector location;
  PVector hComponent;
  PVector vComponent;
  PVector gravity;
  float rx,ry,rz;
  int w, h, d;
  
  public Arrow(float x, float y, float z, float hor, float ver){
    location = new PVector(x,y,z);
    gravity = new PVector(0,0.1,0);
    hComponent = new PVector(speed*cos(ver)*cos(hor),0,speed*cos(ver)*sin(hor));
    vComponent = new PVector(0,speed*sin(ver),0);
    arrow = loadShape("arrow.OBJ");
    rx = -hor;
    ry = ver;
    w = 6;
    h = 6;
    d = 200;
  }
  
  public void update(){};
  
  public void update(Structure s){
    if(!colliding(s)){
      vComponent.add(gravity);
      location.add(hComponent);
      location.add(vComponent);
    }
    pushMatrix();
      translate(location.x,location.y,location.z);
      rotateY(rx);
      //rotateX(ry);
      shape(arrow,0,0,200,6);
      translate(10,0,0);
      shape(arrow,0,0,200,6);
    popMatrix();
  }
  
  public boolean colliding(Collidable c){
    return false;
  }
  
  public boolean colliding(Structure c){
    return !inside(c);
  }
  
  public boolean inside(Structure struct){
      return insideX(struct.x(),struct.w()) && insideY(struct.y(),struct.h()) && insideZ(struct.z(),struct.d());
  }
  
  private boolean insideX(int xx, int ww){
    if(ww>=0){
      return location.x>=xx && location.x+w<=xx+ww;
    } else {
      return location.x>=xx+ww && location.x+w<=xx;
    }
  }
  private boolean insideY(int yy, int hh){
    if(hh>=0){
      return location.y>=yy && location.y+h<=yy+hh;
    } else {
      return location.y>=yy+hh && location.y+h<=yy;
    }
  }
  private boolean insideZ(int zz, int dd){
    if(dd>=0){
      return location.z<=zz && location.z-d>=zz-dd;
    } else {
      return location.z+d>=zz && location.z<=zz-dd;
    }
  }
  
}
