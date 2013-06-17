class Cutscene2 {
  PImage[] scenes;
  String [] files;
  String [] text;
  int current;
  int imageCount;
  int fontS;
  float rx, ry, rw, rh;
  boolean fade, changed;
  int o;


  Cutscene2() {
    rx = 0;
    ry = height*.8;
    rw = width;
    rh = height*.2;
    fontS = 60;
    imageCount = 4;
    files = new String[imageCount];
    scenes = new PImage[imageCount];
    text = new String[imageCount];
    files[0] = "1.png";
    files[1] = "1.png";
    files[2] = "1.png";
    files[3] = "1.png";


    text[0] = "You have defeated General Cornucopio, surely this has weakened the enemy.";
    text[1] = "You arrive on a strange, red planet.";
    text[2] = "You are unsure of what lies beyond the planet's red fog but you venture forth, in hope that you will find your friend.";
    text[3] = "You land on the planet, with vengance still on your mind.";
    
    for (int i=0; i<imageCount; i++) {
      scenes[i] = loadImage(files[i]);
    }
    
  }

  void display() {
    
    cutscene1.play();
      if (cutscene1.position() >= cutscene1.length() - 10000) {
        cutscene1.loop();
      }
      
    image(scenes[current], 0, 0, width, height);
    fill(50);
    rect (rx, ry, rw, rh);
    fill(200);
    textFont(font60, 60);
    //textSize(fontS);
    String[] textLines = split(text[current], ',');
    for (int i=0; i<textLines.length; i++) {
      text(textLines[i], 0, ry+(i+1) * (height - ry - 30)/textLines.length);
    }
    if (keyPressed == true && key == ' ' && fade == false) {
      fade = true;
    }
  }


  void fade() {
    if (fade == true) {
      fill(0, o);
      rect(0, 0, width, height);
      if (changed == false) {
        if (o < 270) {
          o += 2;
        }      
        if (o >= 270) {
          changed = true;
          if (current < imageCount-1) {
          current += 1;
          }
          else{
            cutscene1.pause();
            timer = millis();
            STATE = "game";
            LEVEL += 1;
          }
        }
      }
      if (changed == true) {
        if (o > 0) {
          o -= 2;
        }
        if (o <= 0) {
          o = 0;
          changed = false;
          fade = false;
        }
      }
    }
  }
}

