public class Player implements Renderable, Collidable {
  private float hor,ver; // angles of player's view
  private float x,y,z;
  private int w,h,d;
  private float x2,y2;

  public Player(){
    x=0;
    y=-40;
    z=0;
    w=40;
    d=40;
    h=160;
    hor=0;
    ver=0;
  }

  public void update(){
    camera(x,0,z,x+cos(ver)*cos(hor),0+sin(ver),z+cos(ver)*sin(hor),0,1,0);  
    move();
  }
  
  public boolean colliding(Collidable e){
    return false;
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
      inc(5,0);
  if(keys[A]==true)
      inc(5,-PI/2);
  if(keys[S]==true)
      inc(5,PI);
  if(keys[D]==true)
      inc(5,-3*PI/2);
  }

  public void inc(float forward, float angle){
    x += forward*cos(hor+angle);
    z += forward*sin(hor+angle);
    System.out.println(x+" "+y+" "+z+"");
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
  

}
