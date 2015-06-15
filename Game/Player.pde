public class Player implements Renderable, Collidable, Collidable2 {
  private float hor,ver; // angles of player's view
  private float x,y,z;
  private int w,h,d;
  private float x2,y2;
  private int speed;
  private PShape bow;
  private int score;
  boolean wasAtDoor;
  Hitbox hitbox;

  public Player(){
    hitbox = new Hitbox(-20,-40,20,40,160,40,0,0,0);
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
    move();
    hitbox.x = x-w/2;
    hitbox.y = y+h/2;
    hitbox.z = z+d/2;
    hitbox.update();
    //arrow();
  }
  
  /*public boolean colHelp(Structure struct){
    if (!(insideX(struct.x(), struct.w()) && insideZ(struct.z(),struct.d()))){
      return false;
    }else{
      return true;
    }
    }*/
  
  public boolean colliding(Collidable e){
    return false;
  }
  
  /**public boolean colliding(Structure c){
    return colHelp(c);
  }**/
  
  public boolean colliding(Structure struct){
      return hitbox.colliding(struct);
  }
  
  public boolean colliding2(Structure struct){
    return hitbox.colliding2(struct);
  }
  
  public void adjustX(int xx, int ww){
    if(hitbox.adjustX(xx,ww)){
      x = hitbox.x+w/2;
    }
  }
  
  public void adjustZ(int zz, int dd){
    if(hitbox.adjustZ(zz,dd)){
      z = hitbox.z-d/2;
    }
  }
  
  private boolean outsideX(int xx, int ww){
    if(ww>=0){
      return x>xx+ww || x+w<xx;
    } else {
      return x+w<xx+ww || x>xx;
    }
  }
  private boolean outsideY(int yy, int hh){
    if(hh>=0){
      return y>yy+hh || y+h<yy;
    } else {
      return y+h<yy+hh || y>yy;
    }
  }
  private boolean outsideZ(int zz, int dd){
    if(dd>=0){
      return z>zz+dd || z+d<zz;
    } else {
      return z+d<zz+dd || z>zz;
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

  public void see(){
    camera(x,0,z,x+cos(ver)*cos(hor),0+sin(ver),z+cos(ver)*sin(hor),0,1,0); 
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
  
  public Arrow launch(){
    return new Arrow(x,y+40,z,hor,ver);
  }

  public int score(){
    return score;
  }
  
  public void incScore(){
    score++;
    System.out.println(score);
  }

}

class Arrow implements Collidable, Renderable, Collidable2 {
  PShape arrow;
  Hitbox hitbox;
  int speed = 60;
  PVector location;
  PVector dLocation;
  PVector hComponent;
  PVector vComponent;
  PVector gravity;
  float rx,ry,rz;
  int w, h, d;
  boolean wasAtDoor;
  boolean dead;
  StNode lastLocation;
  
  public Arrow(float x, float y, float z, float hor, float ver){
    location = new PVector(x,y,z);
    dLocation = new PVector();
    dLocation.set(location);
    gravity = new PVector(0,0.5,0);
    hComponent = new PVector(speed*cos(ver)*cos(hor),0,speed*cos(ver)*sin(hor));
    vComponent = new PVector(0,speed*sin(ver),0);
    arrow = loadShape("arrow.OBJ");
    rx = -hor;
    ry = ver;
    w = 20;
    h = 20;
    d = 20;
    hitbox = new Hitbox(x,y,z,w,h,d,0,rx+PI/2,0);
    wasAtDoor = false;
    dead = false;
  }
  
  public void update(){
    pushMatrix();
      translate(location.x,location.y,location.z);
      rotateY(rx);
      rotateZ(rz);
      shape(arrow,0,0,200,6);
      rotateX(PI/2);
      shape(arrow,0,0,200,6);
    popMatrix();
    hitbox.locate(location);
    hitbox.update();
  }
  
  public boolean colliding(Collidable c){
    return false;
  }
  
  public boolean colliding(Structure c){
    return hitbox.colliding(c);
  }
  
  public boolean colliding2(Structure c){
    return hitbox.colliding2(c);
  }
  
  public boolean colliding2(Hitbox h){
    return hitbox.colliding2(h);
  }
  
  public void move(){
    vComponent.add(gravity);
    location.add(hComponent);
    location.add(vComponent);
    PVector a = PVector.sub(location,dLocation);
    dLocation.set(location);
    rz = atan(a.y/(sqrt(pow(a.z,2)+pow(a.x,2))));
  }
  
}
