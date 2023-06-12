class Button{
  String name, hold;
  float x, y;
  int type;
  int lastPressed = -1;
  
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
    rect(x, y, 120, 20, 20);
    fill(135, 118, 171);
    text(name, x + 10, y + 14);
  }
  
  void update(){
    if (!(mousePressed)){
      if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
        noStroke();
        fill(135, 118, 171);
        rect(x, y, 120, 20, 20);
        fill(215, 206, 235);
        text(name, x + 10, y + 14);
      }
    }
    else if (mousePressed){
      if(lastPressed > 0) {
        if(frameCount - lastPressed < 35) {
          return;
        }
      }
      if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
        lastPressed = frameCount;
        noStroke();
        fill(135, 118, 171);
        rect(x, y, 120, 20, 20);
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
          reset = true;
        }
      }
    }
  }
  
  boolean changed(int mousex, int mousey){
    boolean changed = false;
    if (mousex >= x && mousex <= x + 50 && mousey >= y && mousey <= y + 20){
      changed = true;
    }
    return changed;
  }
  
  void run(){
    display();
    update();
  }
  
  void update2(){
    if (!(mousePressed)){
    if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 120, 20, 20);
    fill(215, 206, 235);
    text(name, x + 10, y + 14);
    }
    }
    else if (mousePressed){
      if(lastPressed > 0) {
        if(frameCount - lastPressed < 35) {
          return;
        }
      }
      if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
        lastPressed = frameCount;
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 120, 20, 20);
    fill(215, 206, 235);
    if (startPlay == false){
      startPlay = true;
      mode = 1;
      doneSetUp = false;
      timeSlider = new Slider(50, 625, 350, 20, 0, 1200000, "Time (in thousands of years)", false);
      setUpButton = new Button(800, 700, "Begin Simulation");
      name = "START AGAIN";
    }
    }
  }
  }
  
  void update4(){
    if (!(mousePressed)){
    if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 120, 20, 20);
    fill(215, 206, 235);
    text(name, x + 10, y + 14);
    }
    }
    else if (mousePressed){
      if(lastPressed > 0) {
        if(frameCount - lastPressed < 35) {
          return;
        }
      }
      if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
        lastPressed = frameCount;
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 120, 20, 20);
    fill(215, 206, 235);
    if (startPlay == false){
      startPlay = true;
      mode = 3;
    }
    }
    }
  }
  
  void update5(){
    if (!(mousePressed)){
    if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 120, 20, 20);
    fill(215, 206, 235);
    text(name, x + 10, y + 14);
    }
    }
    else if (mousePressed){
      if(lastPressed > 0) {
        if(frameCount - lastPressed < 35) {
          return;
        }
      }
      if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
        lastPressed = frameCount;
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 120, 20, 20);
    fill(215, 206, 235);
    startPlay = false;
    mode = 2;
    }
    }
  }
  
  
  void run2(){
    display();
    update2();
  }
  
  void run4(){
    display();
    update4();
  }
  
  void run5(){
    display();
    update5();
  }
  
  void update6(){
    if (!(mousePressed)){
    if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 120, 20, 20);
    fill(215, 206, 235);
    text(name, x + 10, y + 14);
    }
    }
    else if (mousePressed){
      if(lastPressed > 0) {
        if(frameCount - lastPressed < 35) {
          return;
        }
      }
      if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
        lastPressed = frameCount;
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 120, 20, 20);
    fill(215, 206, 235);
    if (showHr == false){showHr = true;
    name = "Hide HR Diagram";}
    else{showHr = false;
    name = "HR Diagram";}
    }
    }
  }
  
  void run6(){
    display();
    update6();
  }
  
  void update3(){
    if (!(mousePressed)){
    if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 120, 20, 20);
    fill(215, 206, 235);
    text(name, x + 10, y + 14);
    }
    }
    else if (mousePressed){
      if(lastPressed > 0) {
        if(frameCount - lastPressed < 35) {
          return;
        }
      }
      if (mouseX >= x && mouseX <= x + 50 && mouseY > y && mouseY < y + 20){
        lastPressed = frameCount;
      noStroke();
    fill(135, 118, 171);
    rect(x, y, 120, 20, 20);
    fill(215, 206, 235);
    if (showInfo == false){
      name = "Hide Info";
      text(name, x + 10, y + 14);
      showInfo = true;
    }
    else if (showInfo == true){
      name = hold;
      text(name, x + 10, y + 14);
      showInfo = false;
    }
    }
    }
  }  
  
  void run3(){
    display();
    update3();
  }
}
