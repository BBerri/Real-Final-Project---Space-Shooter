class Bullet {
  float r;
  String type;
  float x, y, h, w, d, dist, maxDist, shrink, zspeed;
  boolean shot;

  Bullet(String ttype, float tx, float ty) {
    x = tx;
    y = ty;
    type = ttype;
    h = 200;
    w = 200;
    d = 200;
  }

  void display() {
    /////player bullet///////
    if (type == "player") {
      pushMatrix();
      translate(x, y);

      if (shot == true) {              //if shot, then move
        if (dist + d/2 < maxDist) {
          rotate(r);
          fill(0, 255, 0);
          noStroke();
          ellipse(dist, 0, d*1.5, d);
          zspeed = maxDist/7;
          dist += zspeed;
          d = 7 + 200 * ((maxDist-dist)/maxDist) * ((maxDist-dist)/maxDist);
        }
      }
      popMatrix();
    }
  }

  void update() {                              //update r value
    if (shot == false) {
      r = atan2(mouseY - y, mouseX - x);
      maxDist = dist(x, y, mouseX, mouseY);
    }
  }

  void shoot() {
    shot = true;
  }
}

