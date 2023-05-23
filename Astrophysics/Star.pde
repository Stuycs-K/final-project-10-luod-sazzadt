class Star {
  PShape shape;
  PImage texture;
  float radius;
  public Star(int theShape, String theTexture, float theRadius) {
    radius = theRadius;
    noStroke();
    shape = createShape(theShape, radius);
    texture = loadImage(theTexture);
    shape.setTexture(texture);
    stroke(0);
  }
  public void display() {
    shape(shape);
  }
}
