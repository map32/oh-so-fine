public class Objecty implements Collidable2, Renderable{
  Hitbox hitbox;
  PVector movingV;
  StNode lastLocation;
  boolean dead;
  color col;
  
  public Objecty(float x, float y, float z, int size, float rx, float ry, float rz, StNode n){
    Random r = new Random();
    hitbox = new Hitbox(x,y,z,size,size,size,rx,ry,rz);
    movingV = new PVector(r.nextFloat()*10,r.nextFloat()*10,r.nextFloat()*10);
    color = color(r.nextInt(100),100,100,100);
    lastLocation = n;
  }
  
  public void move(){
    hitbox.x += movingV.x;
    hitbox.y += movingV.y;
    hitbox.z += movingV.z;
  }
  
  public void update(){
    pushMatrix();
      //hitbox.update();
      fill(col);
      translate(hitbox.x,hitbox.y,hitbox.z);
      translate(hitbox.wide/2,0,-hitbox.wide/2);
      sphere(hitbox.wide);
    popMatrix();
  }
  
    public boolean colliding(Structure e){
      return hitbox.colliding(e);
    }
    
    public void adjust(Structure e){
        if(!hitbox.insideX(e.x(),e.w())){
          hitbox.adjustX(e.x(),e.w());
          movingV.x = -movingV.x;
        }
        if(!hitbox.insideY(e.y(),e.h())){
          hitbox.adjustY(e.y(),e.h());
          movingV.y = -movingV.y;
        }
        if(!hitbox.insideZ(e.z(),e.d())){
          hitbox.adjustZ(e.z(),e.d());
          movingV.z = -movingV.z;
        }
    }
  
  public boolean colliding2(Structure e){return false;}
  
}
