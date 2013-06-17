class Cutscene1 {
  PImage[] scenes;
  String [] files;
  String [] text;
  int current;
  int imageCount;
  int fontS;
  float rx, ry, rw, rh;
  boolean fade, changed;
  int o;


  Cutscene1() {
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
    files[4] = "2.jpg";
    files[5] = "2.jpg";
    files[6] = "2.jpg";
    files[7] = "1.png";
    files[8] = "1.png";
    files[9] = "3.jpg";
    files[10] = "1.png";
    files[11] = "3.jpg";
    files[12] = "3.jpg";
    files[13] = "1.png";


    text[0] = "                                                   The year is 22XX";
    text[1] = "Human research has expanded so rapidly that, people are able to genetically alter animals, in order to be more efficient.";
    text[2] = "With this technology people are able to do all, sorts of things.";
    text[3] = "You live on Earth.,You enjoy your calm and peacefull life.";
    text[4] = "This is your best friend., You both decided to go to the park today.";
    text[5] = "''What a nice day it is'' says your friend., ''I miss the days when technology had not consumed human life''";
    text[6] = "''Shall we collect butterflies?''";
    text[7] = "Then suddenly...,you hear a piercing noise...";
    text[8] = "''NOOOOOOOOO!'' yells your friend.";
    text[9] = "''ITS TAKING ME AWAY! HELP!'' but there is nothing you can do...";
    text[10] = "That was the last you saw of your friend";
    text[11] = "In order to save him, you become a Galactic Space Guy...";
    text[12] = "You eventually find out that he was kidnapped by a failed experiment;, Robo-Squid.";
    text[13] = "You venture off into space with only vengence on your mind...";
    
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

