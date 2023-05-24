
class Core {
  PShape shape;
  float mass;
  float temperature;
  float hydrogen;
  float radius;
  public Core(int theShape, float theRadius) {
    radius = theRadius;
    shape = createShape(theShape, 0, 0, radius, radius);
  }
  public void display() {
    shape(shape);
  }
}
