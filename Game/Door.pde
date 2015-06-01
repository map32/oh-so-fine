public class Door extends Structure {

  private Prism[] rect;
  private float angle;

  public Door(int x, int y, int z, float angle){
    wide = 100;
    tall = 200;
    deep = 10;
    this.angle = angle;
    
    rect = new Prism[4];
    if(angle == -PI/2){
      rect[0]= new Prism(x-deep/2,y,z,wide,deep,deep,angle); //top
      rect[1]= new Prism(x-deep/2,y,z,deep,tall,deep,angle); //left
      rect[2]= new Prism(x-deep/2,y+tall-deep,z,wide,deep,deep,angle); //bottom
      rect[3]= new Prism(x-deep/2,y,z+wide-deep,deep,tall,deep,angle); //right 
    } else {
      rect[0]= new Prism(x,y,z+deep/2,wide,deep,deep,angle); //top
      rect[1]= new Prism(x,y,z+deep/2,deep,tall,deep,angle); //left
      rect[2]= new Prism(x,y+tall-deep,z+deep/2,wide,deep,deep,angle); //bottom
      rect[3]= new Prism(x+wide-deep,y,z+deep/2,deep,tall,deep,angle); //right 
    }
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
     rect[0].update();
     rect[1].update();
     rect[2].update();
     rect[3].update();
     popMatrix();
   }
   
}
