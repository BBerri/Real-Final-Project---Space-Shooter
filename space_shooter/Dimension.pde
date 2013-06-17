class Dimension {
  Line[] lineField;
  int count;

  Dimension(int tcount) {
    count = tcount;
    lineField = new Line[count];
    for (int i=0; i<count; i++) {
      lineField[i] = new Line();
    }
  }
  
  void display() {
    for (int i=0; i<count; i++) {
      lineField[i].display();
    }
  }
}

class Line {
  float x, y, l, speed;

  Line() {
    x = random(width);
    l = random(50, 200);
    y = random(0 - l - 1000, 0 - l);
    speed = 20;
  }

  void display() {
    stroke(190, 0, 201);
    strokeWeight(3);
    line(x, y, x, y + l);
    y += speed;

    if (y > height) {
      x = random(width);
      y = random(0 - l - 200, 0 - l);
    }
  }
}

