public class Hitbox implements Collidable{
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
    translate(0,0,-deep/2);
    box(wide,tall,deep);
    popMatrix();
  }
  
  public void locate(PVector l){
    x = l.x;
    y = l.y;
    z = l.z;
  }
  
  
  public boolean colliding(Structure struct){
    //System.out.println(overlapX(struct.x(),struct.w())+" "+overlapY(struct.y(),struct.h())+" "+overlapZ(struct.z(),struct.d()));
    return overlapX(struct.x(),struct.w()) && overlapY(struct.y(),struct.h()) && overlapZ(struct.z(),struct.d());
  }
  
  private boolean insideX(int xx, int ww){
    if(ww>=0){
      return x>=xx && x+wide<=xx+ww;
    } else {
      return x>=xx+ww && x+wide<=xx;
    }
  }
  private boolean insideY(int yy, int hh){
    if(hh>=0){
      return y>=yy && y+tall<=yy+hh;
    } else {
      return y>=yy+hh && y+tall<=yy;
    }
  }
  private boolean insideZ(int zz, int dd){
    if(dd>=0){
      return z<=zz && z-deep>=zz-dd;
    } else {
      return z+deep>=zz && z<=zz-dd;
    }
  }
  
  private boolean overlapX(int xx, int ww){
    //System.out.println(x +" "+wide+" "+xx+" "+ww+"x");
    if(ww>=0){
      return x+wide>xx && x<xx+ww;
    } else {
      return x+wide>xx+ww && x<xx;
    }
  }
  private boolean overlapY(int yy, int hh){
    //System.out.println(y +" "+tall+" "+yy+" "+hh+"y");
    if(hh>=0){
      return y+tall>yy && y<yy+hh;
    } else {
      return y+tall>yy+hh && y<yy;
    }
  }
  private boolean overlapZ(int zz, int dd){
    //System.out.println(z +" "+deep+" "+zz+" "+dd+"z");
    if(dd>=0){
      return z+deep>zz-dd && z<zz;
    } else {
      return z+deep>zz && z<zz-dd;
    }
  }

}
