class Enemy {
  float x, y, w, h, rw, rh, xspeed, yspeed, zspeed, zacc, zacc2;
  boolean hit, shake;
  int frames;


  Enemy() {
    w = 0;
    h = 0;
    rw = width/10;
    rh = height/10;
    x = width/2;
    y = height/2;
    zspeed = .001;
    zacc = .0005;
    zacc2 = .000002;
  }

  void display() {
    strokeWeight(0);
    rect(x, y, w, h);
  }

  void move() {
    approach();
    shake();
  }

  void approach() {
    if (keyPressed == true && key == 'g'){
    if (w < rw || h<rh) {
      zacc += zacc2;
      zspeed += zacc;
      w += zspeed;
      h += zspeed;
      x -= zspeed/4;
      y += zspeed/4;
    }
    if (w > rw && h>rh && y<height) {
      w += zspeed*10;
      h += zspeed*10;
      y += 10;
      x -= zspeed;
      y += zspeed;
      if (y > height) {
        hit = true;
        shake = true;
      }
    }
    if (hit == true) {
      println("YES");
      hit = false;
    }
    }
  }

  void shake() {
    if (shake == true) {
      if (frameCount - frames < 40) {
        HUDx = width + random(-2, 2);
        HUDy = height + random(-2, 2);
        //println("SHAKE");
      }
      if (frameCount - frames >= 240) {
        shake = false;
      }
    }
    else {
      frames = frameCount;
    }
  }
}

