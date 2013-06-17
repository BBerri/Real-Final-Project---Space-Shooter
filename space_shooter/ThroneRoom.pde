class ThroneRoom {
  Player me;
  boolean cutscene = true;
  Rootabagor finalBoss;
  int o;




  ThroneRoom() {
    space = false;
    me = new Player(25, 25, 1000, 1000, 3000);
    finalBoss = new Rootabagor();
  }


  void game() {
    
    ///////props///////

    
    /////music///////
    

    /////////stars//////


    //////enemies////////



    ///////boss////////
    finalBoss.display();
    finalBoss.hit();



    ///////player functions////////
    
    if (finalBoss.intro == false && finalBoss.dead == false) {
    me.shoot();
    me.display();
    me.recharge();
    }
    
    
    
    if (finalBoss.dead == true) {
      fill(0, o);
      rect(0, 0, width, height);
      o += 1;
      if (o >= 255) {
        STATE = "cutscene5";
        playable = false;
      }
    }
    
  }
}

