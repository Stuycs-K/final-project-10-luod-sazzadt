class MolecularCloud{
  Particle[] ParticleSystem;
  float density;
  int radius, r1, maxNum;
  
  MolecularCloud(float density, int radius){
    this.density = density / 100;
    this.radius = radius;
    r1 = radius;
    maxNum = (int) density * 100;
    ParticleSystem = new Particle[maxNum];
    for(int i = 0; i < maxNum / 2; i++){
      ParticleSystem[i] = new Particle(random(400 - 100 * random(1), 400 + 100 * random(1)), random(400 - 100 * random(1), 400 + 100 * random(1)), random(1, 3));
    }
    for(int i = maxNum / 2; i < 3 * maxNum/4; i++){
      ParticleSystem[i] = new Particle(random(400 - 200 * random(1), 400 + 200 * random(1)), random(400 - 200 * random(1), 400 + 200 * random(1)), random(1, 3));
    }
    for(int i = 3 * maxNum/4; i < maxNum; i++){
      ParticleSystem[i] = new Particle(random(400 - 250 * random(1), 400 + 250 * random(1)), random(400 - 250 * random(1), 400 + 250 * random(1)), random(1, 3));
    }
  }
  
  void display(){
    for (int i = 0; i < ParticleSystem.length; i++){
    ParticleSystem[i].display();
  }
  }
}
