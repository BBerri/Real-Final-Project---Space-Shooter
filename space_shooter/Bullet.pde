class Bullet {
  float r;
  String type;
  float x, y, dist, maxDist, shrink;
  boolean shot;

  Bullet(String ttype) {
    type = ttype;
    x = width/2;
    y = 8*height/9;
  }

  void display() {
  if (mousePressed == true){
    shot = true;
  }
    /////player bullet///////
    if (type == "player") {
      pushMatrix();
      translate(x, y);
      
      if (shot == false) {        //if not shot yet update r
        r = atan2(mouseY - y, mouseX - x);
        rotate(r);
        maxDist = dist(x, y, mouseX, mouseY);
      }
      if (shot == true && dist+50 < maxDist) {        //if not shot yet don't update r
        rotate(r);
        fill(0, 255, 0);
        quad(dist+0, 10-shrink, dist+0, -10+shrink, dist+50, -8+shrink, dist+50, 8-shrink);
        dist +=10;
        shrink+=.1;
      }
      
      popMatrix();
    }
  }

  void update() {
    if (type == "player") {
    }
  }
}

