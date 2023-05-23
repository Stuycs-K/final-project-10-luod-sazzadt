import peasy.*;
Slider test1;
PeasyCam cam;
Star sun;

void setup(){
  smooth();
  lights();
  size(800, 800, P3D);
  test1 = new Slider(400, 200, 100, 20, 0, 10, "hi"); 
  test1.display();
  cam = new PeasyCam(this, width/2, height/2, 0, 600);
  cam.setMinimumDistance(400);
  cam.setMaximumDistance(800);
  sun = new Star(SPHERE, "sun.jpg", 140);
}

void draw(){
  background(255);
  
  if (mousePressed){
    test1.changed(mouseX, mouseY);
  }
  test1.display();
  
  pushMatrix();
  translate(width/2, height/2, 0);
  sun.display();
  popMatrix();
  
}
