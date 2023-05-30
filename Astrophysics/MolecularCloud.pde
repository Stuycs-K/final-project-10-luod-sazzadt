class MolecularCloud{
  
  Particle[] ParticleSystem;
  Particle centerOfGravity, foci1, foci2;
  float density;
  int radius, r1, maxNum;
  
  MolecularCloud(float density, int radius){
    centerOfGravity = new Particle(width/2, height/2, 10, 5, false);
    foci1 = new Particle(width / 3, 2 * height / 3, 10, 5, false);
    foci2 = new Particle(width / 3, 2 * height / 3, 10, 5, false);
    this.density = density / 100;
    this.radius = radius;
    r1 = radius;
    maxNum = (int) density * 100;
    ParticleSystem = new Particle[maxNum];
    for(int i = 0; i < maxNum / 2; i++){
      ParticleSystem[i] = new Particle(random(width/2 - 100 * random(1), width/2 + 100 * random(1)), random(height/2 - 100 * random(1), height/2 + 100 * random(1)), random(1, 3), 1, false);
    }
    for(int i = maxNum / 2; i < 3 * maxNum/4; i++){
      ParticleSystem[i] = new Particle(random(width/2 - 200 * random(1), width/2 + 200 * random(1)), random(height/2 - 200 * random(1), height/2 + 200 * random(1)), random(1, 3), 1, false);
    }
    for(int i = 3 * maxNum/4; i < maxNum; i++){
      ParticleSystem[i] = new Particle(random(width/2 - 250 * random(1), width/2 + 250 * random(1)), random(height/2 - 250 * random(1), height/2 + 250 * random(1)), random(1, 3), 1, false);
    }
  }
  
  void display(){
    for (int i = 0; i < ParticleSystem.length; i++){
    ParticleSystem[i].display();
  }
  }
  
  void display(boolean doneSetUp){
    if(doneSetUp) {
      centerOfGravity.display();
      if (time <= 300000){
        if(time < 200_000) {
          for (int i = 0; i < ParticleSystem.length; i++){
            Particle particle = ParticleSystem[i];
            if(doneSetUp) {
              particle.drawEllipse();
            }
          }
        }
        else { 
          for (int i = 0; i < ParticleSystem.length; i++){
            Particle particle = ParticleSystem[i];
            if(doneSetUp) {        
              particle.move();
            }
            particle.display();
            if(doneSetUp) {
              particle.applyForce(particle.attractTo(centerOfGravity));
              if(particle.checkCloseToCenter()) {
                centerOfGravity.size += 0.02;
                solarMass += 0.001;
              }
            }
          }
        }
      }
    }
  }
  
  void redGiant(boolean increase){
    centerOfGravity.display();
    if (time > 300000 && time <= 400000){
      //if (frameCount % 2 == 0){
        //if (increase){increase();}
        //else{decrease();}
      //}
      increase();
  }
  }
  
  void increase(){
      centerOfGravity.size += 0.5;
 }
 
 void decrease(){
      centerOfGravity.size -= 0.2;
 }
}
