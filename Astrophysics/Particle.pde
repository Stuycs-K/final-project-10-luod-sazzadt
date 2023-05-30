class Particle{
  float G = 20;
  float x, y, z;
  float size;
  float mass;
  PVector position;
  PVector velocity;
  PVector acceleration;
  LightParticleSystem ps;
  boolean smoky;
  PImage img = loadImage("smoke.png");
  float theta = 0;
  int rotateFactor = (int) (Math.random() * 9);


  
  Particle(float x, float y, float size, float mass, boolean smoky){
    this.x = x;
    this.y = y;
    this.z = z;
    position = new PVector(x, y, z);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);
    this.size = size;
    this.mass = mass;
    this.smoky = smoky;
    if(smoky) {
      ps = new LightParticleSystem(0, new PVector(x, y), img);
    }
  }
  
  void display(){
    x = position.x;
    y = position.y;
    z = position.z;
    translate(x, y, z);
    noStroke();
    fill(255);
    //translate(400, 400, 0);
    //translate(x, y, z);
    noStroke();
    fill(255);
    //sphere(size);
    /*
    if(x == width/2 && y == height /2) {
      fill(255, 0, 0);
    }
    */
    circle(x, y, size);
    if(smoky) {
      ps.applyForce(new PVector(-0.1, 0));
      ps.run();
      if(frameCount % 5 == 0) {
         ps.addParticle();
         ps.addParticle();
         ps.addParticle();
      }
    }
  }
  
  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.set(0, 0);
  }
  
  PVector attractTo(Particle other) {
    float distance = PVector.dist(position, other.position);
    distance = max(15.0, distance);
    double mag = (G * mass * other.mass) / (distance * distance);
    PVector force = PVector.sub(other.position, position);
    force.normalize();
    force.mult((float) mag);
    return force;
  }
  
  void applyForce(PVector f) {
    acceleration.add(f.div(mass));
  }
  
  boolean checkCloseToCenter(){
    if(mass == 0) {
      return false;
    }
    if(position.dist(new PVector(width/2, height/2, 0)) < 10) {
      mass = 0;
      acceleration = new PVector(0, 0, 0);
      velocity = new PVector(0, 0, 0);
      return true;
    }
    return false;
  }
  
  boolean closeToFoci(Particle foci) {
    return (position.dist(foci.position) < 10);
  }
  
  void drawEllipse() {
    pushMatrix();
    float radiusX = 50;
    float radiusY = 100;
    translate(x, y);
    theta += 0.01;
    float posX = radiusX * cos(rotateFactor * theta );
    float posY = radiusY * sin(rotateFactor * theta );
    posX = posX * cos(7 * PI / 8) - posY * sin(7 * PI / 8);
    posY = posY * cos(7 * PI / 8) + posX * sin(7 * PI / 8);
    fill( 255 );
    ellipse( posX, posY, size, size );
    popMatrix();
  }
}
