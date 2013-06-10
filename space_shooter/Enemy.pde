class Enemy {
  float x, y, w, h, rw, rh, xspeed, yspeed, zspeed, zacc, zacc2, damage;
  boolean left, right, up, down, hit, shake, alive, targeted, shoot;
  PImage pic;
  int frames, health, t;
  String behavior;
  ArrayList bullets;

  Enemy() {
    w = 0;
    h = 0;
    x = random(width/2-300, width/2 + 300);
    y = random(height/2 + 100, height/2 + 100);
    bullets = new ArrayList();
    //zspeed = .001;
    //zacc = .0005;
    //zacc2 = .000008;
  }

  void display () {
    //////whether alive or not/////
    if (health > 0) {
      alive = true;
    }
    else {
      alive = false;
    }

    pushMatrix();
    translate(x, y);
    rotate(degrees(pdegrees));
    if (alive == true) {
      noStroke();
      imageMode(CENTER);
      image(pic, 0, 0, w, h);
      imageMode(CORNER);
    }
    popMatrix();
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

        if (h < rh/2 || w < rw/2) {    //if still approaching (really far)
          w+= zspeed*.8;
          h+= zspeed*.8;
        }
        if (h > rh/2 && h < rh || w > rw/2 && w < rw) {    //if still approaching (closer)
          w+= zspeed*2;
          h+= zspeed*2;
        }
        if (h >= rh && w >= rw && behavior == "crash") {      //if already close and doesnt shoot
          y+=20;
          x +=xspeed*20;
        }

        if (h >= rh && w >= rw && behavior == "laser") {    //if close and does shoot
          shoot();
        } 

        if (h >= rh && w >= rw && behavior == "slime") {    //if close and does shoot
          slime();
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
    if (mouseX > x-w/2 & mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      targeted = true;
    }

    //////////////////lower health when hit///////////
    if (playerShot == true && targeted == true) {
      health-=1;

      ////flash red/////
      if (health > 0) {
        fill(255, 0, 0);
        noStroke();
        rectMode(CENTER);
        rect(x, y, w, h);
        rectMode(CORNER);
      }
    }
  }


  void shoot() {
    if (millis() - t > 1000) {
      shoot = true;
      t = millis();
      if (pShielded == false) {
        shake = true;
        pHealth -= damage;
      }
    }
    if (shoot == true) {
      if (millis() - t < 50) {
        stroke(0, 0, 255);
        strokeWeight(5);

        pushMatrix();
        translate(x, y);
        line (0, 0, 0, 4*height/10);
        popMatrix();
      }
      if (millis() - t > 50) {
        shoot = false;
      }
    }
  }




  void slime() {

    for (int i=0; i<bullets.size(); i++) {        //display shots
      Bullet shots = (Bullet) bullets.get(i);
      shots.display();
    }

    /////show shots/////
    for (int i=0; i<bullets.size(); i++) {
      Bullet shots = (Bullet) bullets.get(i);
      shots.update();
      shots.shoot();
    }

    if (millis() - t > 1000) {
      shoot = true;
      t = millis();
      if (pShielded == false) {
        shake = true;
        pHealth -= damage;
      }
    }
    if (shoot == true) {
      bullets.add(new Bullet("enemy", x, y, 10));
      shoot = false;
    }
  }
}
