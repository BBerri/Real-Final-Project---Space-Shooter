class titleScreen {
  Menu title;
  PImage titlePic;
  float x, y, w, h;
  
  titleScreen() {
    x = width/2 - width/8;
    y = height/2;
    w = width/4;
    h = height/4;
    title = new Menu(x, y, w, h, 2, color(0, 0, 100), color(150), color(250,250,0));
    title.options[0].label = "START";
    title.options[1].label = "CONTROLS";
    titlePic = loadImage("titlescreen.png");
  }
  
  void display() {
    titleTheme.play();          //title music
    image(titlePic, -100, -100, width+300, height+300);
    title.display();
    
    if (title.options[0].chosen == true) {
      STATE = "cutscene1";
      timer = millis();
      titleTheme.pause();
    }
  }
}
