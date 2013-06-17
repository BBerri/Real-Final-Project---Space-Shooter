class Prop {
  PImage pic;
  float x, y, w, h, rw, rh, zspeed, zacc, dist;
  
  Prop(PImage tpic, float tx1, float tx2, float ty, float tw, float th) {
    pic = tpic;
    x = random(tx1, tx2);
    y = ty;
    rw = tw;
    rh = th;
    zspeed = .05;
    zacc = .002;
  }
  
  void display() {
    imageMode(CENTER);
    image(pic, x, y, w, h);
    imageMode(CORNER);
  }
  
  
  void move() {
    y += zspeed/4;
    if (x > width/2) {
      x += dist(x ,0, width/2, 0)/1000;
    }
    if (x < width/2) {
      x += -dist(x ,0, width/2, 0)/1000;
    }
    w += zspeed/4;
    h += zspeed/4;
    
    zspeed += zacc;
    dist += zspeed/4;
    
    if (dist > 20 && dist < 40) {
      zacc = .01;
    }
    if (dist > 40 && dist < 60) {
      zacc = .025;
    }
    if (dist > 60) {
      zacc = .05;
    }
  }
  
  
}
