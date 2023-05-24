class Slider{
  float x, y;
  float w, h;
  float min, max;
  float value, valueX;
  String name;
  
  Slider(float x, float y, float w, float h, float min, float max, String name){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; 
    this.min = min;
    this.max = max;
    this.valueX = x + max / 2;
    this.value = map(valueX, x, x + w, min, max);
    this.name = name;
  }
  
  void display(){
    noStroke();
    fill(215, 206, 235);
    rect(x, y, w, h, 20);
    noStroke();
    fill(135, 118, 171);
    rect(x, y, (value / max) * w, h, 20);
    text(value, x, y - 10);

    text(name, x, y + h + 10, x + w, y + h + 10);
  }
  
  boolean changed(int mousex, int mousey){
    boolean changed = false;
    if (mousex >= x && mousex <= x + w && mousey > y && mousey < y + h){
      changed = true;
      valueX = mousex;
      value = map(mousex, x, x + w, min, max);
    }
    return changed;
  }
  
  float getValue(){
    return value;
  }
}
