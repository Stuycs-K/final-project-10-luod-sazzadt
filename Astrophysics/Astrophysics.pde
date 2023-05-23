import peasy.*;
PeasyCam cam;
Star sun;
void setup(){
  smooth();
  lights();
  size(800, 800, P3D);
  cam = new PeasyCam(this, width/2, height/2, 0, 600);
  cam.setMinimumDistance(400);
  cam.setMaximumDistance(800);
  sun = new Star(SPHERE, "sun.jpg", 140);
}
void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2, 0);
  sun.display();
  popMatrix();
}
