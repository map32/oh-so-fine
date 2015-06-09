public class Hallway extends Structure{
  private Wall[] walls;
  private Door[] doors;
  
  public Hallway(){
    this(-1,-1,-1,-1,-1,-1);
  }
  
  public Hallway(int xx, int yy, int zz, int w, int t, int d){
    this(xx,yy,zz,w,t,d,0);
  }

  public Hallway(int xx, int yy, int zz, int w, int t, int d, int angle){ //xyz are coodinates, wtd are dimensions
    wide = w;
    tall = t;
    deep = d;
    direction = angle;

    if(t==-1) //randomly assign coordinates and dimensions
      tall = r.nextInt(100)+200;
    if(d==-1)
      deep = r.nextInt(2000)+4000;
    if(w==-1)
      wide = r.nextInt(100)+200;
    if(xx==-1)
      x = r.nextInt(10000)-5000;
    if(yy==-1)
      y = r.nextInt(10000)-5000;
    if(zz==-1)
      z = r.nextInt(10000)-5000;
      
    if(angle==1){ // set the directions of hallway
      int temp = -wide;
      wide = -deep;
      deep = temp;
    } else if(angle == 2){
      deep = -deep;
    } else if(angle == 3){
      int temp = -wide;
      wide = deep;
      deep = temp;
    }
    this.x = xx; //top-left-front coordinate
    this.y = yy-(tall-120);
    this.z = zz;
      
    walls = new Wall[6]; // assign coordinates and dimensions on walls
    walls[0]= new Wall(this.x,this.y,this.z,wide,deep,-PI/2,0,0); //top
    walls[1]= new Wall(this.x,this.y,this.z,wide,tall); //front
    walls[2]= new Wall(this.x,this.y,this.z,deep,tall,0,PI/2,0); //left
    walls[3]= new Wall(this.x,this.y+tall,this.z,wide,deep,-PI/2,0,0); //bottom
    walls[4]= new Wall(this.x,this.y,this.z-deep,wide,tall); //back
    walls[5]= new Wall(this.x+wide,this.y,this.z,deep,tall,0,PI/2,0); //right
    
    branch = r.nextInt(3)+4; //randomly assign number of doors, 3-6 inclusive
    branchP = new int[branch][4];
    branchP[0][0]=x+wide/2; // first door is opposite, not sideways
    branchP[0][1]=y+tall-200;
    branchP[0][2]=z-deep;
    branchP[0][3]=0;
    if (angle==1) {
      branchP[0][0]=x+wide;
      branchP[0][1]=y+(tall-200);
      branchP[0][2]=z-deep/2;
    } else if (angle==3) {
      branchP[0][0]=x+wide;
      branchP[0][1]=y+(tall-200);
      branchP[0][2]=z-deep/2;
    }
    for(int i=1;i<branch/2;i++){ //left side doors
      branchP[i][3]=1;
      if(angle==0){
        branchP[i][0]=x;
        branchP[i][1]=y+tall-200;
        branchP[i][2]=z-i*deep/(branch/2);
      } else if(angle==2){
        branchP[i][0]=x+wide;
        branchP[i][1]=y+tall-200;
        branchP[i][2]=z-i*deep/(branch/2);
      } else if (angle==1) {
        System.out.println(0+" "+wide+" "+deep);
        branchP[i][0]=x+i*wide/(branch/2);
        branchP[i][1]=y+(tall-200);
        branchP[i][2]=z-deep;
      } else if (angle==3) {
        System.out.println(1+" "+wide+" "+deep);
        branchP[i][0]=x+i*wide/(branch/2);
        branchP[i][1]=y+(tall-200);
        branchP[i][2]=z;
      }
    } for(int i=branch/2;i<branch;i++){ //right side doors
      branchP[i][3]=3;
      if (angle==0){
        branchP[i][0]=x+wide;
        branchP[i][1]=y+tall-200;
        branchP[i][2]=z-(i-branch/2+1)*deep/(branch/2+1);
      } else if(angle==2) {
        branchP[i][0]=x;
        branchP[i][1]=y+tall-200;
        branchP[i][2]=z-(i-branch/2+1)*deep/(branch/2+1);
      } else if (angle==1) {
        branchP[i][0]=x+(i-branch/2+1)*wide/(branch/2+1);
        branchP[i][1]=y+(tall-200);
        branchP[i][2]=z;
      } else if (angle==3) {
        branchP[i][0]=x+(i-branch/2+1)*wide/(branch/2+1);
        branchP[i][1]=y+(tall-200);
        branchP[i][2]=z-deep;
      }
    }
    doors = new Door[branch];
    for(int i=0;i<branch;i++){
      doors[i] = new Door(branchP[i][0],branchP[i][1],branchP[i][2],(branchP[i][3]+angle)%4);
      System.out.println((branchP[i][3]+angle)%4+" "+"hi");
    }
    
  }
  
  public void update(){
    walls[0].update();
    walls[1].update();
    walls[2].update();
    walls[3].update();
    walls[4].update();
    walls[5].update();
    for(Door d : doors){
      d.update();
    }
  }

}
