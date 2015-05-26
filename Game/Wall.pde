public class Wall{
  int x, y;
  
  public Wall(int xpos, int ypos, int wid, int hei){
   x = xpos;
   y = ypos;
   rect(xpos, ypos, wid, hei);
  }
  
  public Wall(){
    rect(width * 0.25, height * 0.25, width * 0.5, height * 0.5);
  }
}
    
