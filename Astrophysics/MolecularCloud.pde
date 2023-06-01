class MolecularCloud{
  
  Particle[] ParticleSystem;
  Particle centerOfGravity;
  float density;
  int radius, r1, maxNum;
  int absorbed = 0;
  
  MolecularCloud(float density, int radius){
    centerOfGravity = new Particle(width/2, height/2, 10, 5, false);
    this.density = density / 100;
    this.radius = radius;
    r1 = radius;
    maxNum = (int) density * 100;
    ParticleSystem = new Particle[maxNum];
    for(int i = 0; i < maxNum / 2; i++){
      ParticleSystem[i] = new Particle(random(width/2 - 100 * random(1), width/2 + 100 * random(1)), random(height/2 - 100 * random(1), height/2 + 100 * random(1)), random(1, 3), 1, false);
    }
    for(int i = maxNum / 2; i < 3 * maxNum/4; i++){
      int rand = (int) (Math.random() * 3);
      if(rand == 0) {
         ParticleSystem[i] = new Particle(random(width/2 - 200 * random(1), width/2 + 200 * random(1)), random(height/2 - 200 * random(1), height/2 + 200 * random(1)), random(1, 3), 1, true);
      }
      else {
         ParticleSystem[i] = new Particle(random(width/2 - 200 * random(1), width/2 + 200 * random(1)), random(height/2 - 200 * random(1), height/2 + 200 * random(1)), random(1, 3), 1, false);
      }
    }
    for(int i = 3 * maxNum/4; i < maxNum; i++){
      ParticleSystem[i] = new Particle(random(width/2 - 250 * random(1), width/2 + 250 * random(1)), random(height/2 - 250 * random(1), height/2 + 250 * random(1)), random(1, 3), 1, false);
    }
  }
  
  float COGSize() {
    return centerOfGravity.size;
  }

  void display(){
    for (int i = 0; i < ParticleSystem.length; i++){
      ParticleSystem[i].display(255, 255, 255);
    }
  }
  void display(boolean doneSetUp){
    if(doneSetUp) {
      centerOfGravity.display(255, 255, 255);
      if (time <= 300000){
        for (int i = 0; i < ParticleSystem.length; i++){
          Particle particle = ParticleSystem[i];
          if(doneSetUp) {        
            particle.move();
          }
          particle.display(255, 255, 255);
          if(doneSetUp) {
            particle.applyForce(particle.attractTo(centerOfGravity));
            if(particle.checkCloseToCenter()) {
              centerOfGravity.size += 0.02;
              solarMass += 0.001;
              absorbed++;
            }
          }
        }   
      }
    }
  }
  
  void display(boolean doneSetUp, float r, float g, float b){
    centerOfGravity.display(r, g, b);
    if (time <= 200000){
    for (int i = 0; i < ParticleSystem.length; i++){
      Particle particle = ParticleSystem[i];
      if(doneSetUp) {        
        particle.move();
      }
      particle.display(255, 255, 255);
      if(doneSetUp) {
        particle.applyForce(particle.attractTo(centerOfGravity));
        if(particle.checkCloseToCenter()) {
          centerOfGravity.size += 0.02;
          solarMass += 0.001;
          absorbed++;
        }
      }
    }
  }
  }
  
  boolean endStellarNeb() {
    return (absorbed == ParticleSystem.length - 10);
  }
  
  void redGiant(boolean increase){
    centerOfGravity.display(255, 255, 255);
    if (time > 300000 && time <= 400000){
      //if (frameCount % 2 == 0){
        //if (increase){increase();}
        //else{decrease();}
      //}
      increase();
    }
  }
  
  void updateColor(int r, int g, int b){
    centerOfGravity.display(r, g, b);
  }
  
  void increase(){
      centerOfGravity.size += 0.5;
 }
 
 void decrease(){
      centerOfGravity.size -= 0.2;
 }
}
