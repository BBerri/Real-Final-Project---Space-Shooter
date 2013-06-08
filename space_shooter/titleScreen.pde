class titleScreen {
  Menu title;
  
  titleScreen() {
    title = new Menu(width/2 - width/8, height/2, width/4, height/4, 4, color(0, 0, 100), color(150), color(250,250,0));
    title.options[0].label = "START";
    title.options[1].label = "OPTIONS";
    title.options[2].label = "CONTROLS";
    title.options[3].label = "EXTRA";
  }
  
  void display() {
    title.display();
    
    if (title.options[0].chosen == true) {
      STATE = "starting";
    }
  }
}
