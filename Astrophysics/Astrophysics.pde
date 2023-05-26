import java.util.*;
//Created Objects
Slider densitySlider;
Slider timeSlider;
MolecularCloud molCloud;
Star sun;
Button setUp;

//Global Variables
float cloudDensity;
float time = 0;
int DELAY = 3;
boolean doneSetUp = false;
boolean timeUp = false;

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
  if(frameCount % DELAY == 0) {
    timeSlider.increment(1000);
  }
}

void draw(){
  background(0);
  cloudDensity = densitySlider.getValue();
  time = timeSlider.getValue();
  if (mousePressed){
    densitySlider.changed(mouseX, mouseY);
    timeSlider.changed(mouseX, mouseY);
  }
  tick();
  densitySlider.display();
  timeSlider.display();
  if (cloudDensity != densitySlider.getValue()){
    molCloud = new MolecularCloud(densitySlider.getValue(), 300);
    time = 0;
    timeSlider = new Slider(50, 625, 350, 20, 0, 200000, "Time (in thousands of years)", false);
  }
  molCloud.display();
  setUp.run();
}
