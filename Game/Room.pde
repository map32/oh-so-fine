public class Room extends Structure{
  
  private Wall[] walls;
  
  public Room(){
    Random r = new Random();
    tall = r.nextInt(80)+80;
    deep = r.nextInt(600)+200;
    wide = r.nextInt(600)+200;
    this(wide,tall,deep);
  }

  public Room(int x, int y, int z){
    
  }

}
