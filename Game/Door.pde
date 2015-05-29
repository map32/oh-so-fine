public class Door extends Structure {

  private Wall[] walls;

  public Door(){
    wide = 100;
    tall = 300;
    deep = 10;
    walls = new Walls[4];
    walls[0]= new Wall(x,y,z,wide,deep); //top
    walls[1]= new Wall(x,y,z,deep,tall); //left
    walls[2]= new Wall(x,y,z+deep,wide,deep); //bottom
    walls[3]= new Wall(x,y,z+deep,deep,tall); //right 
  }
  
  public update(){
    pushMatrix();
    rotateY(PI/2);
    walls[1].update();
    translate(100, 0, 0);
    walls[3].update();
    popMatrix();
    pushMatrix();
    rotateY(PI/2);
    rotateZ(PI/2);
    walls[0].update();
    translate(0,100,0);
    walls[2].update();
    popMatrix();
   }
   
}
