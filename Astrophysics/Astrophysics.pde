Slider test1;

void setup(){
  size(800, 800);
  test1 = new Slider(400, 200, 100, 20, 0, 10, "hi"); 
  test1.display();
}

void draw(){
  background(255);
  if (mousePressed){
    test1.changed(mouseX, mouseY);
  }
  test1.display();
}
