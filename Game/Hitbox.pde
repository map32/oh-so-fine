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
    translate(wide/2,0,-deep/2);
    box(wide,tall,deep);
    popMatrix();
  }
  
  public void locate(PVector l){
    x = l.x;
    y = l.y;
    z = l.z;
  }
  
  
  public boolean colliding2(Structure struct){
    //System.out.println(overlapX(struct.x(),struct.w())+" "+overlapY(struct.y(),struct.h())+" "+overlapZ(struct.z(),struct.d()));
    return (overlapX(struct.x(),struct.w()) && overlapY(struct.y(),struct.h()) && overlapZ(struct.z(),struct.d()));
  }
  
  public boolean colliding2(Hitbox h){
    //System.out.println(overlapX(struct.x(),struct.w())+" "+overlapY(struct.y(),struct.h())+" "+overlapZ(struct.z(),struct.d()));
    return (overlapX(h.x,h.wide) && overlapY(h.y,h.tall) && overlapZ(h.z,h.deep));
  }
  
  public boolean colliding(Structure struct){
    //System.out.println(overlapX(struct.x(),struct.w())+" "+overlapY(struct.y(),struct.h())+" "+overlapZ(struct.z(),struct.d()));
    return insideX(struct.x(),struct.w()) && insideY(struct.y(),struct.h()) && insideZ(struct.z(),struct.d());
  }
  
  public boolean insideX(float xx, int ww){
    if(ww>=0){
      return x>=xx && x+wide<=xx+ww;
    } else {
      return x>=xx+ww && x+wide<=xx;
    }
  }
  public boolean insideY(float yy, int hh){
    if(hh>=0){
      return y>=yy && y+tall<=yy+hh;
    } else {
      return y>=yy+hh && y+tall<=yy;
    }
  }
  public boolean insideZ(float zz, int dd){
    if(dd>=0){
      return z<=zz && z-deep>=zz-dd;
    } else {
      return z-deep>=zz && z<=zz-dd;
    }
  }
  
  private boolean overlapX(float xx, int ww){
    //System.out.println(x +" "+wide+" "+xx+" "+ww+"x");
    if(ww>=0){
      return x+wide>xx && x<xx+ww;
    } else {
      return x+wide>xx+ww && x<xx;
    }
  }
  private boolean overlapY(float yy, int hh){
    //System.out.println(y +" "+tall+" "+yy+" "+hh+"y");
    if(hh>=0){
      return y+tall>yy && y<yy+hh;
    } else {
      return y+tall>yy+hh && y<yy;
    }
  }
  private boolean overlapZ(float zz, int dd){
    //System.out.println(z +" "+deep+" "+zz+" "+dd+"z");
    if(dd>=0){
      return z>zz-dd && z-deep<zz;
    } else {
      return z>zz && z-deep<zz-dd;
    }
  }
  
  public boolean adjustX(int xx, int ww){
    if(ww>=0){
      if(x<xx){
        x=xx;
        return true;
        //x+=20;
      } else if(x+wide>xx+ww){
        x=-wide+xx+ww;
        //x=x-wide/2;
        return true;
        //x-=20;
      }
    } else {
      if(x<xx+ww){
        x=xx+ww;
        return true;
        //x+=20;
      } else if(x+wide>xx){
        x=-wide+xx;
        return true;
        //x-=20;
      }
    }
    return false;
  }
  
  public boolean adjustY(int yy, int hh){
    if(hh>=0){
      if(y<yy){
        y=yy;
        System.out.println("1");
        return true;
      } else if(y+tall>yy+hh){
        y=-tall+yy+hh;
        System.out.println("2");
        return true;
      }
    } else {
      if(y<yy+hh){
        y=yy+hh;
        System.out.println("3");
        return true;
      } else if(y+tall>yy){
        y=-tall+yy;
        System.out.println("4");
        return true;
      }
    }
    return false;
  }
  
  public boolean adjustZ(int zz, int dd){
    if(dd>=0){
      if(z>zz){
        System.out.println("a");
        z=zz;
        return true;
      }
      else if(z-deep<zz-dd){
        System.out.println("b");
        z=deep+zz-dd;
        //z=z+deep/2;
        return true;
      }
    } else {
      if(z-deep<zz){
        System.out.println("c");
        z-=z-deep-zz;
        return true;
      }
      else if(z>zz-dd){
        System.out.println("d");
        z=zz-dd;
        return true;
      }
    }
    return false;
  }

}
