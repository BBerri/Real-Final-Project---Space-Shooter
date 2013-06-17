class Level1 {
  String MODE = "level";
  Lobster[] lobsters;
  Snail[] snails;
  Squid[] squids;
  int Lcount = 12, SNcount = 10, SQcount = 4, enemyCount, o;
  Player me;
  Starfield stars;
  Cornucopio boss1;



  Level1() {
    me = new Player(25, 25, 1000, 1000, 3000);
    //lobster = new Enemy(lobsterPic, 20, 100, 100, true, 100);
    stars = new Starfield();
    boss1 = new Cornucopio(125);
    lobsters = new Lobster[Lcount];
    snails = new Snail[SNcount];
    squids = new Squid[SQcount];
    enemyCount = Lcount + SNcount + SQcount;

    for (int i=0; i<Lcount; i++) {     
      lobsters[i] = new Lobster(5);
    }
    for (int i=0; i<SNcount; i++) {
      snails[i] = new Snail(5);
    }
    for (int i=0; i<SQcount; i++) {
      squids[i] = new Squid(6);
    }
  }


  void game() {
    space = true;
    /////music///////
    if (MODE == "level") {
      level1Song.play();
      if (level1Song.position() >= level1Song.length() - 10000) {
        level1Song.loop();
      }
    }
    if (MODE == "boss") {
      level1Song.pause();
      if (boss1.alive == true) {
        boss1Song.play();
        if (boss1Song.position() >= boss1Song.length() - 10000) {
          boss1Song.loop();
        }
      }
      else {
        boss1Song.pause();
      }
    }



    /////////stars//////
    stars.display(100);


    //////lower count////////

    if (MODE == "level") {
      for (int i=0; i<Lcount; i++) {     
        if (lobsters[i].health == 0) {
          enemyCount -= 1;
          lobsters[i].health = -1;
        }
      }


      for (int i=0; i<SNcount; i++) {
        if (snails[i].health == 0) {
          enemyCount -= 1;
          snails[i].health = -1;
        }
      }
      for (int i=0; i<SQcount; i++) {
        if (squids[i].health == 0) {
          enemyCount -= 1;
          squids[i].health = -1;
        }
      }

      if (millis() - timer > 5000) {
        lobsters[0].create();
      }

      if (millis() - timer > 15000) {
        lobsters[1].create();
        lobsters[2].create();
        lobsters[2].drop = true;
      }

      if (millis() - timer > 25000) {
        snails[0].create();
      }

      if (millis() - timer > 30000) {
        lobsters[3].create();
      }

      if (millis() - timer > 38000) {
        squids[0].create();
        squids[0].drop = true;
      }

      if (millis() - timer > 45000) {
        snails[1].create();
        snails[1].drop = true;
      }

      if (millis() - timer > 55000) {
        snails[2].create();
        snails[3].create();
        snails[4].create();
        snails[2].drop = true;
      }

      if (millis() - timer > 75000) {
        lobsters[4].create();
        lobsters[5].create();
        lobsters[6].create();
        squids[1].create();
        lobsters[6].drop = true;
      }

      if (millis() - timer > 90000) {
        lobsters[7].create();
        squids[2].create();
        snails[5].create();
      }

      if (millis() - timer > 11000) {
        lobsters[8].create();
      }
      if (millis() - timer > 120000) {
        lobsters[9].create();
      }
      if (millis() - timer > 125000) {
        lobsters[10].create();
        lobsters[10].drop = true;
      }
      if (millis() - timer > 13500) {
        snails[6].create();
      }
      if (millis() - timer > 140000) {
        squids[3].create();
      }
      if (millis() - timer > 145000) {
        snails[7].create();
        snails[7].drop = true;
      }
      if (millis() - timer > 155000) {
        lobsters[11].create();
        lobsters[11].drop = true;
        snails[8].create();
        snails[8].drop = true;
        snails[9].create();
      }
    }


    if (enemyCount == 0 && MODE == "level") {
      pHealth = 1000;
      MODE = "boss";
    }



    ///////boss////////
    if (MODE == "boss") {
      boss1.display();
      boss1.approach();
      boss1.move();
      boss1.shoot();
      boss1.shake();
      boss1.hit();
      boss1.death();
    }


    ///////player functions////////
    me.shoot();
    me.display();
    me.recharge();

    if (boss1.dead == true) {
      fill(0, o);
      rect(0, 0, width, height);
      o += 1;
      if (o >= 255) {
        level1Song.pause();
        STATE = "cutscene2";
        playable = true;
      }
    }
  }
}

