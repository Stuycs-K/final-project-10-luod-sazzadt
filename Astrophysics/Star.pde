class Star {
  Core core;
  PShape shape;
  PImage texture;
  float radius;
  float mass;
  float temperature;
  
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
  //private void expand() {
  //  shape.scale(1.01);
  //}
  //private void contract() {
  //  shape.scale(0.99);
  //}
  //private void rotate() {
  //  shape.rotateY(0.01);
  //  shape.rotateZ(0.005);
  //}
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
}
