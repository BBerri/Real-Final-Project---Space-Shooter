class Player {
  float cw, ch;
  PImage HUD;
  int t, side;
  boolean shoot, old;
  ArrayList bullets;




  Player(float tcw, float tch, float tpHealth, float tpCharge) {
    pCharge = tpCharge;
    pChargei = pCharge;
    pHealth = tpHealth;
    pHealthi = pHealth;
    cw = tcw;
    ch = tch;

    HUD = loadImage("HUD.png");
    bullets = new ArrayList();
  }


  void display() {
    move();

    //////display bullets////////
    for (int i=0; i<bullets.size(); i++) {
      Bullet shots = (Bullet) bullets.get(i);
      shots.display();
    }

    /////////draw shields//////
    shields();

    /////draw the HUD///////
    image(HUD, HUDx, HUDy, width, height);


    //////draw the crosshair////////
    strokeWeight(3);
    stroke(255, 0, 0);
    line(mouseX-cw/2, mouseY, mouseX+cw/2, mouseY);
    line(mouseX, mouseY+ch/2, mouseX, mouseY-ch/2);

    ////////////draw health////////////
    dhealth();

    ////////////draw charge////////////
    dcharge();
  }



  void shoot() {
    ///////shoot bullets/////////
    playerShot = false;

    if (mousePressed == true && mouseButton == LEFT && millis()-t > 300) {
      side++;    //change side
      playerShot = true;
      pCharge -= 80;

      //////left shot////
      if (side == 1) {
        bullets.add(new Bullet("player", 2*width/8, height));
      }

      /////right shot/////
      if (side == 2) {
        bullets.add(new Bullet("player", 6*width/8, height));
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
    if (keyPressed == true) {
      if (key == ' ') {
        pShields = true;
      }
    }

    if (pShields == true) {
      fill(0, 255, 0, 60);
      rect(0, 0, width, height);
    }
  }

  void dhealth() {
    pushMatrix();
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
    popMatrix();
  }



  void dcharge() {
    pushMatrix();
    translate(width * .86, height * .2);
    rotate(radians(.5));

    ////red bar//////
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(4);
    rect(HUDx + 0, HUDy + 0, 140, 25);

    ////cyan bar////
    if (pCharge > 0) {
      fill(46, 185, 252);
      stroke(0);
      noStroke();
      rect(HUDx + 2, HUDy + 2, 136 * pCharge/pChargei, 21);
    }

    popMatrix();
  }
}

