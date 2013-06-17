class roboSquid {

  PImage roboSquid;
  float x, y, w, h, rw, rh, health, healthi, zspeed, zacc, zacc2, frames, xspeed, damage, lSpeed, rSpeed, xi, yi, pd;
  boolean alive, shake, close, shooting, blue, yellow, red, charging, targeted, left, right, dead;
  int t, t2, o, o2;
  color tintc;

  roboSquid(int thealth) {
    right = true;
    health = thealth;
    healthi = health;
    xspeed = 2;
    x = width/2;
    y = height/2;
    o2 = 255;
    w = 0;
    h = 0;
    rw = 600;
    rh = 600;
    zspeed = .001;
    zacc = .0005;
    zacc2 = .000008;
    roboSquid = loadImage("roboSquid.png");
  }


  void display() {
    if (health >= healthi * 2/3) {      //more than 2/3 health
      blue = true;
    }

    if (health >= healthi * 1/3 && health <= healthi * 2/3) {      //more than 1/3 health, less than 2/3
      yellow = true;
    }

    if (health <= healthi * 1/3) {      //less than 1/3 health
      red = true;
    }


    if (blue == true && dead == false && charging == false) {
      imageMode(CENTER);
      image(roboSquid, x, y, w, h);
      imageMode(CORNER);
      lSpeed = -4;
      rSpeed =4;
      damage = 50;
    }

    if (yellow == true && dead == false && charging == false) {
      imageMode(CENTER);
      image(roboSquid, x, y, w, h);
      imageMode(CORNER);
      lSpeed = -12;
      rSpeed = 12;
      damage = 70;
    }

    if (red == true && dead == false && charging == false) {
      imageMode(CENTER);
      image(roboSquid, x, y, w, h);
      imageMode(CORNER);
      lSpeed = -20;
      rSpeed = 20;
      damage = 90;
    }
    if (alive == false && dead == false) {
      imageMode(CENTER);
      image(roboSquid, x, y, w, h);
      imageMode(CORNER);
    }

    if (health > 0) {
      alive = true;
    }
    else {
      alive =false;
    }
    
    /////health//////
    if (alive == true) {
    noStroke();
    fill(255, 0, 0);
    rect(width/2 - 150, height * .15, 300, 20);
    fill(0, 255, 0);
    rect(width/2 - 150, height * .15, 300 * health/healthi, 20);
    textFont(font40, 40);
    text("ROBO-SQUID", width/2 - 80, height * .15);
    }
  }



  void approach() {
    if (alive == true && close == false) {

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
      if (w >= rw && h >= rh) {
        t = millis();
        close = true;
      }
    }
  }


  void move() {
    if (close == true && charging == false && shooting == false & alive == true) {
      if (x + w/2 >= width) {
        left = true;
        right = false;
      }
      if (x - w/2 <= 0) {
        right = true;
        left = false;
      }

      if (left == true) {
        x += lSpeed;
      }
      if (right == true) {
        x += rSpeed;
      }

      if (millis() - t > 2000) {        //beging shooting every 2 seconds
        charging = true;
        boss2Charging.play();
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


  void shoot() {
    if (alive == true) {
      if (charging == true) {
        imageMode(CENTER);
        image(boss2Charging, x, y, w, h);
        imageMode(CORNER);
        if (millis() - t > 2900) {
          if (millis() - t < 3100) {
          }
          if (millis() - t > 3100) {
            charging = false;
            t = millis();
            shooting = true;
          }
        }
        if (shooting == true) {
          if (pShielded == false) {
            pHealth -= damage;
            shake = true;
          }
          shooting = false;
        }
      }
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
    if (playerShot == true && targeted == true && alive == true) {
      health-=1;
      if (health <= 0) {
        t2 = millis();        //set timer for death effects
      }

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


  void death() {
    if (alive == false) {
      if (millis() - t2 < 1000) {
        xi = x;
        yi = y;
      }
      if (millis() - t2 > 1000) {
        boss1Death.play();
        boss1Scream.play();
      }
      if (millis() - t2 > boss1Death.length() + 1000) {
        boss1Death.pause();
      }
      if (millis() - t2 > boss1Scream.length() + 1000) {
        boss1Scream.pause();
      }
      if (millis() - t2 > 5500 && millis() - t2 < 8000) {
        fill(255, o);
        if (o < 255) {
          o += 10;
        }
        rect(0, 0, width, height);
      }
      if (millis() - t2 > 8000) {
        fill(255, o);
        o -= 5;
        rect(0, 0, width, height);
        dead = true;
      }

      if (millis() - t2 > 1000 && millis() - t2 < 8000) {
        playable = false;
        x = xi + random(-5, 5);
        y = yi + random(-5, 5);
      }

      if (millis() - t2 > 8500) {
      }
    }
  }
}

