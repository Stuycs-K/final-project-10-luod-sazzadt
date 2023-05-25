import java.util.*;
Slider densitySlider;
Slider timeSlider;
//PeasyCam cam;
//Star sun;
float cloudDensity;
MolecularCloud molCloud;
Star sun;
int DELAY = 2;
Button setUp;
boolean doneSetUp = false;
//Particle p1;

void setup(){
  size(1000, 750);
  densitySlider = new Slider(800, 625, 130, 20, 0, 100, "Molecular Cloud Density", true); 
  densitySlider.display();
  timeSlider = new Slider(50, 625, 350, 20, 0, 200000, "Time (in thousands of years)", false);
  timeSlider.display();
  cloudDensity = densitySlider.getValue();
  molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  molCloud.display();
  //sun = new Star(ELLIPSE, 140, (float) (1.989 * Math.pow(10, 30)), 5772);
  setUp = new Button(800, 700, "Finish Set Up");
  setUp.display();
  doneSetUp = false;
}

void tick() {
  sun.updateMass(sun.getMass() * 0.998);
  sun.updateTemp(sun.getTemp() * 0.9996);
}

void draw(){
  background(0);
  cloudDensity = densitySlider.getValue();
  if (mousePressed){
    densitySlider.changed(mouseX, mouseY);
    timeSlider.changed(mouseX, mouseY);
  }
  densitySlider.display();
  timeSlider.display();
  if (cloudDensity != densitySlider.getValue()){
    molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  }
  molCloud.display();
  setUp.run();
}
