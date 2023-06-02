class Stats{
  float mass;
  float temp;
  float luminosity;
  String stage;
  float radius;
  
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
    this.temp = pow((pow(mass, 3.5) / pow(mass, 2)), 0.25);
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
      if (timeNow >= 99999){
        start = end;
        end = end + 100000;
        timeNow = 0;
        remakeGraph();
        updateGraph();
        return;
      }
      else{
        int size = lumGraph.size();
        float time1 = 0;
        stroke(135, 118, 171);
        for (int i = 0; i < size - 1; i++){
        float n1 = lumGraph.get(i);
        float n2 = lumGraph.get(i + 1);
        if (showGraph){
          line(720 + (210 * (time1/100000)), 200 - ((n1/1000) * 110), 720 + (210 * (time1/100000)) + 2.1, 200 - ((n2/1000) * 110));
          time1 = time1 + 1000;
        }
        }
      }
    }
  }
  
  void remakeGraph(){
    lumGraph.clear();
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
 }
 
