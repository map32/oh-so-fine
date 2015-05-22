int x,y,z = 0;
float hor = PI/2;
float ver = 0;
float x2,y2=0;
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
    camera(x,y,z,x+cos(hor),y+sin(ver),z+sin(hor),0,1,0);  
    move();
  box(100);
}

void keyPressed(){
    keys[keyCode]=true;
}

void keyReleased(){
    keys[keyCode]=false;
}

void move(){
  if(keys[W]==true)
      z+=2;
  if(keys[A]==true)
      x+=2;
  if(keys[S]==true)
      z-=2;
  if(keys[D]==true)
      x-=2;
}

void mouseMoved(){
  float dx = x2-mouseX;
  float dy = y2-mouseY;
  hor += dx/width*2*PI;
  ver += dy/height*2*PI;
  x2=mouseX;
  y2=mouseY;
  //System.out.println(cos(hor) +" "+sin(ver));
}
