import peasy.*;
Slider test1;
//PeasyCam cam;
Star sun;
Particle p1;
float cloudDensity;

void setup(){
  //smooth();
  //lights();
  size(800, 800, P3D);
  test1 = new Slider(400, 200, 120, 20, 0, 10, "hi"); 
  test1.display();
  p1 = new Particle (100, 100, 100, 3);
  //cam = new PeasyCam(this, width/2, height/2, 0, 600);
  //cam.setMinimumDistance(400);
  //cam.setMaximumDistance(800);
  //sun = new Star(SPHERE, "sun.jpg", 140);
}

void draw(){
  background(0);
  if (mousePressed){
    test1.changed(mouseX, mouseY);
  }
  test1.display();
  cloudDensity = test1.getValue();
  if (mousePressed){
    camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  }
  p1.display();
  //pushMatrix();
  //translate(width/2, height/2, 0);
  //sun.display();
  //popMatrix();
  
}
