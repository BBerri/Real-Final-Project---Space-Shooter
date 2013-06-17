class Cutscene3 {
  PImage[] scenes;
  String [] files;
  String [] text;
  int current;
  int imageCount;
  int fontS;
  float rx, ry, rw, rh;
  boolean fade, changed;
  int o;


  Cutscene3() {
    rx = 0;
    ry = height*.8;
    rw = width;
    rh = height*.2;
    fontS = 60;
    imageCount = 8;
    files = new String[imageCount];
    scenes = new PImage[imageCount];
    text = new String[imageCount];
    files[0] = "1.png";
    files[1] = "1.png";
    files[2] = "1.png";
    files[3] = "1.png";
    files[4] = "hole.jpg";
    files[5] = "1.png";
    files[6] = "1.png";
    files[7] = "1.png";


    text[0] = "You have defeated Robo-Squid.";
    text[1] = "But is the fight truely over...?";
    text[2] = "Where is your friend?";
    text[3] = "He must still be on the planet...but where?";
    text[4] = "Perhaps down this hole?";
    text[5] = "You venture down the hole...";
    text[6] = "This time fear is also on your mind...";
    text[7] = "Further down the hole you find a cave...";
    
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

