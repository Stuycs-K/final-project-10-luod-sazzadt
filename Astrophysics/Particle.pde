class Particle{
  float x, y, z;
  float size;
  
  Particle(float x, float y, float size){
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void display(){
    translate(x, y, z);
    noStroke();
    fill(255);
    noStroke();
    fill(255);
    circle(x, y, size);
  }
}
