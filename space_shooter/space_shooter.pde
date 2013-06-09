PImage lobsterPic;

////////game variables/////////
int iWidth = 1280;
int iHeight = 720;
int pw, ph;
public int LEVEL;
public String STATE = "game";
public boolean resize;
public boolean leftClick, rightClick;
public boolean space = true;


/////////player Variables/////////
public String pDirection;
public boolean pShielded, playerShot, pLeft, pRight;
public float HUDx, HUDy, pHealth, pHealthi, pdegrees, pCharge, pChargei, pShields, pShieldsi;



Menu menu1;
titleScreen mainMenu;
loadingScreen loading;
Enemy lobster;
Starfield stars;
Player me;



void setup() {
  BlackBox.init(this);
  size(iWidth, iHeight);
  frameRate(60);

  mainMenu = new titleScreen();
  me = new Player(25, 25, 1000, 1000, 3000);
  loading = new loadingScreen();
  lobsterPic = loadImage("lobster.png");
  lobster = new Enemy(lobsterPic, 20, 100, 100, true, 100);
  stars = new Starfield();
}


void draw() {
  background(0);





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
    me.recharge();
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

