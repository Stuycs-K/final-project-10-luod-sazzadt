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
    lights();
    noStroke();
    fill(255);
    sphere(size);
    //translate(400, 400, 0);
    //translate(x, y, z);
    //lights();
    noStroke();
    fill(255);
    //sphere(size);
    circle(x, y, size);
  }
}
