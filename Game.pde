int x,y = 0;

void setup(){
  size(640,480,P3D);
  stroke(255);
  noFill();
  loop();
}

void draw(){
  background(0);
  beginCamera();
    camera();
    rotateY(pmouseX/50.);
    rotateX(pmouseY/50.);
  endCamera();
  box(100);
}

void 
