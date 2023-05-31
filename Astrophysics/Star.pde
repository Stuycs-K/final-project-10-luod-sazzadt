class Star {
  Core core;
  PShape shape;
  PImage texture;
  float radius;
  float mass;
  float temperature;
  Particle centerOfGravity2;
  
  public Star(int theShape, float theRadius, float theMass, float theTemperature) {
    mass = theMass;
    temperature = theTemperature;
    radius = theRadius;
    noStroke();
    shape = createShape(theShape, 0, 0, radius, radius);
    stroke(0);
    core = new Core(ELLIPSE, radius / 5);
  }
  public void display(int x, int y) {
    pushMatrix();
    translate(x, y);
    shape(shape);
    popMatrix();
  }
  
  void glow(float x, float y, float saturation) {
    colorMode(HSB, 360, 100, 100, 100);
    blendMode(ADD);
    noStroke();
    for (float r = 0.0; r < 0.5; r += 0.01) {
      fill(0, saturation, 5, 100);
      circle(x, y, y * r * (radius / 20));
    }
    colorMode(RGB, 255, 255, 255);
    blendMode(BLEND);
  }

  public void displayData(int x, int y) {
    textSize(16);
    fill(255, 0, 0);
    text("Temperature: " + temperature +  " K", x + 40, y + 50);
    text("Mass: " + mass + " kg", x + 40, y + 75);
  }
  public float getMass() {
    return mass;
  }
  public void updateMass(float newMass) {
    mass = newMass;
  }
  public float getTemp() {
    return temperature;
  }
  public void updateTemp(float newTemp) {
    temperature = newTemp;
  }
  
  void redGiant(){
    int i = 1;
    while (time > 10 && time < 10000){
      if (i == 1 && frameCount % 3 == 0){
        centerOfGravity2.size += 0.5;
        i = 2;
      }
      else{
        centerOfGravity2.size -= 0.2;
        i = 1;
      }
    }
  }
  }
