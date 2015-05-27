public class Wall implements Renderable{
  int x, y, z;
  int w,h;
  
  public Wall(int xpos, int ypos, int wid, int hei){
   x = xpos;
   y = ypos;
   w = wid;
   h = hei;
  }
  
  public Wall(int xpos, int ypos, int zpos, int wid, int hei){
    this(xpos,ypos,wid,hei);
    z = zpos;
  }
  
  
  public Wall(){
    rect(width * 0.25, height * 0.25, width * 0.5, height * 0.5);
  }
  
  public void update(){
    pushMatrix();
      translate(x,y,z);
      rect(0,0,w,h);
    popMatrix();
  }
}
    
