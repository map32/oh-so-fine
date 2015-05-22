public class Player implements Renderable, Collidable, Movable {
  private float hor,ver; // angles of player's view
  private float lastx, lasty;

  public class Player(){
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
  
  public void move(){
  if(keys[W]==true)
      inc(5,0);
  if(keys[A]==true)
      inc(5,PI/2);
  if(keys[S]==true)
      inc(5,PI);
  if(keys[D]==true)
      inc(5,3*PI/2);
  }

  public void inc(float forward, float angle){
    x += forward*cos(hor+angle);
    z -= forward*sin(hor+angle);
  }
  
  void mouseMoved(){
    float dx = x2-mouseX;
    float dy = y2-mouseY;
    hor -= dx/width*2*PI;
    ver += dy/height*2*PI;
    x2=mouseX;
    y2=mouseY;
    //System.out.println(cos(hor) +" "+sin(ver));
  }

}
