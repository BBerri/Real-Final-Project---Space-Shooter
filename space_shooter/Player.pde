class Player {
  float cw, ch, cCost;
  PImage HUD, helmet;
  int t, side, frames;
  boolean shoot, old;
  ArrayList bullets;




  Player(float tcw, float tch, float tpHealth, float tpCharge, float tpShields) {
    pShields = tpShields;
    pShieldsi = pShields;
    pCharge = tpCharge;
    pChargei = pCharge;
    pHealth = tpHealth;
    pHealthi = pHealth;
    cw = tcw;
    ch = tch;
    cCost = 70;

    HUD = loadImage("HUD.png");
    helmet = loadImage("helmet.png");
    bullets = new ArrayList();
  }


  void display() {

    if (pHealth > pHealthi) {        //dont let health go above max
      pHealth = pHealthi;
    }

    if (pHealth < 0) {          //dont let it go negative
      pHealth = 0;
    }


    move();
    if (playable == true) {

      //////display bullets////////
      for (int i=0; i<bullets.size(); i++) {
        Bullet shots = (Bullet) bullets.get(i);
        shots.display();
      }
    }

    /////////draw shields//////
    shields();


    /////draw the HUD///////
    if (space == true) {
      image(HUD, HUDx, HUDy, width, height);
    }
    else {
      image(helmet, HUDx, HUDy, width, height);
    }

    if (playable == true) {
      //////draw the crosshair////////
      strokeWeight(3);
      stroke(255, 0, 0);
      line(mouseX-cw/2, mouseY, mouseX+cw/2, mouseY);
      line(mouseX, mouseY+ch/2, mouseX, mouseY-ch/2);
    }

    ///////////draw shield bar/////////
    dshields();

    ////////////draw health////////////
    dhealth();

    ////////////draw charge////////////
    dcharge();
  }



  void shoot() {
    ///////shoot bullets/////////
    playerShot = false;

    if (space == true) {
      if (rechargingC == false) {        //if not recharing
        if (mousePressed == true && mouseButton == LEFT && millis()-t > 300 && playable == true) {
          side++;    //change side
          playerShot = true;
          pCharge -= cCost;
          pShoot.play(0);

          //////left shot////
          if (side == 1) {
            bullets.add(new Bullet("playerS", 2*width/8, height, 200));
          }

          /////right shot/////
          if (side == 2) {
            bullets.add(new Bullet("playerS", 6*width/8, height, 200));
          }

          /////show shots/////
          for (int i=0; i<bullets.size(); i++) {
            Bullet shots = (Bullet) bullets.get(i);
            shots.update();
            shots.shoot();
          }

          ////reset values/////
          t = millis();
          if (side == 2) {
            side = 0;
          }
        }
        //////add to charge/////
        if (pCharge < pChargei) {
          pCharge += 2;
        }
      }
    }

    if (space == false) {
      if (rechargingC == false) {        //if not recharing
        if (mousePressed == true && mouseButton == LEFT && millis()-t > 500 && playable == true) {
          playerShot = true;
          pCharge -= cCost;
          pShoot.play(0);

          /////right shot/////
          bullets.add(new Bullet("playerG", width*.7, height*.7, 100));

          /////show shots/////
          for (int i=0; i<bullets.size(); i++) {
            Bullet shots = (Bullet) bullets.get(i);
            shots.update();
            shots.shoot();
          }

          ////reset values/////
          t = millis();
        }
        //////add to charge/////
        if (pCharge < pChargei) {
          pCharge += 2;
        }
      }
    }
  }

  void move() {
    if (keyPressed == true) {

      if (key == 'a' || key == 'A') {
        pDirection = "left";
      }
      if (key == 'd' || key == 'D') {
        pDirection = "right";
      }
    }
    else {
      pDirection = "none";
    }

    //    if (space == true) {
    //      if (pDirection == "right") {
    //        if (pDegrees < 50) {
    //          pDegrees +=.25;
    //        }
    //      }
    //      if (pDirection == "left") {
    //      }
    //    }
  }


  void shields() {
    if (keyPressed == true && pShields > 0 && rechargingS == false) {
      if (key == ' ') {
        pShielded = true;
      }
    }

    if (pShielded == true) {
      fill(0, 255, 0, 60);
      rect(0, 0, width, height);
      pShields -=10;
      if (pShields <= 0) {
        rechargingS = true;
        pShielded = false;
      }
    }

    if (rechargingS == true) {
      pShields +=10;
      if (pShields >= pShieldsi) {
        pShields = pShieldsi;
        rechargingS = false;
      }
    }
  }




  void dshields() {
    pushMatrix();
    if (space == true ) {
      translate(width * .86, height * .25);
      rotate(radians(.5));

      ////red bar//////
      fill(255, 0, 0);
      stroke(0);
      strokeWeight(4);
      rect(HUDx + 0, HUDy + 0, 140, 25);

      ////yellow bar////
      if (pCharge > 0) {
        if (rechargingS == false) {
          fill(255, 255, 0);
          stroke(0);
          noStroke();
          rect(HUDx + 2, HUDy + 2, 136 * pShields/pShieldsi, 21);
        }
        else {
          fill(150);
          stroke(0);
          noStroke();
          rect(HUDx + 2, HUDy + 2, 136 * pShields/pShieldsi, 21);
        }
      }
    }

    if (space == false ) {
      translate(width * .051, height * .87);
      rotate(radians(.5));

      ////red bar//////
      fill(255, 0, 0);
      stroke(0);
      strokeWeight(4);
      rect(HUDx + 0, HUDy + 0, 180, 75);

      ////yellow bar////
      if (pCharge > 0) {
        if (rechargingS == false) {
          fill(255, 255, 0);
          stroke(0);
          noStroke();
          rect(HUDx + 2, HUDy + 2, 176 * pShields/pShieldsi, 71);
        }
        else {
          fill(150);
          stroke(0);
          noStroke();
          rect(HUDx + 2, HUDy + 2, 176 * pShields/pShieldsi, 71);
        }
      }
    }

    popMatrix();
  }





  void dhealth() {
    pushMatrix();
    if (space == true) {
      translate(width * .055, height * .2);
      rotate(radians(-.5));

      ////red bar//////
      fill(255, 0, 0);
      stroke(0);
      strokeWeight(4);
      rect(HUDx + 0, HUDy + 0, 150, 50);

      ////green bar////
      if (pHealth > 0) {
        fill(0, 255, 0);
        stroke(0);
        noStroke();
        rect(HUDx + 2, HUDy + 2, 146 * pHealth/pHealthi, 46);
      }
    }
    if (space == false) {
      translate(width * .33, height * .015);

      ////red bar//////
      fill(255, 0, 0);
      stroke(0);
      strokeWeight(2);
      rect(HUDx + 0, HUDy + 0, 440, 25);

      ////green bar////
      if (pHealth > 0) {
        fill(0, 255, 0);
        stroke(0);
        noStroke();
        rect(HUDx + 1, HUDy + 1, 438 * pHealth/pHealthi, 23);
      }
    }
    popMatrix();
  }



  void dcharge() {
    pushMatrix();
    if (space == true) {
      translate(width * .86, height * .15);
      rotate(radians(.5));

      ////red bar//////
      fill(255, 0, 0);
      stroke(0);
      strokeWeight(4);
      rect(HUDx + 0, HUDy + 0, 140, 25);

      ////cyan bar////
      if (rechargingC == false) {
        if (pCharge > 0) {
          fill(46, 185, 252);
          stroke(0);
          noStroke();
          rect(HUDx + 2, HUDy + 2, 136 * pCharge/pChargei, 21);
        }
      }
      else {
        fill(150);
        stroke(0);
        noStroke();
        rect(HUDx + 2, HUDy + 2, 136 * pCharge/pChargei, 21);
      }
    }

    if (space == false) {
      translate(width * .8, height * .87);
      rotate(radians(.5));

      ////red bar//////
      fill(255, 0, 0);
      stroke(0);
      strokeWeight(4);
      rect(HUDx + 0, HUDy + 0, 180, 75);

      ////cyan bar////
      if (rechargingC == false) {
        if (pCharge > 0) {
          fill(46, 185, 252);
          stroke(0);
          noStroke();
          rect(HUDx + 2, HUDy + 2, 176 * pCharge/pChargei, 71);
        }
      }
      else {
        fill(150);
        stroke(0);
        noStroke();
        rect(HUDx + 2, HUDy + 2, 176 * pCharge/pChargei, 71);
      }
    }

    popMatrix();
  }




  void recharge() {          //when shot too many times, no charge left---slowly fill it
    if (pCharge <= 0) {
      rechargingC = true;
    }

    if (rechargingC == true) {
      pCharge+=5;

      if (pCharge >= pChargei) {      //if refilled
        pCharge = pChargei;
        rechargingC = false;
      }
    }
  }
}

