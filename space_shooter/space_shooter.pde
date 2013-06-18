import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import gifAnimation.*;



////////game variables/////////
int iWidth = 1280;
int iHeight = 720;
int pw, ph;
public int LEVEL = 0;
public String STATE = "title";
public boolean resize;
public boolean leftClick, rightClick;
public boolean space;
public int timer;


/////////player Variables/////////
public String pDirection;
public boolean pShielded, playerShot, pLeft, pRight, rechargingC, rechargingS, playable = true;
public float HUDx, HUDy, pHealth, pHealthi, pdegrees, pCharge, pChargei, pShields, pShieldsi;


//////font///////
public PFont font60;
public PFont font40;

//////images///////
public PImage redPlanet;


////////Gifs//////////
Gif squidGif;
Gif snailGif;
Gif boss1Charging;
Gif boss2Charging;
Gif torchesBOTH;
Gif torchesLEFT;
Gif fireball;
Gif soundWave;

/////Minim///////
Minim minim;
AudioPlayer titleTheme;
AudioPlayer level1Song;
AudioPlayer level2Song;
AudioPlayer level3Song;
AudioPlayer pShoot;
AudioPlayer boss1Song;
AudioPlayer boss1Death;
AudioPlayer sucking;
AudioPlayer boss1Scream;
AudioPlayer finalBossSong;
AudioPlayer cutscene1;


/////classes////////
Menu menu1;
titleScreen mainMenu;
loadingScreen loading;
Level1 level1;
Level2 level2;
Level3 level3;
ThroneRoom throneRoom;
Cutscene1 scene1;
Cutscene2 scene2;
Cutscene3 scene3;
Cutscene4 scene4;
Cutscene5 scene5;





void setup() {
  //////music/sounds///////
  minim = new Minim(this);
  
  titleTheme = minim.loadFile("F Title.wav");
  level1Song = minim.loadFile("1 Level.mp3");
  level2Song = minim.loadFile("2 Level.mp3");
  level3Song = minim.loadFile("3 Level.mp3");
  pShoot = minim.loadFile("F Shoot.wav");
  boss1Song = minim.loadFile("1 Boss.mp3");
  boss1Death = minim.loadFile("bossdeath2.mp3");
  sucking = minim.loadFile("sucking.wav");
  boss1Scream = minim.loadFile("boss1Scream.wav");
  finalBossSong = minim.loadFile("3 Boss.mp3");
  cutscene1 = minim.loadFile("cutscene1.mp3");
  
  BlackBox.init(this);
  size(iWidth, iHeight);
  frameRate(60);
  mainMenu = new titleScreen();
  loading = new loadingScreen();
  level1 = new Level1();
  level2 = new Level2();
  level3 = new Level3();
  throneRoom = new ThroneRoom();
  scene1 = new Cutscene1();
  scene2 = new Cutscene2();
  scene3 = new Cutscene3();
  scene4 = new Cutscene4();
  scene5 = new Cutscene5();
  
  //////font/////
  font60 = loadFont("LilyUPC-60.vlw");
  font40 = loadFont("LilyUPC-40.vlw");
  
  //////pics///////
  redPlanet = loadImage("planet.png");

  ///////gifs///////
  squidGif = new Gif(this, "squid.gif");
  squidGif.play();
  snailGif = new Gif(this, "snail.gif");
  snailGif.play();
  boss1Charging = new Gif(this, "charge.gif");
  boss2Charging = new Gif(this, "roboSquid.gif");
  torchesBOTH = new Gif(this, "throne.gif");
  torchesLEFT = new Gif(this, "throne2.gif");
  torchesLEFT.play();
  torchesBOTH.play();
  fireball = new Gif(this, "fireball.gif");
  fireball.play();
  soundWave = new Gif(this, "soundwave.gif");
  soundWave.play();

}


void draw() {
  background(0);





  if (STATE == "title") {

    //////title screen//////
    mainMenu.display();
  }
  
  if (STATE == "cutscene1") {
    scene1.display();
    scene1.fade();
    noCursor();
  }
  
  if (STATE == "cutscene2") {
    scene2.display();
    scene2.fade();
  }
  
  if (STATE == "cutscene3") {
    scene3.display();
    scene3.fade();
  }
  
  if (STATE == "cutscene4") {
    scene4.display();
    scene4.fade();
  }
  
  if (STATE == "cutscene5") {
    scene5.display();
    scene5.fade();
  }

  if (STATE == "game") {
    if (LEVEL == 1) {
      level1.game();
    }
    if (LEVEL == 2) {
      level2.game();
    }
    if (LEVEL == 3) {
      level3.game();
    }
  }
  
  if (STATE == "final") {
    throneRoom.game();
  }

  if (STATE == "starting") {

    /////loading screen//////
    loading.display();
  }

  ////////reset click values////////
  leftClick = false;
  rightClick = false;
}

