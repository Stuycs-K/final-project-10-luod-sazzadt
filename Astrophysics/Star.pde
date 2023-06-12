class Star {
  Core core;
  float radius;
  float mass;
  float temperature;
  //Particle centerOfGravity2;
  float starColor;
  float r2, g2, b2;
  float glowradius;
  float rmax;
  
  public Star(float theRadius, float theMass, float theTemperature) {
    mass = theMass;
    temperature = theTemperature;
    radius = theRadius;
    core = new Core(ELLIPSE, radius / 5);
    glowradius = height/2;
    rmax = 0.5;
  }

  public void display(int x, int y, float density) {
    colorMode(HSB, 360, 100, 100, 100);
    if (stageNum < 3){
    if(density < 20) {
      starColor = 0;
      r2 = 255;
      g2 = 0;
      b2 = 0;
    }
    else if(density < 40){
      starColor = 20;
      r2 = 255;
      g2 = 85;
      b2 = 0;
    }
    else if(density < 60) {
      starColor = 60;
      r2 = 255;
      g2 = 255;
      b2 = 0;
    }
    else if(density < 80) {
      starColor = 180;
      r2 = 0;
      g2 = 255;
      b2 = 255;
    }
    else {
      starColor = 240;
      r2 = 0;
      g2 = 0;
      b2 = 255;
    }
    fill(starColor, 100, 100);
    circle(x, y, radius);
    noFill();
    colorMode(RGB, 255, 255, 255);
    }
    else if (stageNum == 3){
      r2 = 255;
      g2 = 255;
      b2 = 255;
    }
  }
  
  public void updateSize(float r) {
    radius = r;
  }
  
  void glow(float x, float y, float saturation) {
    colorMode(HSB, 360, 100, 100, 100);
    blendMode(ADD);
    noStroke();
    for (float r = 0.0; r < rmax; r += 0.01) {
      fill(starColor, saturation, 5, 100);
      circle(x, y, glowradius * r * (radius / 20) * 0.5);
    }
    colorMode(RGB, 255, 255, 255);
    blendMode(BLEND);
  }

  //public void displayData(int x, int y) {
  //  textSize(16);
  //  fill(255, 0, 0);
  //  text("Temperature: " + temperature +  " K", x + 40, y + 50);
  //  text("Mass: " + mass + " kg", x + 40, y + 75);
  //}
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
  
  //void redGiant(){
  //  int i = 1;
  //  while (time > 10 && time < 10000){
  //    if (i == 1 && frameCount % 3 == 0){
  //      centerOfGravity2.size += 0.5;
  //      i = 2;
  //    }
  //    else{
  //      centerOfGravity2.size -= 0.2;
  //      i = 1;
  //    }
  //  }
  //}
  
  void display2(int x, int y, float r, float g, float b){
    colorMode(RGB, 255, 255, 255);
    noStroke();
    fill(r, g, b);
    circle(x, y, radius);
  }
  
  void mainSequenceColor(){
    if (stageNum == 2){
        if (densitySlider.getValue() < 40){
          g2 = g2 + 1;
          b2 = b2 + 1;
        }
        else if (densitySlider.getValue() < 60){
          b2 = b2 + 1;
        }
        else if (densitySlider.getValue() < 80){
          r2 = r2 + 1;
        }
        else{
          r2 = r2 + 1;
          g2 = g2 + 1;
        }
        if (glowradius >= height/4){
        glowradius = glowradius - 0.3;}
        //rmax = rmax - 0.00002;
        //radius = radius - 0.002;
        //glow(width/2, height/2, Math.max(30, 90 - (statsboard.luminosity/ 10)));
        //display2(width / 2, height / 2, r2, g2, b2);
        solarMass += 0.0005;
    }
  }
  
  void redGiantColor(){
    if (stageNum == 3){
      if (densitySlider.getValue() < 70){
        g2 = g2 - 0.02;
        b2 = b2 - 0.02;
        starColor = starColor - 0.5;
        solarMass -= 0.001;
      }
      else{
        g2 = g2 - 0.3;
        b2 = b2 - 0.3;
        starColor = starColor - 2;
        solarMass -= 0.002;
      }
        //if (densitySlider.getValue() > 20 && densitySlider.getValue() < 40){
        //  g2 = g2 - 1;
        //}
        //else if (densitySlider.getValue() < 60){
        //  g2 = g2 - 2;
        //}
        //else if (densitySlider.getValue() < 80){
        //  r2 = r2 + 1;
        //}
        //else{
        //  r2 = r2 + 1;
        //  g2 = g2 + 1;
        //}
        if (glowradius >= height/4){
        glowradius = glowradius + 0.3;}
        //rmax = rmax - 0.00002;
        //radius = radius - 0.002;
        //glow(width/2, height/2, Math.max(30, 90 - (statsboard.luminosity/ 10)));
        //display2(width / 2, height / 2, r2, g2, b2);
    }
  }

}
