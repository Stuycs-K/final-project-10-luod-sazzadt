class MolecularCloud{
  Particle[] ParticleSystem;
  float density;
  int radius, r1, maxNum;
  
  MolecularCloud(float density, int radius){
    this.density = density / 100;
    this.radius = radius;
    r1 = radius;
    maxNum = (int) 400;
    ParticleSystem = new Particle[maxNum];
    for(int i = 0; i < maxNum; i++){
      ParticleSystem[i] = new Particle(random(400 - this.radius, 400 + this.radius), random(400 - this.radius, 400 + this.radius), 3);
    }
  }
  
  void display(){
    for (int i = 0; i < ParticleSystem.length; i++){
    ParticleSystem[i].display();
  }
  }
}
