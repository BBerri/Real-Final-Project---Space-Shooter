class Rootabagor {
  PImage rootabagor, rootabagor2, rootabagor3, throne, throneFog, fog1, fog2, miniR, bshield;
  boolean intro = true, floatD, floatU, fire, targeted, alive = true, MR1targeted, MR2targeted, MR1alive, MR2alive, Bshield, dead;
  float x, y, w, h, xi, yi, move, fx1, fx2, t1, t2, healthi, damage, MRx1, MRx2, MRy1, MRy2, x2, y2;
  int PART = 1, PHASE = 1, health, MR1health = 15, MR2health = 15, o;
  Dimension dimension;
  Fireball bigFire, lfire1, lfire2;

  Rootabagor() {
    rootabagor = loadImage("rootabagor.png");
    rootabagor2 = loadImage("rootabagor2.png");
    rootabagor3 = loadImage("rootabagor3.png");
    miniR = loadImage("minirootabagor.png");
    throne = loadImage("throne.png");
    throneFog = loadImage("throneFog.png");
    fog1 = loadImage("fog1.png");
    fog2 = loadImage("fog2.png");
    bshield = loadImage("bubble.png");
    xi = width/2;
    yi = height/2;
    x = xi;
    y = yi;
    w = 500;
    h = 500;
    MRx1 = width/2 - 500;
    MRx2 = width/2 + 500;
    MRy1 = height/2;
    MRy2 = height/2;
    damage = 200;
    healthi = 60;
    health = 60;
    fx1 = -200;
    fx2 = width+200;
    floatD = true;
    dimension = new Dimension(75);
    bigFire = new Fireball(x, y+100, 100); 
    lfire1 = new Fireball(width/2 - 500, height/2, 100);
    lfire2 = new Fireball(width/2 + 500, height/2, 100);
    //1st click - 34992
    //2nd clikc - 35441
    //bass cannon - 38305
  }


  void hit() {
    ///////////check for mouse over BIG////////////
    if (mouseX > x-w/2 & mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      targeted = true;
    }
    else {
      targeted = false;
    }

    //////////////////lower health when hit///////////
    if (playerShot == true && targeted == true && alive == true) {
      if (Bshield == false) {
        health-=1;
      }
      if (health <= 0) {
      }

      ////flash red/////
      if (health > 0 && Bshield  == false) {
        fill(255, 0, 0);
        noStroke();
        rectMode(CENTER);
        rect(x, y, w, h);
        rectMode(CORNER);
      }
    }

    ///////////check for mouse over MINI1////////////
    if (mouseX > MRx1-75 & mouseX < MRx1+75 && mouseY > MRy1-75 && mouseY < MRy1+75) {
      MR1targeted = true;
    }
    else {
      MR1targeted = false;
    }

    //////////////////lower health when hit///////////
    if (playerShot == true && MR1targeted == true && MR1alive == true) {
      MR1health-=1;
      if (MR1health <= 0) {
        MR1alive = false;
      }

      ////flash red/////
      if (MR1health > 0) {
        fill(255, 0, 0);
        noStroke();
        rectMode(CENTER);
        rect(MRx1, MRy1, 150, 150);
        rectMode(CORNER);
      }
    }

    ///////////check for mouse over MINI2////////////
    if (mouseX > MRx2-75 & mouseX < MRx2+75 && mouseY > MRy2-75 && mouseY < MRy2+75) {
      MR2targeted = true;
    }
    else {
      MR2targeted = false;
    }

    //////////////////lower health when hit///////////
    if (playerShot == true && MR2targeted == true && MR2alive == true) {
      MR2health-=1;
      if (MR2health <= 0) {
        MR2alive = false;
      }

      ////flash red/////
      if (MR2health > 0) {
        fill(255, 0, 0);
        noStroke();
        rectMode(CENTER);
        rect(MRx2, MRy2, 150, 150);
        rectMode(CORNER);
      }
    }
  }

  void display() {
    finalBossSong.play();
    if (intro == true) {
      if (PART == 1) {
        tint(150);
        image(throne, 0, 0, width, height);
        imageMode(CENTER);
        tint(0);
        image(rootabagor, x, y, w, h);
        image(fog1, fx1, height - 400, width, height);
        image(fog2, fx2, height - 400, width, height);
        imageMode(CORNER);
        noTint();
        if (finalBossSong.position() >= 34992) {
          PART = 2;
        }
        fx1 += .25;
        fx2 -= .25;
      }
      if (PART == 2) {    //turn left lights on
        image(torchesLEFT, 0, 0, width, height);
        imageMode(CENTER);
        tint(0);
        image(rootabagor, x, y, w, h);
        image(fog1, fx1, height - 400, width, height);
        image(fog2, fx2, height - 400, width, height);
        imageMode(CORNER);
        noTint();
        if (finalBossSong.position() >= 35441) {
          PART = 3;
        }
        fx1 += .25;
        fx2 -= .25;
      }
      if (PART == 3) {    // turn right lights on
        image(torchesBOTH, 0, 0, width, height);
        imageMode(CENTER);
        tint(0);
        image(rootabagor, x, y, w, h);
        image(fog1, fx1, height - 400, width, height);
        image(fog2, fx2, height - 400, width, height);
        imageMode(CORNER);
        noTint();
        if (finalBossSong.position() >= 38305) {
          PART = 4;
        }
        fx1 += .25;
        fx2 -= .25;
      }
      if (PART == 4) {    // rise
        image(torchesBOTH, 0, move, width, height);
        tint(180);
        image(throneFog, 0, -height + move, width, height);
        noTint();
        imageMode(CENTER);
        tint(0);
        image(rootabagor, x, y, w, h);
        image(fog1, fx1, height - 400 + move, width, height);
        image(fog2, fx2, height - 400 + move, width, height);
        imageMode(CORNER);
        noTint();
        move+=.5;
        fx1 += .25;
        fx2 -= .25;

        t1 = millis();
      }


      ////floating/////
      if (floatD == true) {
        y += .1;
        if (y > yi + 10) {
          floatD = false;
          floatU = true;
        }
      }
      if (floatU == true) {
        y -= .1;
        if (y < yi - 10) {
          floatD = true;
          floatU = false;
        }
      }
      if (finalBossSong.position() >= 55565) {
        fire = true;
        intro = false;
      }
    }

    if (fire == true) {

      ////float/////
      if (floatD == true) {
        y += .3;
        MRy1 += .3;
        MRy2 += .3;
        if (y > yi + 15) {
          floatD = false;
          floatU = true;
        }
      }
      if (floatU == true) {
        y -= .3;
        MRy1 -= .3;
        MRy2 -= .3;
        if (y < yi - 15) {
          floatD = true;
          floatU = false;
        }
      }

      ////background/////
      fill(200, 200, 0);
      rect(0, 0, width, height);
      dimension.display();

      if (PHASE == 1) {
        imageMode(CENTER);
        image(rootabagor, x, y, w, h);
        imageMode(CORNER);
        bigFire.display();

        if (millis() - t1 > 2000) {
          bigFire.shoot = true;
          t1 = millis();
        }
        if (health < healthi * .6666) {
          PHASE = 2;
          t2 = millis();
        }
      }

      if (PHASE == 2) {
        imageMode(CENTER);
        image(rootabagor2, x, y, w, h);
        imageMode(CORNER);
        bigFire.display();

        if (millis() - t1 > 1000) {
          bigFire.shoot = true;
          t1 = millis();
        }

        if (millis() - t2 > 3000) {
          imageMode(CENTER);
          image(soundWave, x, y+100);
          imageMode(CORNER);
          if (millis() - t2 > 7000) {
            if (pShielded == false) {
              pHealth -= damage;
            }
            t2 = millis();
          }
        }
        if (health < healthi * .333333) {
          PHASE = 3;
          MR1alive = true;
          MR2alive = true;
        }
      }


      if (PHASE == 3) {
        imageMode(CENTER);
        image(rootabagor3, x, y, w, h);
        if (MR1alive == true) {
          image(miniR, MRx1, MRy1, 150, 150);
        }
        if (MR2alive == true) {
          image(miniR, MRx2, MRy2, 150, 150);
        }
        if (MR1alive == true || MR2alive == true) {
          image(bshield, x, y);
          Bshield = true;
        }
        else {
          Bshield = false;
        }
        imageMode(CORNER);
        bigFire.display();
        if (MR1alive == true) {
          lfire1.display();
        }
        if (MR2alive == true) {
          lfire2.display();
        }

        if (millis() - t1 > 3000) {
          lfire1.shoot = true;
          lfire2.shoot = true;
          t1 = millis();
        }

        if (millis() - t2 > 5000) {
          imageMode(CENTER);
          image(soundWave, x, y+100);
          imageMode(CORNER);
          if (millis() - t2 > 7000) {
            if (pShielded == false) {
              pHealth -= damage;
            }
            t2 = millis();
          }
        }
        if (health <= 0) {
          alive = false;
          PHASE = 4;
          t2 = millis();
        }
      }

      if (PHASE == 4) {
        if (alive == false) {
          finalBossSong.pause();
          imageMode(CENTER);
          if (dead == false) {
            image(rootabagor3, x, y, w, h);
          }
          imageMode(CORNER);
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
        }
      }
    }

    /////health//////
    if (alive == true && fire == true) {
      noStroke();
      fill(200, 0, 0);
      rect(width/2 - 150, height * .15, 300, 20);
      fill(0, 200, 0);
      rect(width/2 - 150, height * .15, 300 * health/healthi, 20);
      fill(0);
      textFont(font40, 40);
      text("ROOTABAGOR", width/2 - 80, height * .15);
      noFill();
    }
  }
}

