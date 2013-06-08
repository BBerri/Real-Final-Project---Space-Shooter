class Enemy {
  float x, y, w, h, rw, rh, xspeed, yspeed, zspeed, zacc, zacc2;
  boolean space, left, right, up, down, hit, shake, alive, targeted, canShoot, shoot;
  PImage pic;
  int frames, health, t;

  Enemy(PImage tpic, int thealth, boolean tcanShoot) {
    health = thealth;
    pic = tpic;
    canShoot = tcanShoot;
    rw = 100;
    rh = 100;
    w = 0;
    h = 0;
    space = true;
    x = random(width/2-100, width/2 + 100);
    //y = random(height/2 - 50, height/2 + 50);
    y = random(height/2 + 50, height/2 + 50);
    zspeed = .001;
    zacc = .0005;
    zacc2 = .000008;
  }

  void display () {
    //////whether alive or not/////
    if (health > 0) {
      alive = true;
    }
    else {
      alive = false;
    }

    if (alive == true) {
      fill(255);
      noStroke();
      rectMode(CENTER);
      image(pic, x, y, w, h);
      rectMode(CORNER);
    }
  }




  void approach() {
    if (alive == true) {
      shake();

      if (x < width/2) {    //moving right
        right = true;
      }
      if (x > width/2) {    //moving left
        left = true;
      }
      if (y < height/2) {    //moving down
        down = true;
      }
      if (y > height/2) {    //moving up
        up = true;
      }

      ///////////space enemy////////////
      if (space==true) {
        if (right==true) {
          xspeed = (dist(x, height/2, width/2, height/2))/1000;    //dist from x to width/2
        }
        if (left==true) {
          xspeed = -(dist(x, height/2, width/2, height/2))/1000;    //dist from x to width/2
        }
        if (up == true) {
          yspeed = -(dist(width/2, y, width/2, height/2))/1000;    //dist from y to height/2
        }
        if (down == true) {
          yspeed = (dist(width/2, y, width/2, height/2))/1000;    //dist from y to height/2
        }

        x += xspeed;
        y += yspeed;
        zspeed += zacc;
        zacc += zacc2;

        if (h < rh || w < rw) {    //if still approaching
          w+= zspeed;
          h+= zspeed;
        }
        if (h >= rh && w >= rw && canShoot == false) {      //if already close and doesnt shoot
          y+=20;
          x +=xspeed*20;
        }

        if (h >= rh && w >= rw && canShoot == true) {    //if close and does shoot
          shoot();
        }    

        if (y > height) {
          shake = true;
        }
      }
    }
  }



  void shake() {
    if (shake == true) {
      if (frameCount - frames < 40) {
        HUDx = random(-3, 3);
        HUDy = random(-3, 3);
      }
      if (frameCount - frames >= 40) {
        shake = false;
      }
    }
    else {
      frames = frameCount;
    }
  }


  void hit() {
    ///////////check for mouse over enemy////////////
    if (mouseX > x & mouseX < x+w && mouseY > y && mouseY < y+h) {
      targeted = true;
    }

    //////////////////lower health when hit///////////
    if (playerShot == true && millis() - t > 50 && targeted == true) {
      health-=1;
      t = millis();
    }
  }


  void shoot() {
    if (millis() - t > 1000) {
      shoot = true;
      shake = true;
      t = millis();
    }
    if (shoot == true) {
      if (millis() - t < 50) {
        stroke(0, 0, 255);
        strokeWeight(5);
        line (x + w/2, y + 7*h/8, width/2, 9*width/10);
      }
      if (millis() - t > 50) {
        shoot = false;
      }
    }
  }
}

