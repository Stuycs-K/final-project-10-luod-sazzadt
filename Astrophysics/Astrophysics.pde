//import peasy.*;
import java.util.*;
Slider densitySlider;
//PeasyCam cam;
//Star sun;
float cloudDensity;
MolecularCloud molCloud;
Star sun;
int DELAY = 2;
//Particle p1;

void setup(){
  size(1000, 1000);
  densitySlider = new Slider(500, 700, 130, 20, 0, 100, "Molecular Cloud Density"); 
  densitySlider.display();
  cloudDensity = densitySlider.getValue();
  molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  molCloud.display();
  sun = new Star(ELLIPSE, 140, (float) (1.989 * Math.pow(10, 30)), 5772);
}

void tick() {
  sun.updateMass(sun.getMass() * 0.998);
  sun.updateTemp(sun.getTemp() * 0.9996);
}

void draw(){
  background(0);
  cloudDensity = densitySlider.getValue();
  if (mousePressed){
    densitySlider.changed(mouseX, mouseY);
  }
  densitySlider.display();
  if (cloudDensity != densitySlider.getValue()){
    molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  }
  molCloud.display();
  fill(0, 255, 0);
  rect(width / 8, height / 8, 250, 150);
  sun.displayData(width / 8, height / 8);
  stroke(0);
  sun.display(width / 2, height / 2);
  if(frameCount % 4 == 0) {
    tick();
  }
  sun.rotate();
}
