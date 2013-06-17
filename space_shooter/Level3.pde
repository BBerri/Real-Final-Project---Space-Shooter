class Level3 {
  Player me;
  PImage cave, stalactite;
  ArrayList stalactites;
  int t, o;
  String MODE = "level";
  Lobster[] lobsters;
  Snail[] snails;
  Squid[] squids;
  int Lcount = 13, SNcount = 7, SQcount = 4, enemyCount;



  Level3() {
    me = new Player(25, 25, 1000, 1000, 3000);
    cave = loadImage("level3.png");
    stalactite = loadImage("stalactite.png");
    stalactites = new ArrayList();
    lobsters = new Lobster[Lcount];
    snails = new Snail[SNcount];
    squids = new Squid[SQcount];
    //enemyCount = Lcount + SNcount + SQcount;
    enemyCount = 0;

    for (int i=0; i<Lcount; i++) {     
      lobsters[i] = new Lobster(6);
    }
    for (int i=0; i<SNcount; i++) {
      snails[i] = new Snail(6);
    }
    for (int i=0; i<SQcount; i++) {
      squids[i] = new Squid(8);
    }
  }


  void game() {
    space = false;

    if (MODE == "level") {
      level3Song.play();
      if (level3Song.position() >= level3Song.length() - 10000) {
        level3Song.loop();
      }
    }
    image(cave, 0, 0, width, height);

    if (millis() - t > 1500) {
      stalactites.add(new Prop(stalactite, 0, width, height * .65, 100, 100));
      t = millis();
    }

    ///////props///////
    for (int i=0; i<stalactites.size(); i++) {
      Prop b = (Prop) stalactites.get(i);
      b.display();
      b.move();
    }

    //////enemies////////
    if (MODE == "level") {
      println(enemyCount);

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

      if (millis() - timer > 10000) {
        squids[0].create();
      }
      if (millis() - timer > 15000) {
        lobsters[0].create();
      }
      if (millis() - timer > 20000) {
        lobsters[1].create();
        lobsters[2].create();
        lobsters[2].drop = true;
      }
      if (millis() - timer > 30000) {
        snails[0].create();
        lobsters[3].create();
        snails[0].drop = true;
      }
      if (millis() - timer > 40000) {
        lobsters[4].create();
        lobsters[5].create();
      }
      if (millis() - timer > 45000) {
        squids[1].create();
      }
      if (millis() - timer > 55000) {
        lobsters[6].create();
        lobsters[7].create();
        lobsters[8].create();
        lobsters[7].drop = true;
        lobsters[8].drop = true;
      }

      if (millis() - timer > 70000) {
        snails[1].create();
        snails[2].create();
        squids[2].create();
        squids[2].drop = true;
      }

      if (millis() - timer > 85000) {
        lobsters[9].create();
      }
      if (millis() - timer > 90000) {
        snails[3].create();
      }
      if (millis() - timer > 95000) {
        snails[4].create();
        snails[4].drop = true;
      }
      if (millis() - timer > 110000) {
        lobsters[10].create();
      }
      if (millis() - timer > 120000) {
        lobsters[11].create();
        squids[3].create();
        squids[3].drop = true;
      }
      if (millis() - timer > 110000) {
        lobsters[12].create();
        snails[5].create();
        snails[6].create();
        snails[5].drop = true;
        snails[6].drop = true;
      }
    }


    ///////player functions////////
    me.shoot();
    me.display();
    me.recharge();



    if (enemyCount == 0 && MODE == "level") {
      pHealth = 1000;
      fill(0, o);
      rect(0, 0, width, height);
      o += 1;
      if (o >= 255) {
        level3Song.pause();
        STATE = "cutscene4";
        playable = true;
      }
    }
  }
}

