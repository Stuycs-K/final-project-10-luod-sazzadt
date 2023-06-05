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
int start, end, start2, end2;
float timeNow;
boolean reset;
float timeWhenClicked;
boolean darker;

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
  stage = "Stellar Nebula";
  contract = false;
  reset = false;
  r = 255;
  g = 255;
  b = 255;
  start = 0;
  end = 100000;
  start2 = 0;
  end2 = 1000;
  timeNow = 0;
  showGraph = false;
  timeWhenClicked = 0;
  lumGraph = new ArrayList<Float>();
  darker = false;
  
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
  molCloud.display(doneSetUp, r, g, b, stage);
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
    
  //Update time and cloud density, display information
  cloudDensity = densitySlider.getValue();
  time = timeSlider.getValue();
  densitySlider.display();
  timeSlider.display();
  statsboard.display();
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
  if (doneSetUp && time <= 150000){
    solarMass += 0.007;
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
  
  //Display animation
  molCloud.display(doneSetUp, r, g, b, stage);
  statsboard.changeStats(solarMass, stage);
  sun.glow(width / 2, height / 2, Math.max(30, 90 - (statsboard.luminosity/ 10)));
  if (time <= 300000){
  sun.display(width / 2, height / 2, cloudDensity);}

          //if (time <= 200000){
          //  g--;
          //  b--;
          //  molCloud.updateColor(r, g, b);
          //}
          //sun.display(width / 2, height / 2, r, g, b);
  
  //Transition between stages
  if(time == 150000) {
    stage = "Protostar";
  }
  if (molCloud.endStellarNeb()){
    stage = "Main Sequence Star";
  }
  
  //Update time
  tick();
  if (doneSetUp && frameCount % DELAY == 0){
    lumGraph.add(pow(solarMass, 3.5));
  }
  if (time == 0 && doneSetUp){lumGraph.add(pow(solarMass, 3.5));}
  if (showGraph){
    graph.graphLuminosity();
  }
  if (doneSetUp){
    graph.updateGraph();
  }
  else if (!doneSetUp && time == 0){
    start = 0;
    end = 100000;
    start2 = 0;
    end2 = 1000;
  }
  if (reset){
    start = 0;
    end = 100000;
    start2 = 0;
    end2 = 1000;
  }
  timeNow = timeSlider.getValue();
  
  if (reset && cloudDensity == densitySlider.getValue()){
    sun = new Star(molCloud.COGSize(), (float) (1.989 * Math.pow(10, 30)), 5772);
    molCloud = new MolecularCloud(densitySlider.getValue(), 300);
    time = 0;
    timeSlider = new Slider(50, 625, 350, 20, 0, 600000, "Time (in thousands of years)", false);
    reset = false;
    statsboard.resetStats();
    start = 0;
    end = 100000;
    start2 = 0;
    end2 = 1000;
    timeNow = 0;
    graph.remakeGraph();
    graph.updateGraph();
  }
  time = timeSlider.getValue();
  sun.mainSequenceColor();
}
