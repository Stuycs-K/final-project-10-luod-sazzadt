class Stats{
  float mass;
  float temp;
  float luminosity;
  
  Stats(float mass, float temp, float luminosity){
    this.mass = mass;
    this.temp = temp;
    this.luminosity = luminosity;
  }
  
  void display(){
    noStroke();
    fill(215, 206, 235);
    rect(50, 50, 200, 100, 20);
    fill(135, 118, 171);
    text("Solar Mass: " + mass, 70, 70);
    text("Temperature: " + temp, 70, 90);
    text("Luminosity: " + luminosity, 70, 110);
  }
  
  void changeStats(float mass, float temp, float luminosity){
    this.mass = mass;
    this.temp = temp;
    this.luminosity = luminosity;
  }
 }
