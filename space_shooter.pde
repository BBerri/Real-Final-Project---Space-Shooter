int iWidth = int(1280*.9);
int iHeight = int(1024*.7);
public boolean resize;
int pw, ph;              //previous width and height value (use to detect resize)

Player me;


void setup() {
  BlackBox.init(this);
  size(iWidth, iHeight);
  if (frame != null) {
    frame.setResizable(true);
  }
  frameRate(120);
  pw = iWidth;        //initial width
  ph = iHeight;      //initial height
  noCursor();
  
  ///////Declaring me/////////////
  me = new Player();

}


void draw() {
  background(0);
  
  
  
  ////////me's Fuctions//////////
  me.display();
  



  ////////Check if window was resized///////
  if (pw != width || ph != height) {
    resize = true;
    pw = width;
    ph = height;
  }
  else {
    resize = false;
  }
}

