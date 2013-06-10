

////////game variables/////////
int iWidth = 1280;
int iHeight = 720;
int pw, ph;
public int LEVEL = 1;
public String STATE = "game";
public boolean resize;
public boolean leftClick, rightClick;
public boolean space = true;


/////////player Variables/////////
public String pDirection;
public boolean pShielded, playerShot, pLeft, pRight, rechargingC, rechargingS;
public float HUDx, HUDy, pHealth, pHealthi, pdegrees, pCharge, pChargei, pShields, pShieldsi;



Menu menu1;
titleScreen mainMenu;
loadingScreen loading;
Level1 level1;




void setup() {
  BlackBox.init(this);
  size(iWidth, iHeight);
  frameRate(60);
  mainMenu = new titleScreen();
  loading = new loadingScreen();
  level1 = new Level1();
}


void draw() {
  background(0);





  if (STATE == "title") {

    //////title screen//////
    mainMenu.display();
  }

  if (STATE == "game") {
    if (LEVEL == 1) {
    level1.game();
    }
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

