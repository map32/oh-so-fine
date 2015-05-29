public class Prism extends Structure{
  
  private Wall[] walls;
  
  public Prism(int x, int y, int z, int h, int d, int w){
    tall = h;
    deep = d;
    wide = w;
    
    walls = new Wall[6];
    walls[0]= new Wall(x,y,z,wide,deep); //top
    walls[1]= new Wall(x,y,z,wide,tall); //back
    walls[2]= new Wall(x,y,z,deep,tall); //left
    walls[3]= new Wall(x,y,z-tall,wide,deep); //bottom
    walls[4]= new Wall(x,y,z+deep,wide,tall); //front
    walls[5]= new Wall(x,y,z-wide,deep,tall); //right
  }
  
  public void update(){
    pushMatrix();
      walls[1].update();
      walls[4].update();
      rotateY(-PI/2);
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
    
    
