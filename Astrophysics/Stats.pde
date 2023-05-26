class Stats{
  float mass;
  float temp;
  float luminosity;
  String stage;
  
  Stats(float mass, float temp, float luminosity, String stage){
    this.mass = mass;
    this.temp = temp;
    this.luminosity = luminosity;
    this.stage = stage;
  }
  
  void display(){
    noStroke();
    fill(215, 206, 235);
    rect(50, 50, 200, 100, 20);
    fill(135, 118, 171);
    text("Solar Mass: " + mass, 70, 75);
    text("Temperature: " + temp, 70, 95);
    text("Luminosity: " + luminosity, 70, 115);
    text("Stage: " + stage, 70, 135);
  }
  
  void changeStats(float mass, float temp, float luminosity, String stage){
    this.mass = mass;
    this.temp = temp;
    this.luminosity = luminosity;
    this.stage = stage;
  }
 }
