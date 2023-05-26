class MolecularCloud{
  
  Particle[] ParticleSystem;
  Particle centerOfGravity;
  float density;
  int radius, r1, maxNum;
  
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
      ParticleSystem[i] = new Particle(random(width/2 - 200 * random(1), width/2 + 200 * random(1)), random(height/2 - 200 * random(1), height/2 + 200 * random(1)), random(1, 3), 1, false);
    }
    for(int i = 3 * maxNum/4; i < maxNum; i++){
      ParticleSystem[i] = new Particle(random(width/2 - 250 * random(1), width/2 + 250 * random(1)), random(height/2 - 250 * random(1), height/2 + 250 * random(1)), random(1, 3), 1, false);
    }
  }
  
  void display(boolean doneSetUp){
    centerOfGravity.display();
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
        }
      }
    }
  }
}
