class PowerUp {

  String type;
  PImage medkit;
  PImage plus;
  float x, y, w, h, regen, o;
  boolean recieved, use;

  PowerUp (String ttype, float tx, float ty, float tregen) {
    x = tx;
    y = ty;
    w = 50;
    h = 50;
    regen = tregen;
    type = ttype;
    o = 255;
    medkit = loadImage("medkit.png");
    plus = loadImage("plus.png");
  }


  void display() {
    if (type == "medkit") {
      if (recieved == false) {      //if alive, draw medkit
        imageMode(CENTER);
        image(medkit, x, y, w, h);
        imageMode(CORNER);
      }
      if (recieved == true) {        //if not, draw plus
        imageMode(CENTER);
        tint(255,o);
        image(plus, x, y, 100, 100);
        noTint();
        imageMode(CORNER);
        o -= 8;
        y -= 1;
      }
    }
  }

  void activate() {
    if (type == "medkit") {
      if (mouseX > x-(w/2) && mouseX < x+(w/2) && mouseY > y-(h/2) && mouseY < y+(h/2)) {     //if clicked on
        if (mousePressed == true && recieved == false && rechargingC == false) {
          recieved = true;
          use = true;
        }
      }
      if (use == true) {      //give health
        pHealth += regen;
        use = false;
      }
    }
  }
}

