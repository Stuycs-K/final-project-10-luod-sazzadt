//Slider test1;
Star sun;
int DELAY = 2;

void setup(){
  smooth();
  lights();
  size(1000, 1000);
  //test1 = new Slider(400, 200, 100, 20, 0, 10, "hi"); 
  //test1.display();
  sun = new Star(ELLIPSE, 140, (float) (1.989 * Math.pow(10, 30)), 5772);
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
  rect(width / 8, height / 8, 250, 150);
  sun.displayData(width / 8, height / 8);
  stroke(0);
  sun.display(width / 2, height / 2);
  if(frameCount % 4 == 0) {
    tick();
  }
  sun.rotate();
  
}
