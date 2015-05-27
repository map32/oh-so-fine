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
      
    walls = new Wall[6];
    walls[0]= new Wall(x,y,z,wide,deep); //top
    walls[1]= new Wall(x,y,z,wide,tall); //back
    walls[2]= new Wall(x,y,z,deep,tall); //left
    walls[3]= new Wall(x,y,z+deep,wide,deep); //bottom
    walls[4]= new Wall(x,y,z+deep,wide,tall); //front
    walls[5]= new Wall(x,y,z+deep,deep,tall); //right
    
  }
  
  public void update(){
    pushMatrix();
      walls[1].update();
      walls[4].update();
      rotateY(PI/2);
      walls[2].update();
      walls[5].update();
    popMatrix();
    pushMatrix();
      rotateX(PI/2);
      walls[0].update();
      walls[3].update();
    popMatrix();
  
  }

}
