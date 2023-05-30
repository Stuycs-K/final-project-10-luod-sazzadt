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
  
  void graphLuminosity(){
    noStroke();
    fill(215, 206, 235);
    rect(50, 50, 290, 100, 20);
  }
 }
