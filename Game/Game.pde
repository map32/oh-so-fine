World world;
//Interface hud;
//Menu menu;


boolean[] keys = new boolean[128];
final int W = 87;
final int A = 65;
final int S = 83;
final int D = 68;
boolean pressLock;

void setup(){
  size(640,480,P3D);
  stroke(255);
  noFill();
  loop();
  world = new World();
}

void draw(){
  background(0);
  world.update();
}

void keyPressed(){
    keys[keyCode]=true;
}

void keyReleased(){
    keys[keyCode]=false;
}

void mouseMoved(){
    world.mousemove();
}

void mousePressed(){
  if(!pressLock) {
    pressLock = true;
    world.launch();
  }
}

void mouseReleased(){
  pressLock = false;
}
