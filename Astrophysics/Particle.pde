class Particle{
  float x, y, z;
  float size;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Particle(float x, float y, float size){
    this.x = x;
    this.y = y;
    this.z = z;
    position = new PVector(x, y, z);
    this.size = size;
  }
  
  void display(){
    translate(x, y, z);
    lights();
    noStroke();
    fill(255);
    //translate(400, 400, 0);
    //translate(x, y, z);
    noStroke();
    fill(255);
    //sphere(size);
    circle(x, y, size);
  }
}
