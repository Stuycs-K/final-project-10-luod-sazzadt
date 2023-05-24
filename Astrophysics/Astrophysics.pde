import peasy.*;
//Slider test1;
PeasyCam cam;
Star sun;
int DELAY = 2;
int[] RED = new int[]{255, 0, 0};

void setup(){
  smooth();
  lights();
  size(1000, 1000, P3D);
  //test1 = new Slider(400, 200, 100, 20, 0, 10, "hi"); 
  //test1.display();
  cam = new PeasyCam(this, width/2, height/2, 0, 600);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(800);
  sun = new Star(SPHERE, "sun.jpg", 140, (float) (1.989 * Math.pow(10, 30)), 5772);
}

void tick() {
  sun.updateMass(sun.getMass() * 0.998);
  sun.updateTemp(sun.getTemp() * 0.9996);
}

void draw(){
  background(0);
  
  /*
  if (mousePressed){
    test1.changed(mouseX, mouseY);
  }
  */
  //test1.display();
  fill(0, 255, 0);
  noStroke();
  rect(width/8, height/8, 250, 150);
  sun.displayData(width / 8, height / 8);
  stroke(0);
  pushMatrix();
  translate(width/2, height/2, 0);
  sun.display();
  strokeWeight(8);
  stroke(255);
  line(0, 0, 0, 0, 0, 1000);
  line(0, 0, 0, 0, -1000, 0);
  line(0, 0, 0, 1000, 0, 0);
  strokeWeight(4);
  popMatrix();
  boolean expanding = true;
  if (frameCount % DELAY == 0 && (frameCount % 200) < 100) {
    sun.expand();
  }
  else if(frameCount % DELAY == 0 && (frameCount % 200) > 100) {
    sun.contract();
  }
  if(frameCount % 4 == 0) {
    tick();
  }
  sun.rotate();
}
