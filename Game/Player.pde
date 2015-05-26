public class Player implements Renderable, Collidable {
  private float hor,ver; // angles of player's view
  private float lastx, lasty;
  private float x,y,z;
  private float x2,y2;

  public Player(){
    x=0;
    y=0;
    z=0;
    hor=0;
    ver=0;
    lastx=0;
    lasty=0;
  }

  public void update(){
    camera(x,y,z,x+cos(ver)*cos(hor),y+sin(ver),z+cos(ver)*sin(hor),0,1,0);  
    move();
  }
  
  public boolean colliding(Collidable e){
    return false;
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
