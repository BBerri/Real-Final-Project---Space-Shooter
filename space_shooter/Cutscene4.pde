class Cutscene4 {
  PImage[] scenes;
  String [] files;
  String [] text;
  int current;
  int imageCount;
  int fontS;
  float rx, ry, rw, rh;
  boolean fade, changed;
  int o;


  Cutscene4() {
    rx = 0;
    ry = height*.8;
    rw = width;
    rh = height*.2;
    fontS = 60;
    imageCount = 18;
    files = new String[imageCount];
    scenes = new PImage[imageCount];
    text = new String[imageCount];
    files[0] = "1.png";
    files[1] = "1.png";
    files[2] = "1.png";
    files[3] = "1.png";
    files[4] = "1.png";
    files[5] = "1.png";
    files[6] = "1.png";
    files[7] = "1.png";
    files[8] = "1.png";
    files[9] = "1.png";
    files[10] = "1.png";
    files[11] = "1.png";
    files[12] = "1.png";
    files[13] = "1.png";
    files[14] = "1.png";
    files[15] = "1.png";
    files[16] = "1.png";
    files[17] = "1.png";


    text[0] = "You searched the cave for days but your friend, is not in sight...";
    text[1] = "Could this be the end...?";
    text[2] = "Is your friend lost forever...?";
    text[3] = "What hope is there...?";
    text[4] = "Wait .";
    text[5] = "What is this?";
    text[6] = "An unground facility?, The door is open...";
    text[7] = "You decide to enter it.";
    text[8] = "The giant metal doors slam shut behind you.";
    text[9] = "You call for your friend but all you hear is your own echo.";
    text[10] = "Shrowded by darkness, you continue to search for your friend...";
    text[11] = "Suddenly you enter a large, dark room.";
    text[12] = "You call but no one answers.";
    text[13] = "What is that dark figure?";
    text[14] = "What could it be?";
    text[15] = "You approach the dark figure.";
    text[16] = "Suddenly you feel a chill travel down your spine...";
    text[17] = "You prepare for the final battle...";
    
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

