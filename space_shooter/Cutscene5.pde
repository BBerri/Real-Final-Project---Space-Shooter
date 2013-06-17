class Cutscene5 {
  PImage[] scenes;
  String [] files;
  String [] text;
  int current;
  int imageCount;
  int fontS;
  float rx, ry, rw, rh;
  boolean fade, changed;
  int o;


  Cutscene5() {
    rx = 0;
    ry = height*.8;
    rw = width;
    rh = height*.2;
    fontS = 60;
    imageCount = 14;
    files = new String[imageCount];
    scenes = new PImage[imageCount];
    text = new String[imageCount];
    files[0] = "1.png";
    files[1] = "1.png";
    files[2] = "1.png";
    files[3] = "1.png";
    files[4] = "dead.png";
    files[5] = "dead.png";
    files[6] = "dead.png";
    files[7] = "1.png";
    files[8] = "dead.png";
    files[9] = "1.png";
    files[10] = "1.png";
    files[11] = "lettuce.png";
    files[12] = "1.png";
    files[13] = "1.png";


    text[0] = "You have destroy Rootabagor...but where is your friend?";
    text[1] = "What's this?";
    text[2] = "Rootabagor's body is morphing?";
    text[3] = "Wait...it can't be...";
    text[4] = "''Yes it was me all along.'' says your friend";
    text[5] = "''I could not stand seeing you so happy when the world is so corrupt.''";
    text[6] = "''I had to show you how bad the world had become!''";
    text[7] = "You extend your hand out to him...";
    text[8] = "''STOP! There is no turning back for me. This is the end...''";
    text[9] = "You friend becomes limp...";
    text[10] = "What's this? He's morphing again?";
    text[11] = "You look at the morphed body, only to find a leaf of lettuce.";
    text[12] = "To this very day you wear that leaf proudly in rememberence of your best friend...";
    text[13] = "                                                                           THE END";
    
    for (int i=0; i<imageCount; i++) {
      scenes[i] = loadImage(files[i]);
    }
    
  }

  void display() {
    noStroke();
    
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
            STATE = "final";
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

