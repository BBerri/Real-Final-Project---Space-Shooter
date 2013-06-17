class Fireball {
  float x, y, w, h, rw, rh, damage, zacc, zspeed, zacc2, health;
  boolean close, shoot, targeted;
  
  Fireball(float tx, float ty, float tdamage) {
    x = tx;
    y = ty;
    w = 10;
    h = 10;
    rw = 200;
    rh = 200;
    health = 3;
    damage = tdamage;
    zspeed = .1;
    zacc = .01;
  }
  
  void display() {
    
    if (mouseX > x-w/2 & mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      targeted = true;
    }
    if (targeted == true && playerShot == true && shoot == true) {
      health -=1;
      rectMode(CENTER);
      noStroke();
      fill(255, 0, 0);
      rect(x, y, w, h);
      rectMode(CORNER);
    }
    
    if (health < 1) {
      shoot = false;
      health = 3;
      w = 10;
      h = 10;
      zspeed = .1;
      zacc = .01;
    }
    
    if (shoot == true) {
      imageMode(CENTER);
      image(fireball, x, y, w, h);
      imageMode(CORNER);
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
        close = true;
      }
    }
    
    if (close == true) {
      if (pShielded == false) {
      pHealth -= damage;
      }
      w  = 10;
      h = 10;
      health = 3;
      zspeed = .1;
      zacc = .01;
      
      close = false;
      shoot = false;
    }
  }
  
  
}
