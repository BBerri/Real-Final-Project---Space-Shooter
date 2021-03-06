ArrayList particles = new ArrayList();
int x;
int y;
int d = 10;
float dx;
float dy;
float e = .05;
int stars = 50;

void setup () {
  background (0);
  size (1280, 720);
  particles.add(new Dot());
  x=width/2;
  y=height/2;
}

void draw () {
  background (0);
  fill (255);
  noStroke();
  for (int i = 0; i < 100; i++) {
    if (particles.size() < stars) {
      particles.add(new Dot());
    }
  }
  for (int i = 0; i < particles.size(); i++) {
    Dot p = (Dot)particles.get(i);
    p.display();
    dx=x-p.x;
    dy=y-p.y;
    p.x=p.x-dx*e;
    p.y=p.y-dy*e;
    if (p.x > width || p.x < 0 || p.y > height || p.y < 0) {
      particles.remove(i);
    }
  }
}

class Dot {
  float x;
  float y;
  float d;

  Dot () {
    x=random(width);
    y=random(height);
    d=2;
  }

  void display () {
    fill(255);
    ellipse (x, y, d, d);
  }
}

