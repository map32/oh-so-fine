//World world;
//Interface hud;
//Menu menu;
Player player;
Room roomy;

boolean[] keys = new boolean[128];
final int W = 87;
final int A = 65;
final int S = 83;
final int D = 68;

void setup(){
  size(640,480,P3D);
  stroke(255);
  player = new Player();
  noFill();
  loop();
  Room roomy = new Room();
}

void draw(){
  background(0);
  player.update();
  roomy.update();
  box(100);
}

void keyPressed(){
    keys[keyCode]=true;
}

void keyReleased(){
    keys[keyCode]=false;
}

void mouseMoved(){
    player.mousemove();
  }
