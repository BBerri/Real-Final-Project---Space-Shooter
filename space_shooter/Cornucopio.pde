class Cornucopio {

  PImage cornucopio1, cornucopio2, cornucopio3;
  float x, y, w, h, rw, rh, health, healthi, zspeed, zacc, zacc2, frames, xspeed, damage, lSpeed, rSpeed, x2, y2, pd;
  boolean alive, shake, close, shooting, blue, yellow, red, charging, targeted, left, right, dead;
  int t, t2, o, o2;
  color tintc;

  Cornucopio(int thealth) {
    right = true;
    health = thealth;
    healthi = health;
    xspeed = 2;
    x = width/2;
    y = height/2;
    o2 = 255;
    w = 0;
    h = 0;
    rw = 400;
    rh = 400;
    zspeed = .001;
    zacc = .0005;
    zacc2 = .000008;
    cornucopio1 = loadImage("cornucopio1.png");
    cornucopio2 = loadImage("cornucopio2.png");
    cornucopio3 = loadImage("cornucopio3.png");
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


    if (blue == true && dead == false) {
      imageMode(CENTER);
      image(cornucopio1, x, y, w, h);
      imageMode(CORNER);
      tintc = color(0, 100, 255);
      lSpeed = -2;
      rSpeed = 2;
      damage = 40;
    }

    if (yellow == true && dead == false) {
      imageMode(CENTER);
      image(cornucopio2, x, y, w, h);
      imageMode(CORNER);
      tintc = color(255, 255, 0);
      lSpeed = -6;
      rSpeed = 6;
      damage = 60;
    }

    if (red == true && dead == false) {
      imageMode(CENTER);
      image(cornucopio3, x, y, w, h);
      imageMode(CORNER);
      tintc = color(255, 50, 0);
      lSpeed = -15;
      rSpeed = 15;
      damage = 80;
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
    text("CORNUCOPIO", width/2 - 80, height * .15);
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
        boss1Charging.play();
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
        tint(tintc);
        image(boss1Charging, x, y, w, h);
        noTint();
        imageMode(CORNER);
        if (millis() - t > 2900) {
          if (millis() - t < 3100) {
            fill(tintc);
            noStroke();
            rect(0, 0, width, height);
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
        x2 = x;
        y2 = y;
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
        x = x2 + random(-5, 5);
        y = y2 + random(-5, 5);
      }

      if (millis() - t2 > 8500) {
        imageMode(CENTER);
        image(redPlanet, width/2, height/2, pd, pd);
        imageMode(CORNER);
        pd +=.2;
        boss1Death.rewind();
        boss1Scream.rewind();
        boss1Song.rewind();
        pHealth = 1000;
      }
    }
  }
}

