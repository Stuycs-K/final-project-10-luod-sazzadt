class Stats{
  float mass;
  float temp;
  float luminosity;
  String stage;
  float radius;
  
  Stats(float mass, String stage){
    this.mass = mass;
    this.radius = mass;
    this.luminosity = pow(mass, 3.5);
    this.temp = pow((pow(mass, 3.5) / pow(mass, 2)), 0.25);
    this.stage = stage;
  }
  
  void display(){
    noStroke();
    fill(215, 206, 235);
    rect(50, 50, 290, 100, 20);
    fill(135, 118, 171);
    text("Solar Mass: " + mass, 70, 75);
    text("Temperature: " + temp, 70, 95);
    text("Luminosity (compared to the Sun): " + luminosity, 70, 115);
    text("Stage: " + stage, 70, 135);
  }
  
  void changeStats(float mass, String stage){
    this.mass = mass;
    this.radius = mass;
    this.luminosity = pow(mass, 3.5);
    this.temp = pow((pow(mass, 3.5) / pow(mass, 2)), 0.25);
    this.stage = stage;
  }
  
  float calcLum(float mass){
    return pow((pow(mass, 3.5) / pow(mass, 2)), 0.25);
  }
  
  Stats(){
  }
  
  void graphLuminosity(){
    noStroke();
    fill(215, 206, 235);
    rect(685, 80, 265, 150, 20);
    stroke(135, 118, 171);
    line(720, 90, 720, 200);
    line(720, 200, 930, 200);
    fill(135, 118, 171);
    text("Luminosity vs. Time", 700 + 70, 220);
    fill(135, 118, 171);
    text("0", 712, 201);
    text("1000", 694, 98);
    text(start, 718, 212);
    text(end, 905, 212);
  }
  
  void updateGraph(){
    if (lumGraph.size() >= 2){
      if (timeNow >= end){
        start = end;
        end = end + 10000;
        remakeGraph();
        updateGraph();
      }
      else{
        int size = lumGraph.size();
        float time1 = timeNow;
        float time2 = timeNow + 1000;
        float n1 = lumGraph.get(size - 2);
        float n2 = lumGraph.get(size - 1);
        stroke(135, 118, 171);
        line(720 + 210 * time1/end, 200 - n1/1000 * 110, 720 + 210 * time2/end, 200 - n2/1000 * 110);
      }
    }
  }
  
  void remakeGraph(){
     noStroke();
    fill(215, 206, 235);
    rect(685, 80, 265, 150, 20);
    stroke(135, 118, 171);
    line(720, 90, 720, 200);
    line(720, 200, 930, 200);
    fill(135, 118, 171);
    text("Luminosity vs. Time", 700 + 70, 220);
    fill(135, 118, 171);
    text("0", 712, 201);
    text("1000", 694, 98);
    text(start, 718, 212);
    text(end, 905, 212);
    lumGraph.clear();
  }
 }
 
