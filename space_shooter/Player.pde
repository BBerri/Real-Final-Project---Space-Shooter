class Player {

  float x, y, w, h;
  int ammo;

  Player () {
    playerSpeed = 1;
  }

  void display(){
    x = mouseX;
    y = mouseY;
    w = width/30;
    h = height/20;
    stroke(255, 0, 0);
    strokeWeight(3);
    line(x - w/2, y, x + w/2, y);
    line(x, y - h/2, x, y + h/2);
  }
  
  
}

