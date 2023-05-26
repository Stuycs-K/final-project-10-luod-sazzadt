// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class LightParticleSystem {

  ArrayList<LightParticle> lightparticles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed
  PImage img;

  LightParticleSystem(int num, PVector v, PImage img_) {
    lightparticles = new ArrayList<LightParticle>();              // Initialize the arraylist
    origin = v.copy();                                   // Store the origin point
    img = img_;
    for (int i = 0; i < num; i++) {
      lightparticles.add(new LightParticle(origin));         // Add "num" amount of particles to the arraylist
    }
  }

  void run() {
    for (int i = lightparticles.size()-1; i >= 0; i--) {
      LightParticle p = lightparticles.get(i);
      p.run();
      if (p.isDead()) {
        lightparticles.remove(i);
      }
    }
  }
  
  // Method to add a force vector to all particles currently in the system
  void applyForce(PVector dir) {
    // Enhanced loop!!!
    for (LightParticle p : lightparticles) {
      p.applyForce(dir);
    }
  }  

  void addParticle() {
    lightparticles.add(new LightParticle(origin));
  }
}
