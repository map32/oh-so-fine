public class Hitbox {
  float x,y,z;
  int tall,deep,wide;
  float rx,ry,rz;
  
  public Hitbox(float x, float y, float z, int w, int t, int d, float rx, float ry, float rz){
    this.x = x;
    this.y = y;
    this.z = z;
    tall = t;
    deep = d;
    wide = w;
    this.rx = rx;
    this.ry = ry;
    this.rz = rz;
  }
  
  public void update(){
    pushMatrix();
    translate(x,y,z);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    box(wide,tall,deep);
    popMatrix();
  }
  
  public boolean colliding(Collidable c){
    return false;
  }

}
