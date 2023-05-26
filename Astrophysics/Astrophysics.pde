import java.util.*;
Slider densitySlider;
//PeasyCam cam;
//Star sun;
float cloudDensity;
MolecularCloud molCloud;
Star sun;
int DELAY = 2;
Button setUp, begin;
boolean doneSetUp = false;
boolean beginSimulate = false;
float solarMass;
Stats statsboard;
String stage;

void setup(){
  size(1000, 750);
  densitySlider = new Slider(800, 600, 130, 20, 0, 100, "Molecular Cloud Density"); 
  densitySlider.display();
  cloudDensity = densitySlider.getValue();
  molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  molCloud.display();
  //sun = new Star(ELLIPSE, 140, (float) (1.989 * Math.pow(10, 30)), 5772);
  setUp = new Button(800, 650, "Finish Set Up");
  begin = new Button(800, 680, "Begin Simulation");
  setUp.display();
  doneSetUp = false;
  solarMass = densitySlider.getValue() / 10;
  stage = "Molecular Cloud";
  statsboard = new Stats(solarMass, 100, 100, stage);
  statsboard.display();
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
  }
  densitySlider.display();
  solarMass = densitySlider.getValue() / 10;
  statsboard.changeStats(solarMass, 100, 100, stage);
  statsboard.display();
  if (cloudDensity != densitySlider.getValue()){
    molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  }
  molCloud.display();
  setUp.run();
  if (doneSetUp == true){
    begin.display();
    begin.run2();
  }
}
