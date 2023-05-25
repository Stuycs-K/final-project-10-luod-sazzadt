class Button{
  String name, hold;
  float x, y;
  
  Button(float x, float y, String name){
    this.x = x;
    this.y = y;
    this.name = name;
    this.hold = name;
  }
  
  void setName(String name){
    this.name = name;
  }
  
  void display(){
    noStroke();
    fill(215, 206, 235);
    rect(x, y, 100, 20, 20);
    fill(135, 118, 171);
    text(name, x + 10, y + 14);
  }
  
  void update(){
    if (!(mousePressed)){
    if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 100, 20, 20);
    fill(215, 206, 235);
    text(name, x + 10, y + 14);
    }
    }
    else if (mousePressed){
      if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 100, 20, 20);
    fill(215, 206, 235);
    if (doneSetUp == false){
      name = "Reset";
      text(name, x + 10, y + 14);
      doneSetUp = true;
    }
    else if (doneSetUp == true){
      name = hold;
      text(name, x + 10, y + 14);
      doneSetUp = false;
    }
    }
    }
  }
  
  boolean changed(int mousex, int mousey){
    boolean changed = false;
    if (mousex >= x && mousex <= x + 50 && mousey > y && mousey < y + 20){
      changed = true;
    }
    return changed;
  }
  
  void run(){
    display();
    update();
  }
}
