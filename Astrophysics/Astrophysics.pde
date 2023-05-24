//import peasy.*;
import java.util.*;
Slider densitySlider;
//PeasyCam cam;
//Star sun;
float cloudDensity;
MolecularCloud molCloud;
Particle p1;

void setup(){
  size(800, 800);
  densitySlider = new Slider(400, 200, 130, 20, 0, 100, "Molecular Cloud Density"); 
  densitySlider.display();
  molCloud = new MolecularCloud(densitySlider.getValue(), 200);
  molCloud.display();
  p1 = new Particle(200, 200, 100);
  p1.display();
}

void draw(){
  background(0);
  p1.display();
  molCloud.display();
  cloudDensity = densitySlider.getValue();
  if (mousePressed){
    densitySlider.changed(mouseX, mouseY);
  }
  densitySlider.display();
}
