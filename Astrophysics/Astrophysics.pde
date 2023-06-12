import java.util.*;
//Created Objects
Button play;
Button goBack;
Slider densitySlider;
Slider timeSlider;
MolecularCloud intro;
MolecularCloud molCloud;
Star sun;
Button setUpButton;
Stats graph;
Stats statsboard;
Button infoButton;
Stats infoboard;
Button Hr;
PImage img, img2, img3;

//Global Variables
boolean startPlay = false;
float cloudDensity;
float time = 0;
int DELAY = 3;
boolean doneSetUp = false;
boolean timeUp = false;
boolean beginSimulate = false;
float solarMass = 0;
String stage;
//boolean contract;
float r, g, b;
ArrayList<Float> lumGraph;
boolean showGraph;
int start, end, start2, end2;
float timeNow;
boolean reset;
//float timeWhenClicked;
boolean darker;
boolean showInfo;
int stageNum;
PVector gravity = new PVector(0, 0.2);
//float mainseqStartNum;
int mode;
boolean showHr;

void setup(){
  size(1000, 750);
  mode = 0;
  intro = new MolecularCloud();
  img = loadImage("astrotitle.png");
  img2 = loadImage("csastrotitle.png");
  img3 = loadImage("HRDiagram.png");

  //Initialize Sliders
  densitySlider = new Slider(800, 650, 130, 20, 0, 100, "Molecular Cloud Density", true); 
  densitySlider.display();
  timeSlider = new Slider(50, 680, 350, 20, 0, 1200000, "Time (in thousands of years)", false);
  timeSlider.display();
  cloudDensity = densitySlider.getValue();
  
  //Initialize variables
  startPlay = false;
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
  showInfo = false;
  stageNum = 0;
  showHr = false;
  
  //Initialize Objects
  play = new Button(width/2 - 60, height/2 + 150, "START");
  goBack = new Button(800, 20, "HOME");
  molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  setUpButton = new Button(800, 700, "Begin Simulation");
  sun = new Star(molCloud.COGSize(), (float) (1.989 * Math.pow(10, 30)), 5772);
  statsboard = new Stats(solarMass, stage);
  graph = new Stats();
  infoButton = new Button(50, 170, "Learn More");
  infoboard = new Stats();
  Hr = new Button(800, 250, "HR Diagram");
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
  if (mode == 0){
    translate(width/2, height/2);
    intro.display2();
    translate(-width/2, -height/2);
    image(img, width/2 - (width * 0.85)/2, height/2 - (height * 0.55)/2, width * 0.85, height * 0.55);
    play.run2();
  }
  else if (mode == 2){
    translate(width/2, height/2);
    intro.display2();
    translate(-width/2, -height/2);
    translate(420, 200);
    tint(255, 255);
    image(img2, width/2 - (width * 0.85)/2, height/2 - (height * 0.55)/2, width * 0.85, height * 0.55);
    translate(-420, -200);
    //atomic.run4();
    play.run2();
  }
  else if (mode == 1){
  //Monitor user input, update variables, update graph
  if (!doneSetUp){
    solarMass = 0;
  }
  if (doneSetUp && time <= 150000){
    solarMass += 0.014 * (densitySlider.getValue() / 100);
  }
  if (mousePressed){
    densitySlider.changed(mouseX, mouseY);
    //timeSlider.changed2(mouseX, mouseY);
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
  
  //Update time
  tick();
  if (doneSetUp && frameCount % DELAY == 0){
    lumGraph.add(pow(solarMass, 3.5));
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
    stage = "Stellar Nebula";
    stageNum = 0;
  }
  time = timeSlider.getValue();
  if (stageNum == 2){
  sun.mainSequenceColor();
  }
  if (stageNum == 3){
    sun.redGiantColor();
  }
  if (stageNum == 4){
   
  }
  sun.display2(width / 2, height / 2, sun.r2, sun.g2, sun.b2);
  
  
  
  
  
  
  
  
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
  infoButton.run3();
  Hr.run6();
  goBack.run5();
  if (showInfo){
    infoboard.displayInfo();
  }
  if (time == 0 && doneSetUp){lumGraph.add(pow(solarMass, 3.5));}
  graph.graphLuminosity();
  fill(215, 206, 235);
  text("Stats graphs:", 685, 70);
  if (doneSetUp){
    graph.updateGraph();
  }
  
  //Transition between stages
  if(time == 150000) {
    stage = "Protostar";
    stageNum = 1;
  }
  if (molCloud.endStellarNeb() && time < 430000){
    stage = "Main Sequence Star";
    stageNum = 2;
    mainseqStartNum = timeSlider.getValue();
  }
  if (time == 430000){
    stage = "Red Giant";
    stageNum = 3;
  }
  if (time == 600000){
    stage = "Supernova";
    stageNum = 4;
  }
  
  if (time == timeSlider.max){
    startPlay = false;
    mode = 2;
  }
  
  if (showHr == true){
  tint(255, 255);
  image(img3, 850, 430, 250, 300);
  }
  }
}
