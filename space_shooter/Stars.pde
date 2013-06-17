class Stars {
  int count;
  Star[] starz;

  Stars(int tcount) {
    count = tcount;
    starz = new Star[count];
    for (int i=0; i<count; i++) {
      starz[i] = new Star();
    }
  }

  void display() {
    for (int i=0; i<count; i++) {
      strokeWeight(1);
      stroke(255, starz[i].o);
      point(starz[i].x, starz[i].y);

      starz[i].o = 100;

      if (millis() - starz[i].t > starz[i].interval) {
        starz[i].flicker = true;
      }
      if (starz[i].flicker == true) {
        starz[i].o = 255;
        starz[i].interval = random(500, 2000);
        starz[i].t = millis();
        starz[i].flicker = false;
      }
    }
  }
}


class Star {
  float x, y, interval;
  int o, t;
  boolean flicker;

  Star() {
    x = random(0, width-50);
    y = random(height * .55);
    interval = random(500, 2000);
    o = 100;
  }
}

