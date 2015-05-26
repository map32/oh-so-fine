import java.util.Random;

public class Room extends Structure{
  
  private Wall[] walls;
  
  public Room(){
    this(-1,-1,-1);
  }

  public Room(int x, int y, int z){
    Random r = new Random();
    if(y==-1)
      tall = r.nextInt(80)+80;
    if(z==-1)
      deep = r.nextInt(600)+200;
    if(x==-1)
      wide = r.nextInt(600)+200;
    walls = new Walls[6](
  }

}
