class Starfield {

  ArrayList particles = new ArrayList();
  int x;
  int y;
  float dx;
  float dy;
  float e = .05;
  int stars;

  Starfield () {
    particles.add(new Dot());
    x = width/2;
    y = height/2;
  }

  void display (int tstars) {
    stars = tstars;
    fill (255);
    noStroke();
    for (int i = 0; i < 100; i++) {
      if (particles.size() < stars) {
        particles.add(new Dot());
      }
    }
    for (int i = 0; i < particles.size(); i++) {
      Dot p = (Dot)particles.get(i);
      p.display(100);
      dx=x-p.x;
      dy=y-p.y;
      p.x=p.x-dx*e;
      p.y=p.y-dy*e;
      if (p.x > width || p.x < 0 || p.y > height || p.y < 0) {
        particles.remove(i);
      }
    }
  }
}
class Dot {
  float x;
  float y;
  float d;
  color o;

  Dot () {
    x=random(width/2-100, width/2+100);
    y=random(height/2-100, height/2+100);
    d=1;
  }

  void display (int to) {
    o = to;
    if (d < 10) {
      d+=.05;
    }
    fill(255, 255, 255, o);
    ellipse (x, y, d, d);
  }
}

