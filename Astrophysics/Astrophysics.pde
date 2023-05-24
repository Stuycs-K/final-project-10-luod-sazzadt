//import peasy.*;
import java.util.*;
Slider densitySlider;
//PeasyCam cam;
//Star sun;
float cloudDensity;
MolecularCloud molCloud;
//Particle p1;

void setup(){
  size(800, 800);
  densitySlider = new Slider(400, 200, 130, 20, 0, 100, "Molecular Cloud Density"); 
  densitySlider.display();
  cloudDensity = densitySlider.getValue();
  molCloud = new MolecularCloud(densitySlider.getValue(), 300);
  molCloud.display();
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
}
