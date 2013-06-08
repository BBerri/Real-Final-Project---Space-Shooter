int iWidth = 1280;
int iHeight = 720;
int pw, ph;
PImage lobsterPic;

public String STATE = "game";
public boolean released, resize, playerShot;
public float HUDx, HUDy;
public boolean pLeft, pRight;        //playering moving right or left
public boolean leftClick, rightClick;

Menu menu1;
titleScreen mainMenu;
Player me;
loadingScreen loading;
Enemy lobster;
Starfield stars;



void setup() {
  BlackBox.init(this);
  size(iWidth, iHeight);
  frameRate(60);

  mainMenu = new titleScreen();
  me = new Player(25, 25);
  loading = new loadingScreen();
  lobsterPic = loadImage("lobster.png");
  lobster = new Enemy(lobsterPic, 3, true);
  stars = new Starfield();
  
}

void mouseReleased() {        //true if mouse is released
  released = true;
}

void draw() {
  background(0);

  released = false;             //false if not released



  if (STATE == "title") {
    
    //////title screen//////
    mainMenu.display();
  }

  if (STATE == "game") {
    
    ///////stars//////
    stars.display(100);
    
    //////lobster//////
    lobster.display();
    lobster.approach();
    lobster.hit();
    
    ///player ship/////
    me.shoot();
    me.display();
  }

  if (STATE == "starting") {
    
    /////loading screen//////
    loading.display();
  }
  
  ////////reset click values////////
  leftClick = false;
  rightClick = false;
}


void mouseClicked() {
  if (mouseButton == LEFT) {
    leftClick = true;
  }
  if (mouseButton == RIGHT) {
    rightClick = true;
  }
}

