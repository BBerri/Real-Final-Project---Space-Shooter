class loadingScreen {

  PImage monkey;
  float mx = 200, my = 900;

  loadingScreen() {
    monkey = loadImage("monkey.png");
  }


  void display() {
    background(0);
    stroke(255);
    text("Loading...", 6*width/8, 7*height/8);
    image(monkey, mx, my, 400, 900);
    if (my > height/2) {
      my -= 5;
    }
    else {
      my -= 15;
    }
    if (my < -1000) {
      STATE = "game";
    }
  }
}

