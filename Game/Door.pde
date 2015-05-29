public class Door extends Structure {

  private Prism[] rect;

  public Door(int x, int y, int z){
    wide = 100;
    tall = 200;
    deep = 10;
    rect = new Prism[4];
    rect[0]= new Prism(x,y,z,wide,deep); //top
    rect[1]= new Prism(x,y,z,deep,tall); //left
    rect[2]= new Prism(x,y,z-tall,wide,deep); //bottom
    rect[3]= new Prism(x,y,z-wide,deep,tall); //right 
  }
 
 /* 
  public void update(){
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
   */
   
   public void update(){
     pushMatrix();
       rotateY(PI/2);
       walls[1].update();
     popMatrix();
     pushMatrix();
       rotateY(PI);
       walls[3].update();
     popMatrix();
 }
   
}
