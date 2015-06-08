public class Prism extends Structure{
  
  private Wall[] walls;
  private float angle;
  
  public Prism(int x, int y, int z, int w, int h, int d){
    tall = h;
    deep = d;
    wide = w;
    this.x = x;
    this.y = y;
    this.z = z;
    
    walls = new Wall[6];
    /*
    walls[0]= new Wall(x,y,z,wide,deep,-PI/2,0,0); //top
    walls[1]= new Wall(x,y,z,wide,tall,0,0,0); //front
    walls[2]= new Wall(x,y,z,deep,tall,0,PI/2,0); //left
    walls[3]= new Wall(x,y+tall,z,wide,deep,-PI/2,0,0); //bottom
    walls[4]= new Wall(x,y,z-deep,wide,tall,0,0,0); //back
    walls[5]= new Wall(x+wide,y,z,deep,tall,0,PI/2,0); //right
    */
    
    walls[0]= new Wall(0,0,0,wide,deep,-PI/2,0,0); //top
    walls[1]= new Wall(0,0,0,wide,tall,0,0,0); //front
    walls[2]= new Wall(0,0,0,deep,tall,0,PI/2,0); //left
    walls[3]= new Wall(0,tall,0,wide,deep,-PI/2,0,0); //bottom
    walls[4]= new Wall(0,0,-deep,wide,tall,0,0,0); //back
    walls[5]= new Wall(wide,0,0,deep,tall,0,PI/2,0); //right
  }
  
  public void update(){
    pushMatrix();
    translate(x,y,z);
    walls[0].update();
    walls[1].update();
    walls[2].update();
    walls[3].update();
    walls[4].update();
    walls[5].update();
    popMatrix();
  }
  
}
    
    
