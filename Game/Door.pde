public class Door extends Structure {

  private Prism[] rect;
  private Prism truerect;
  private int angle;

  public Door(int x, int y, int z, int angle){
    wide = 100;
    tall = 200;
    deep = 10;
    this.angle = angle;
    
    rect = new Prism[4];
    if(angle == 1){
      rect[0]= new Prism(x-deep/2,y,z+wide,deep,deep,wide); //top
      rect[1]= new Prism(x-deep/2,y,z+deep,deep,tall,deep); //left
      rect[2]= new Prism(x-deep/2,y+tall-deep,z+wide,deep,deep,wide); //bottom
      rect[3]= new Prism(x-deep/2,y,z+wide-deep+deep,deep,tall,deep); //right
      deep = 20;
      this.x = x-deep/2;
      this.y = y;
      this.z = z;
      int temp = wide;
      wide = deep;
      deep = -temp;
    } else if(angle == 3){
      rect[0]= new Prism(x-deep/2,y,z+wide,deep,deep,wide); //top
      rect[1]= new Prism(x-deep/2,y,z+deep,deep,tall,deep); //left
      rect[2]= new Prism(x-deep/2,y+tall-deep,z+wide,deep,deep,wide); //bottom
      rect[3]= new Prism(x-deep/2,y,z+wide,deep,tall,deep); //right 
      
      deep = 20;
      this.x = x-deep/2;
      this.y = y;
      this.z = z;
      int temp = wide;
      wide = deep;
      deep = -temp;
    } else {
      rect[0]= new Prism(x,y,z+deep/2,wide,deep,deep); //top
      rect[1]= new Prism(x,y,z+deep/2,deep,tall,deep); //left
      rect[2]= new Prism(x,y+tall-deep,z+deep/2,wide,deep,deep); //bottom
      rect[3]= new Prism(x+wide-deep,y,z+deep/2,deep,tall,deep); //right 
      deep = 20;
      this.x = x;
      this.y = y;
      this.z = z+deep/2;
    }
    truerect = new Prism(this.x,this.y,this.z,wide,tall,deep);
    
  }
 

   public void update(){
     pushMatrix();

     rect[0].update();
     rect[1].update();
     rect[2].update();
     rect[3].update();
     //truerect.update();
     popMatrix();
   }
   
}
