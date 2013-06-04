int iWidth = int(1280);
int iHeight = int(720);
public boolean resize;
public float playerSpeed = .01;
int pw, ph;              //previous width and height value (use to detect resize)
PImage HUD;
float HUDx, HUDy;

Player me;
Enemy testE;


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
  HUD = loadImage("HUD.png");
  HUDx = width;
  HUDy = height;
  
  ///////Declaring me/////////////
  me = new Player();
  
  ///////Declaring testE////////
  testE = new Enemy();

}


void draw() {
  background(0);
  
  
  
  
  ////////me's Fuctions//////////
  me.display();
  
  
  ////////tstE's functions///////
  testE.display();
  testE.move();


  image(HUD, HUDx - width, HUDy - height, HUDx, HUDy);
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

