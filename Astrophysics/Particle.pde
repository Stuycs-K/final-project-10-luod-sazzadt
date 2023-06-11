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
  boolean sup;
  float hx, hy, hz, z1,x1, x2, y1, y2, starradius;
  float lifeSpan;
  
  Particle(float xpos, float ypos){
    this.position = new PVector(xpos,ypos);
    this.acceleration = new PVector(0,0);
    this.lifeSpan = 255;

      this.velocity = PVector.random2D();
      this.velocity.mult(random(0.5,10));

  }

  void applyForce2(PVector force){
    this.acceleration.add(force);
  }

  void update(){

       this.velocity.mult(0.96);
       this.lifeSpan = this.lifeSpan - 6;

    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }

  void show(int count){
    if (this.lifeSpan > 0){
        if(count<80){
          strokeWeight(2);
          stroke(255,255,255, this.lifeSpan);
        }else{
          strokeWeight(3);
          stroke(255,255,255,this.lifeSpan);
        }
    
    point(this.position.x, this.position.y);
  }
  }

  boolean done(){
    if(this.lifeSpan < 0){
      return true;
    }
    return false;
  }
  
  
  
  
  
  
  Particle(){
    this.hx = random(-width, width);
    this.hy = random(-height, height);
    this.hz = random(0, width);
  }
  
 
  
  void changeposition(){
    hz = hz - 15;
    if (this.hz < 1){
      hz = width;
      hx = random(-width, width);
      hy = random(-height, height);
      z1 = hz;
    }
  } 
  
  void display2(){
    x1 = map(hx/hz, 0, 1, 0, width);
    y1 = map(hy/hz, 0, 1, 0, height);
    
    starradius = map(hz, 0, width, 5, 0);
    
    x2 = map(hx/z1, 0, 1, 0, width);
    y2 = map(hy/z1, 0, 1, 0, height);
    this.z1 = this.hz;
    noFill();
    stroke(map(hz, 0, width, 300, 150));
    stroke(random(150, 255), 100, random(150, 255));
    line(x2, y2, x1, y1); 

    fill(255);
    noStroke();
    circle(x1, y1, starradius);
    
  }
  
  void reset(){
    hx = random(-width, width);
    hy = random(-height, height);
    hz = width;
    starradius = 0.2;
    z1 = hz;
  }
  
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
