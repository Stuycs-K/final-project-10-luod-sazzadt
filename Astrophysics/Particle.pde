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
  float v = (float) (Math.random() * 360);
  float angle;
  float circleRadius;

  
  Particle(float x, float y, float size, float mass, boolean smoky){
    this.x = x;
    this.y = y;
    this.z = z;
    position = new PVector(x, y, z);
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 0);
    angle = atan2(width / 2 - position.x, height / 2 - position.y);
    circleRadius = dist(width / 2, height / 2, position.x, position.y);
    this.size = size;
    this.mass = mass;
    this.smoky = smoky;
    if(smoky) {
      ps = new LightParticleSystem(0, new PVector(x, y));
    }
  }
  
  void display(float r, float g, float b){
    x = position.x;
    y = position.y;
    z = position.z;
    translate(x, y, z);
    noStroke();
    fill(r, g, b);
    noStroke();
    fill(r, g, b);
    circle(x, y, size);
    if(smoky) {
      ps.applyForce(new PVector(-0.1, 0));
      ps.run();
      if(frameCount % 5 == 0) {
         ps.addParticle();
      }
    }
  }
  
  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.set(0, 0);
    /*
    if(smoky) {
     // ps = new LightParticleSystem(0, position);

    }
    */
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
  
  void centripetalMotion() {
    position.x = width / 2 + cos(angle) * circleRadius;
    position.y = height / 2 + sin(angle) * circleRadius;
    angle += PI/v;
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
      smoky = false;
      return true;
    }
    return false;
  }
    
  void drawEllipse() {
    pushMatrix();
    float radiusX = 50;
    float radiusY = 100;
    translate(x, y);
    theta += 0.01;
    float posX = radiusX * cos(5 * theta );
    float posY = radiusY * sin(5 * theta );
    posX = posX * cos(7 * PI / 8) - posY * sin(7 * PI / 8);
    posY = posY * cos(7 * PI / 8) + posX * sin(7 * PI / 8);
    fill( 255 );
    ellipse( posX, posY, size, size );
    popMatrix();
  }
}
