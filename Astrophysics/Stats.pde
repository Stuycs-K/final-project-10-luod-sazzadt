class Stats{
  float mass;
  float temp;
  float luminosity;
  String stage;
  float radius;
  String[] stageInfo = new String[]
  {"The stellar nebula is the molecular cloud that makes up initial stage of the birth of a star. As its temperature and pressure increase, a fragment condenses into a rotating sphere of superhot gas known as a protostar.",
  "After 10^6 years, a dense, hot core of the size of Mercury's orbit called the protostar is formed. However, the core temperature is still not hot enough for nuclear fusion to occur.",
  "The main-sequence stage is where a star spends most of its lifetime on. As the pressure and gravity are finally balanced, the star has reached the the state of hydrostatic equilibrium.",
  "The star has completed fusing hydrogen in its core. The core collapsed, releasing lots of energy, which causes an increase in size and temperature of the star."};
  
  
  Stats(float mass, String stage){
    this.mass = mass;
    this.radius = mass * (6.957 * pow(10, 8));
    this.luminosity = pow(mass, 3.5);
    this.temp = pow(this.luminosity / pow(mass, 2), 0.25) * 5772;
    this.stage = stage;
  }
  
  void display(){
    noStroke();
    fill(215, 206, 235);
    rect(50, 50, 290, 100, 20);
    fill(135, 118, 171);
    text("Solar Mass: " + mass, 70, 75);
    text("Temperature (in Kelvin): " + temp, 70, 95);
    text("Luminosity (compared to the Sun): " + luminosity, 70, 115);
    text("Stage: " + stage, 70, 135);
  }
  
  void changeStats(float mass, String stage){
    this.mass = mass;
    this.radius = mass;
    this.luminosity = pow(mass, 3.5);
    this.temp = pow(this.luminosity / pow(mass, 2), 0.25) * 5772;
    this.stage = stage;
  }
 
  void resetStats(){
    this.mass = 0;
    this.radius = 0;
    this.luminosity = 0;
    this.temp = 0;
    this.stage = "Molecular Cloud";
  }
     
  float calcLum(float mass){
    return pow((pow(mass, 3.5) / pow(mass, 2)), 0.25);
  }
  
  Stats(){}
  
  void graphLuminosity(){
    noStroke();
    fill(215, 206, 235);
    text("Stats graphs:", 685, 70);
    rect(665, 80, 285, 150, 20);
    stroke(135, 118, 171);
    line(720, 90, 720, 200);
    line(720, 200, 930, 200);
    fill(135, 118, 171);
    text("Luminosity vs. Time", 700 + 70, 220);
    fill(135, 118, 171);
    text(start2, 670, 201);
    text(end2, 670, 98);
    text(start, 718, 212);
    text(end, 905, 212);
  }
  
  void updateGraph(){
    if (lumGraph.size() >= 2){
      if (timeNow >= end && lumGraph.get(lumGraph.size() - 1) >= end2){
        start = end;
        end = end + 100000;
        start2 = end2;
        end2 = end2 + 1000;
        //timeNow = 0;
        remakeGraph();
        updateGraph();
        return;
      }
      else if (timeNow >= end){
        start = end;
        end = end + 100000;
        //timeNow = 0;
        remakeGraph();
        updateGraph();
        return;
      }
      else if (lumGraph.get(lumGraph.size() - 1) >= end2){
        start2 = end2;
        end2 = end2 + 1000;
        //timeNow = 0;
        remakeGraph();
        updateGraph();
        return;
      }
      else{
        int size = lumGraph.size();
        float time1 = 0;
        for (int i = 0; i < size - 1; i++){
        float n1 = lumGraph.get(i);
        float n2 = lumGraph.get(i + 1);
        stroke(135, 118, 171);
        line(720 + (210 * (time1/100000)), 200 - ((n1/end2) * 110), 720 + (210 * (time1/100000)) + 2.1, 200 - ((n2/end2) * 110));
        time1 = time1 + 1000;
        }
      }
    }
  }
  
  void remakeGraph(){
    lumGraph.clear();
    noStroke();
    fill(215, 206, 235);
    rect(665, 80, 285, 150, 20);
    stroke(135, 118, 171);
    line(720, 90, 720, 200);
    line(720, 200, 930, 200);
    fill(135, 118, 171);
    text("Luminosity vs. Time", 700 + 70, 220);
    fill(135, 118, 171);
    text(start2, 670, 201);
    text(end2, 670, 98);
    text(start, 718, 212);
    text(end, 905, 212);
  }
  
  void displayInfo(){
    int h = (stageInfo[stageNum].length() / 18) * 20;
    noStroke();
    fill(215, 206, 235);
    rect(50, 200, 150, h, 20);
    fill(135, 118, 171);
    text(stageInfo[stageNum], 60, 208, 130, 250);
  }
 }
 
