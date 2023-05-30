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
boolean beginSimulate = false;
float solarMass;
Stats statsboard;
String stage;
boolean contract;
float theta = 0;

void setup(){
  size(1000, 750);
  densitySlider = new Slider(800, 600, 130, 20, 0, 100, "Molecular Cloud Density", true); 
  densitySlider.display();
  timeSlider = new Slider(50, 625, 350, 20, 0, 600000, "Time (in thousands of years)", false);
  timeSlider.display();
  cloudDensity = densitySlider.getValue();
  molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  molCloud.display(doneSetUp);
  //sun = new Star(ELLIPSE, 140, (float) (1.989 * Math.pow(10, 30)), 5772);
  setUp = new Button(800, 650, "Begin Simulation");
  //begin = new Button(800, 680, "Begin Simulation");
  setUp.display();
  doneSetUp = false;
  solarMass = 0;
  stage = "Molecular Cloud";
  statsboard = new Stats(solarMass, stage);
  statsboard.display();
  contract = false;
}

void tick() {
  if(doneSetUp) {
    if(frameCount % DELAY == 0) {
        timeSlider.increment(1000);
      }
    time = timeSlider.getValue();
  }
}

void draw(){
  background(0);
  cloudDensity = densitySlider.getValue();
  time = timeSlider.getValue();
  if (mousePressed){
    densitySlider.changed(mouseX, mouseY);
    //timeSlider.changed(mouseX, mouseY);
  }
  tick();
  densitySlider.display();
  //solarMass = densitySlider.getValue() / 10;
  timeSlider.display();
  statsboard.display();
  if (cloudDensity != densitySlider.getValue()){
    molCloud = new MolecularCloud(densitySlider.getValue(), 300);
    time = 0;
    timeSlider = new Slider(50, 625, 350, 20, 0, 600000, "Time (in thousands of years)", false);
  }
  if (doneSetUp){
    molCloud.display();
  }
  molCloud.display(doneSetUp);
  if (timeSlider.getValue() >= 200000){
    stage = "Protostar";
  }
  setUp.run();
  time = timeSlider.getValue();
  statsboard.changeStats(solarMass, stage);
  //Entering Red Giant phase
  boolean hold = contract;
  molCloud.redGiant(contract);
  if (hold){contract = false;}
  else{contract = true;}
}
