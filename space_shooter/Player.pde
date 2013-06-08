class Player {
  float cw, ch;
  PImage HUD;
  int t;
  boolean shoot, old;
  ArrayList bullets;




  Player(float tcw, float tch) {
    cw = tcw;
    ch = tch;

    HUD = loadImage("HUD.png");
    bullets = new ArrayList();
  }


  void display() {

    /////draw the HUD///////
    image(HUD, HUDx, HUDy, width, height);


    //////draw the crosshair////////
    strokeWeight(3);
    stroke(255, 0, 0);
    line(mouseX-cw/2, mouseY, mouseX+cw/2, mouseY);
    line(mouseX, mouseY+ch/2, mouseX, mouseY-ch/2);
  }

  void shoot() {
    if (leftClick == true) {
      shoot = true;
      playerShot = true;
      t = millis();
    }
    if (shoot == true) {
      if (millis() - t < 50) {
        stroke(255, 0, 0);
        strokeWeight(5);
        line (2*width/8, 7*height/8, mouseX, mouseY);
        line (6*width/8, 7*height/8, mouseX, mouseY);
      }
      if (millis() - t > 50) {
        shoot = false;
        playerShot = false;
      }
    }
  }

  void shoot2() {
    if (mousePressed == true && mouseButton == LEFT) {
      bullets.add(new Bullet("player"));
      for (int i=0; i<bullets.size(); i++) {
        Bullet shots = (Bullet) bullets.get(i);
        shots.shot = true;
        shots.display();
      }
    }
  }
}

