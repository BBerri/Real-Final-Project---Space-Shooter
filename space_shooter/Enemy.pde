class Enemy {
  float x, y, w, h, rw, rh, xspeed, yspeed, zspeed, zacc, zacc2, damage;
  boolean left, right, up, down, hit, shake, alive, targeted, shoot, attached, shooting, drop;
  PImage pic, snail2;
  int frames, health, t;
  String behavior;
  ArrayList bullets;
  PowerUp kit;


  Enemy() {
    w = 0;
    h = 0;
    x = random(width/2-500, width/2 + 500);
    if (space == true) {
      y = random(height/2 - 200, height/2 + 200);
    }
    if (space == false) {
      y = random(height/2 - 400, height/2 - 50);
    }
    bullets = new ArrayList();
    kit = new PowerUp("medkit", x, y, 400);
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

    if (alive == false && drop == true) {
      kit.display();
      kit.activate();
    }

    pushMatrix();
    translate(x, y);
    rotate(degrees(pdegrees));
    if (alive == true) {
      noStroke();
      if (attached == false || shooting == false) {
        imageMode(CENTER);
        image(pic, 0, 0, w, h);        //not attached, no GIF
        imageMode(CORNER);
      }
      if (attached == true) {
        imageMode(CENTER);
        image(squidGif, 0, 0, w, h);
        imageMode(CORNER);
      }
      if (shooting == true) {
        imageMode(CENTER);
        image(snail2, 0, 0, w, h);
        imageMode(CORNER);
      }
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
        if (right==true) {
          xspeed = (dist(x, height/2, width/2, height/2))/2000;    //dist from x to width/2
        }
        if (left==true) {
          xspeed = -(dist(x, height/2, width/2, height/2))/2000;    //dist from x to width/2
        }
        if (up == true) {
          yspeed = -(dist(width/2, y, width/2, height/2))/2000;    //dist from y to height/2
        }
        if (down == true) {
          yspeed = (dist(width/2, y, width/2, height/2))/2000;    //dist from y to height/2
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
        if (h >= rh && w >= rw && behavior == "stick") {    //if close and does shoot
          stick();
        }     

        if (y > height) {
          shake = true;
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
        frames = frameCount;
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
    else {
      targeted = false;
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
        if (space == true) {
        line (0, 0, 0, 4*height/10);
        }
        if (space == false) {
          line (0, 0, 0, height);
        }
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
    if (millis() - t < 300) {      //shooting if small time passed since shot
      shooting = true;
    }
    else {
      shooting = false;
    }
  }

  void stick() {
    if (w < rw * 1.5 && h < rh * 1.5) {
      //      if (up == true && right == true) {
      //        x += dist(x, 0, width/2, 0)/10;
      //        y -= dist(0, y, 0, height/2)/10;
      //      }
      //      if (up == true && left == true) {
      //        x -= dist(x, 0, width/2, 0)/10;
      //        y -= dist(0, y, 0, height/2)/10;
      //      }
      //      if (down == true && left == true) {
      //        x -= dist(x, 0, width/2, 0)/10;
      //        y += dist(0, y, 0, height/2)/10;
      //      }
      //
      //      if (down == true && right == true) {
      //        x += dist(x, 0, width/2, 0)/10;
      //        y += dist(0, y, 0, height/2)/10;
      //      }


      if (right == true) {
        x += dist(x, 0, width/2, 0)/10;
      }
      if (left == true) {
        x -= dist(x, 0, width/2, 0)/10;
      }
      if (down == true) {
        y += dist(0, y, 0, height/2)/10;
      }
      if (up == true) {
        y -= dist(0, y, 0, height/2)/10;
      }


      w += 3*zspeed;
      h += 3*zspeed;
    }

    if (w < 6*rw && w > 1.5*rw && h > 1.5*rh && h < 6*rh) {
      w += 9*zspeed;
      h += 9*zspeed;
    }
    if (w >= 6*rw && h >= rh*6) {
      shake = true;
      attached = true;
    }
  }
}

