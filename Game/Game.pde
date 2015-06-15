World world;
Interface hud;
Menu menu;


boolean[] keys = new boolean[256];
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
  colorMode(HSB,100,100,100,100);
  world = new World();
  hud = new Interface();
  menu = new Menu();
}

void draw(){
  background(0);
  if(world.arrowsN<=0){
    hud.lose(world.score,world.arrowsN);
  } else {
    noFill();
    world.update();
    hud.update(world.score,world.arrowsN);
  }
  menu.update();
}

void keyPressed(){
    keys[keyCode]=true;
    menu.keyPressed();
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

void restart(){
  world = new World();
}

void mouseReleased(){
  pressLock = false;
}
