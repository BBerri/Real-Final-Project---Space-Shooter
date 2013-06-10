class Bullet {
  float r;
  String type;
  float x, y, h, w, d, dist, maxDist, shrink, zspeed, bx, by;
  boolean shot;

  ////slime/////
  PImage slime;
  PImage splat1;
  PImage splat2;
  PImage splat3;
  int o, pick;



  Bullet(String ttype, float tx, float ty, float td) {
    x = tx;
    y = ty;
    type = ttype;
    h = 200;
    w = 200;
    d = td;

    /////enemy/////
    bx = random(width/2 - 350, width/2 + 350);
    by = random(height/2 - 300, height/2 + 300);

    ///slime///
    pick = int(random(1, 3));
    slime = loadImage("slime.png");
    splat1 = loadImage("splat1.png");
    splat2 = loadImage("splat2.png");
    splat3 = loadImage("splat3.png");
    o = 255;
  }

  void display() {
    ///////////////player bullet//////////////
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

    ///////////////enemy bullet////////////////////////
    if (type == "enemy") {          //enemy bullet
      pushMatrix();
      translate(x, y);

      if (shot == true) {              //if shot, then move
        if (dist < maxDist) {
          rotate(r);
          //fill(0, 255, 0);
          //noStroke();
          //ellipse(dist, 0, d, d);
          imageMode(CENTER);
          image(slime, dist, 0, d, d);
          imageMode(CORNER);
          zspeed = maxDist/15;
          dist += zspeed;
          d = d + 20 * ((maxDist-dist)/maxDist);
        }
      }
      if (dist >= maxDist && pShielded == false) {
        rotate(r);
        imageMode(CENTER);
        tint(255, o);
        if (pick == 1) {
        image(splat1, maxDist, 0, d, d);
        }
        if (pick == 2) {
          image(splat2, maxDist, 0, d, d);
        }
        if (pick == 3) {
          image(splat3, maxDist, 0, d, d);
        }
        noTint();
        imageMode(CORNER);
        o -= 5;
      }

      popMatrix();
    }
  }

  void update() {                              //update r value

      if (type == "player") {
      if (shot == false) {
        r = atan2(mouseY - y, mouseX - x);
        maxDist = dist(x, y, mouseX, mouseY);
      }
    }

    if (type == "enemy") {
      if (shot == false) {
        r = atan2(by - y, bx - x);      //point at ship
        maxDist = dist(x, y, bx, by);
      }
    }
  }

  void shoot() {
    shot = true;
  }
}

