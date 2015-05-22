World world;
Interface hud;
Menu menu;

boolean[] keys = new boolean[128];
final int W = 87;
final int A = 65;
final int S = 83;
final int D = 68;

void setup(){
  size(640,480,P3D);
  stroke(255);
  noFill();
  loop();
}

void draw(){
  background(0);
    camera(x,y,z,x+cos(ver)*cos(hor),y+sin(ver),z+cos(ver)*sin(hor),0,1,0);  
    move();
  box(100);
}

void keyPressed(){
    keys[keyCode]=true;
}

void keyReleased(){
    keys[keyCode]=false;
}
