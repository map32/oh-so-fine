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
    return (x>=struct.x() && x+w<=struct.x()+struct.w() && y>=struct.y() && y+h<=struct.y()+struct.h() && z<=struct.z() && z-d>=struct.z()-struct.d());
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
    System.out.println(hor/PI/2*360 +" "+ver/PI/2*360);
  }

}
