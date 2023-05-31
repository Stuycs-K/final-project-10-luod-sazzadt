import java.util.*;
//Created Objects
Slider densitySlider;
Slider timeSlider;
MolecularCloud molCloud;
Star sun;
Button setUpButton;
Button statsButton;
Stats graph;
Stats statsboard;

//Global Variables
float cloudDensity;
float time = 0;
int DELAY = 3;
boolean doneSetUp = false;
boolean timeUp = false;
boolean beginSimulate = false;
float solarMass;
String stage;
boolean contract;
float r, g, b;
ArrayList<Float> lumGraph;
boolean showGraph;
int start, end;
float timeNow;

void setup(){
  size(1000, 750);
  densitySlider = new Slider(800, 600, 130, 20, 0, 100, "Molecular Cloud Density", true); 
  densitySlider.display();
  timeSlider = new Slider(50, 625, 350, 20, 0, 600000, "Time (in thousands of years)", false);
  timeSlider.display();
  cloudDensity = densitySlider.getValue();
  molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  //sun = new Star(ELLIPSE, 140, (float) (1.989 * Math.pow(10, 30)), 5772);
  setUpButton = new Button(800, 650, "Begin Simulation");
  //begin = new Button(800, 680, "Begin Simulation");
  setUpButton.display();
  doneSetUp = false;
  solarMass = 0;
  stage = "Molecular Cloud";
  statsboard = new Stats(solarMass, stage);
  statsboard.display();
  contract = false;
  r = 255;
  g = 255;
  b = 255;
  molCloud.display(doneSetUp, r, g, b);
  graph = new Stats();
  statsButton = new Button(800, 50, "Show Graph");
  showGraph = false;
  lumGraph = new ArrayList<Float>();
  start = 0;
  end = 100000;
  timeNow = 0;
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
  densitySlider.display();
  //solarMass = densitySlider.getValue() / 10;
  if (cloudDensity != densitySlider.getValue()){
    molCloud = new MolecularCloud(densitySlider.getValue(), 300);
    time = 0;
    timeSlider = new Slider(50, 625, 350, 20, 0, 600000, "Time (in thousands of years)", false);
  }
  //if (doneSetUp){
  //  molCloud.display();
  //}
  //
  molCloud.display(doneSetUp, r, g, b);
  if (doneSetUp && time <= 200000){
  if (densitySlider.getValue() < 80){
    g = g - 0.2 * (densitySlider.getValue() / 100);
    b = b - 0.2 * (densitySlider.getValue() / 100);
  }
  else if (densitySlider.getValue() >= 80){
   r = r - 0.2 * (densitySlider.getValue() / 100);
   g = g - 0.2 * (densitySlider.getValue() / 100);
  }
  }
  //if (time <= 200000){
  //  g--;
  //  b--;
  //  molCloud.updateColor(r, g, b);
  //}
  if (timeSlider.getValue() >= 200000){
    stage = "Protostar";
  }
  setUpButton.run();
  statsboard.display();
  statsboard.changeStats(solarMass, stage);
  timeSlider.display();
  statsboard.display();
  statsButton.run2();
  time = timeSlider.getValue();
  if (frameCount % (DELAY) == 0){lumGraph.add(pow(solarMass, 3.5));}
  if (showGraph){
    //start = (int) (time - time % 10000);
    //end = start + 10000;
  graph.graphLuminosity();
}
if (doneSetUp){
  graph.updateGraph();}
  else if (!doneSetUp && time == 0){
    start = 0;
    end = 100000;
}
  timeNow = timeNow + 1000/DELAY;
  //Entering Red Giant phase
  
  
  tick();
}
