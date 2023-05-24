class Particle{
  int x, y, z;
  float size;
  
  Particle(int x, int y, int z, float size){
    this.x = x;
    this.y = y;
    this.z = z;
    this.size = size;
  }
  
  void display(){
    translate(x, y, z);
    lights();
    noStroke();
    fill(255);
    sphere(size);
  }
}
