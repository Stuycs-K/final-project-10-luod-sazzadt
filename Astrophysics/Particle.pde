class Particle{
  PVector position, velocity, acceleration;
  float x, y;
  float size;
  
  Particle(float x, float y, float size){
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void display(){
    translate(x, y);
    lights();
    noStroke();
    fill(255);
    //translate(400, 400, 0);
    //translate(x, y, z);
    //lights();
    noStroke();
    fill(255);
    //sphere(size);
    circle(x, y, size);
  }
}
