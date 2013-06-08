class Menu {
  float x, y, w, h;
  int items, current, t;
  color boxColor, textColor, selectedColor;

  Option[] options;

  Menu(float tx, float ty, float tw, float th, int titems, color tboxColor, color ttextColor, color tselectedColor) {
    x = tx;
    y = ty;
    w = tw;
    h = th;     
    boxColor = tboxColor;
    textColor = ttextColor;
    selectedColor = tselectedColor;
    items = titems;

    /////array of options//////////
    options = new Option[items];
    for (int i=0; i<items; i++) {
      options[i] = new Option(boxColor, textColor, selectedColor);
    }
  }

  void display() {


    for (int i=0; i<items; i++) {
      options[i].display(x, y + ((h/items)) * i, w, h/items);
      //line(x, y + ((h/items)) * i, x + w, y + ((h/items) * i));      //dividers
      if (options[i].chosen == true) {
      }
    }
  }
}



///////////////////The rectangle, text, and selected boolean////////////////
class Option {
  float x, y, w, h;
  boolean selected, chosen;
  String label;
  color boxColor, textColor, selectedColor;
  int t;

  /////////user will input color of boxes/selected & unselected text//////
  Option(color tboxColor, color ttextColor, color tselectedColor) {
    boxColor = tboxColor;
    textColor = ttextColor;
    selectedColor = tselectedColor;
  }

  //////show the rectangle and text/////////////
  void display(float tx, float ty, float tw, float th) {
    select();
    chosen();

    x = tx;
    y = ty;
    w = tw;
    h = th;

    fill(boxColor);
    strokeWeight(2);
    rect(x, y, w, h);          //box

    if (selected==true) {
      fill(selectedColor);        //if selected
    } 
    else {
      fill(textColor);        //not selected
    }
    textSize(40);
    text(label, x, y+(h*.9));          //text
  }


  ///////check if highlighted///////
  void select() {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
      selected=true;
    }
    else{
      selected=false;
    }
  }
  
  ///////check if clicked on////////
  void chosen() {
    if (selected==true && mousePressed==true && mouseButton==LEFT && millis()-t > 200) {
      chosen = true;
      t = millis();
    }
    else {
      chosen = false;
    }
  }
}

