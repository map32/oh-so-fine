public class Wall implements Renderable{
  int x, y, z;
  float rx, ry, rz = 0;
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
  
  public Wall(int xpos, int ypos, int zpos, int wid, int hei, float xangle, float yangle, float zangle){
    this(xpos,ypos,zpos,wid,hei);
    rx = xangle;
    ry = yangle;
    rz = zangle;
  }
  
  
  public Wall(){
    rect(width * 0.25, height * 0.25, width * 0.5, height * 0.5);
  }
  
  public void update(){
    pushMatrix();
      translate(x,y,z);
      if(rx != 0)
        rotateX(rx);
      if(ry != 0)
        rotateY(ry);
      if(rz != 0)
        rotateZ(rz);
      rect(0,0,w,h);
    popMatrix();
  }
}
    
