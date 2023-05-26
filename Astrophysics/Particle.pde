class Particle{
  float G = 20;
  float x, y, z;
  float size;
  float mass;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Particle(float x, float y, float size, float mass){
    this.x = x;
    this.y = y;
    this.z = z;
    position = new PVector(x, y, z);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);
    this.size = size;
    this.mass = mass;
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
    circle(x, y, size);
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
  
  void checkCloseToCenter(){
    if(position.dist(new PVector(width/2, height/2, 0)) < 10) {
      mass = 0;
      acceleration = new PVector(0, 0, 0);
      velocity = new PVector(0, 0, 0);
    }
  }
}
