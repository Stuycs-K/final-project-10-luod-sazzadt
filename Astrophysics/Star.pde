class Star {
  float radius;
  float mass;
  float temperature;
  //Particle centerOfGravity2;
  float starColor;
  float r2, g2, b2;
  float glowradius;
  float rmax;
  ArrayList<Nebula> nebulas = new ArrayList<Nebula>();
  float nebulaBrightness = 0;
  float defaultSaturation = 50;
  float defaultBrightness = 50;
  
  public Star(float theRadius, float theMass, float theTemperature) {
    mass = theMass;
    temperature = theTemperature;
    radius = theRadius;
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
  
  void glow(float x, float y, float saturation, boolean supernova) {
    colorMode(HSB, 360, 100, 100, 100);
    blendMode(ADD);
    noStroke();
    for (float r = 0.0; r < rmax; r += 0.01) {
      if(supernova) {
        colorMode(RGB, 255, 255, 255);
        fill(255, 255, 255);
      }
      else {
        fill(starColor, saturation, 5, 100);
      }
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
    if(time < 360000) {
      return;
    }
    if(stage.equals("Red Giant")) {
      r2 += 2;
      g2 -= 1;
      b2 -= 1;
      starColor = Math.max(0, starColor - 0.5);
      if(glowradius <= 4 * height/8) {
        glowradius += 0.5;
      }
    }
    else {
      r2 += 5;
      g2 -= 3;
      b2 -= 3;
      starColor = Math.max(0, starColor - 2.5);      
      if(glowradius <= 6.3 * height/8) {
        glowradius += 1.5;
      }
    }
    solarMass += 0.0005;
  }

  void redGiantColor(){
    if(time < 440000) {
      return;
    }
    if(stage.equals("Red Giant")) {
      glowradius = Math.max(0, glowradius - 2.5);
      nebulas.add(new Nebula(glowradius));
    }
  }
  
  void whiteDwarf() {
    radius -= 15;
    r2 = Math.min(255, r2 + 5);
    g2 = Math.min(255, g2 + 5);
    b2 = Math.min(255, b2 + 5);
  }
  void showNebulas() {
    nebulaBrightness = Math.min(80, nebulaBrightness += 0.5);
    for(int i = 0; i < nebulas.size(); i++) {
      nebulas.get(i).display(nebulaBrightness);
    }
  }
  void supernova() {
    r2 = Math.min(255, r2 + 25);
    g2 = Math.min(255, g2 + 25);
    b2 = Math.min(255, b2 + 25);
    glowradius += 10;
  }
  
  void blackHole() {
    image(img4, width/2, height/2, 400, 400);
  }

}
