class Supernova{
  Particle Supernova;
  boolean exploded;
  float x, y, choose;
  Particle[] Particles; 
  int count = 0;
  
  Supernova(float x, float y){
    this.Supernova = new Particle(x, y);

    Particles = new Particle[3000];

    for(var i=0; i<3000; i++){
      this.Particles[i] = new Particle(Supernova.position.x, Supernova.position.y);

    }
    this.exploded = true;
  }
  
  void update(){
      for(var i=this.Particles.length-1; i>=0; i--){
        this.Particles[i].applyForce2(gravity);
        this.Particles[i].update();

      }
    }
  
  void show(){

        this.count = 0;
        for(var i=0; i<this.Particles.length; i++){
          this.count ++;
          this.Particles[i].show(this.count);
        }
      // }
  }

  boolean done(){
    if(this.exploded && this.Particles.length == 0){
      return true;
    }
    return false;
  }
}
