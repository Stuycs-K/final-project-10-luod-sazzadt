class Star {
  Core core;
  PShape shape;
  PImage texture;
  float radius;
  float mass;
  float temperature;
  
  public Star(int theShape, String theTexture, float theRadius, float theMass, float theTemperature) {
    mass = theMass;
    temperature = theMass;
    radius = theRadius;
    noStroke();
    shape = createShape(theShape, radius);
    texture = loadImage(theTexture);
    shape.setTexture(texture);
    stroke(0);
    core = new Core(SPHERE, radius / 5);
  }
  public void display() {
    shape(shape);
    core.display();
  }
  private void expand() {
    shape.scale(1.01);
  }
  private void contract() {
    shape.scale(0.99);
  }
  private void rotate() {
    shape.rotateY(0.01);
    shape.rotateZ(0.005);
  }
}
