class Nebula {
  float radius;
  float hue;
  public Nebula(float theRadius) {
    radius = theRadius;
    if(theRadius < 300) {
      hue = (float) (random(180, 240));
    }
    else {
      hue = (float) (random(0, 60));
    }
  }
  void display(float brightness) {
    colorMode(HSB, 360, 100, 100, 100);
    pushMatrix();
    noFill();
    stroke(hue, 85, brightness, 100);
    strokeWeight(6);
    ellipse(width / 2, height / 2, radius, radius);
    noStroke();
    colorMode(RGB, 255, 255, 255);
    popMatrix();
  }
}
