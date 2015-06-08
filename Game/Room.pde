import java.util.Random;

public class Room extends Structure{
  private Wall[] walls;
  private Door doors;

  public Room(int xx, int yy, int zz, int w, int t, int d){
    this(xx,yy,zz,w,t,d,0);
  }

  public Room(int xx, int yy, int zz, int w, int t, int d, int dr){
    branch = 1; //max of 1 door
    wide = w;
    tall = t;
    deep = d;
    direction = dr;
    
    if(t==-1) //randomize dimensions and coordinates if they equal -1
      tall = r.nextInt(80)+200;
    if(d==-1)
      deep = r.nextInt(600)+200;
    if(w==-1)
      wide = r.nextInt(600)+200;
    if(xx==-1)
      x = r.nextInt(10000)-5000;
    if(yy==-1)
      y = r.nextInt(10000)-5000;
    if(zz==-1)
      z = r.nextInt(10000)-5000;
    
    if(dr==1){ // set the directions of hallway
      int temp = -wide;
      wide = -deep;
      deep = temp;
    } else if(dr == 2){
      deep = -deep;
    } else if(dr == 3){
      int temp = -wide;
      wide = deep;
      deep = temp;
    }
    
    this.x = xx; //assign top-left-front coordinate of Room
    this.y = yy-tall+120;
    this.z = zz;
    
    walls = new Wall[6]; //assign 3-angles and coordinates of each wall
    walls[0]= new Wall(x,y,z,wide,deep,-PI/2,0,0); //top
    walls[1]= new Wall(x,y,z,wide,tall); //front
    walls[2]= new Wall(x,y,z,deep,tall,0,PI/2,0); //left
    walls[3]= new Wall(x,y+tall,z,wide,deep,-PI/2,0,0); //bottom
    walls[4]= new Wall(x,y,z-deep,wide,tall); //back
    walls[5]= new Wall(x+wide,y,z,deep,tall,0,PI/2,0); //right
    
    branchP = new int[1][4]; //coordinate and angle of door
    branchP[0][3]=0;
    branchP[0][0]=x+wide/2;
    branchP[0][1]=y+(tall-200);
    branchP[0][2]=z-deep;
    if (dr==1) {
      branchP[0][0]=x+wide;
      branchP[0][1]=y+(tall-200);
      branchP[0][2]=z-deep/2;
    } else if (dr==3) {
      branchP[0][0]=x+wide;
      branchP[0][1]=y+(tall-200);
      branchP[0][2]=z-deep/2;
    }
    
    doors = new Door(branchP[0][0],branchP[0][1],branchP[0][2],direction);
  }
  
  public void update(){
    walls[0].update();
    walls[1].update();
    walls[2].update();
    walls[3].update();
    walls[4].update();
    walls[5].update();
    doors.update();
  
  }
  
  /*public boolean colliding(Collidable e){
    if player.inside(){
      for (int i = 1; i < 3 i++){
        if (walls[i].x > Player.getX() 
      }*/

}
