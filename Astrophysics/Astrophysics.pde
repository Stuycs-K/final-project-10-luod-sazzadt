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
float solarMass = 0;
String stage;
boolean contract;
float r, g, b;
ArrayList<Float> lumGraph;
boolean showGraph;
int start, end;
float timeNow;

void setup(){
  size(1000, 750);
  
  //Initialize Sliders
  densitySlider = new Slider(800, 600, 130, 20, 0, 100, "Molecular Cloud Density", true); 
  densitySlider.display();
  timeSlider = new Slider(50, 625, 350, 20, 0, 600000, "Time (in thousands of years)", false);
  timeSlider.display();
  cloudDensity = densitySlider.getValue();
  
  //Initialize variables
  doneSetUp = false;
  solarMass = 0;
  stage = "Molecular Cloud";
  contract = false;
  r = 255;
  g = 255;
  b = 255;
  start = 0;
  end = 100000;
  timeNow = 0;
  showGraph = false;
  lumGraph = new ArrayList<Float>();
  
  //Initialize Objects
  molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  setUpButton = new Button(800, 650, "Begin Simulation");
  sun = new Star(molCloud.COGSize(), (float) (1.989 * Math.pow(10, 30)), 5772);
  statsboard = new Stats(solarMass, stage);
  graph = new Stats();
  statsButton = new Button(800, 50, "Show Graph");
  //begin = new Button(800, 680, "Begin Simulation");
  
  //Initial Methods
  setUpButton.display();
  statsboard.display();
  molCloud.display(doneSetUp, r, g, b);
}

void tick() {
  if(doneSetUp) {
    if(frameCount % DELAY == 0) {
        timeSlider.increment(1000);
      }
    time = timeSlider.getValue();
  }
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
}

void displayStage() {
  
}

void draw(){
  background(0);
    
  //Update time and cloud density, display information
  cloudDensity = densitySlider.getValue();
  time = timeSlider.getValue();
  densitySlider.display();
  timeSlider.display();
  statsboard.display();
  tick();
  setUpButton.run();
  statsboard.display();
  statsboard.changeStats(solarMass, stage);
  timeSlider.display();
  statsboard.display();
  statsButton.run2();
  
  //Monitor user input, update variables, update graph
  if (!doneSetUp){
    solarMass = 0;
  }
  if (mousePressed){
    densitySlider.changed(mouseX, mouseY);
  }
  if (cloudDensity != densitySlider.getValue()){
    molCloud = new MolecularCloud(densitySlider.getValue(), 300);
    time = 0;
    timeSlider = new Slider(50, 625, 350, 20, 0, 600000, "Time (in thousands of years)", false);
  }
  if(sun.radius != molCloud.COGSize()) {
    sun.updateSize(molCloud.COGSize());
  }
  if (frameCount % (DELAY) == 0){
    lumGraph.add(pow(solarMass, 3.5));
  }
  if (showGraph){
    //start = (int) (time - time % 10000);
    //end = start + 10000;
    graph.graphLuminosity();
  }
  if (doneSetUp){
    graph.updateGraph();
  }
  else if (!doneSetUp && time == 0){
    start = 0;
    end = 100000;
  }
  timeNow = timeNow + 1000/DELAY;
  
  //Display animation
  molCloud.display(doneSetUp, r, g, b);
  statsboard.changeStats(solarMass, stage);
  sun.glow(width / 2, height / 2, 90 - (statsboard.luminosity/ 10));

          //if (time <= 200000){
          //  g--;
          //  b--;
          //  molCloud.updateColor(r, g, b);
          //}
          //sun.display(width / 2, height / 2, r, g, b);
  
  //Transition between stages
  if (timeSlider.getValue() >= 200000){
    stage = "Protostar";
  }
  
}
