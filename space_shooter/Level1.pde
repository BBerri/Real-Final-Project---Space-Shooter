class Level1 {
  Player me;
  Lobster lob1;
  Snail snail1;
  Starfield stars;
  PowerUp med1;



  Level1() {
    me = new Player(25, 25, 1000, 1000, 3000);
    //lobster = new Enemy(lobsterPic, 20, 100, 100, true, 100);
    stars = new Starfield();
    med1 = new PowerUp("medkit", 400, 400, 500);
    lob1 = new Lobster(10);
    snail1 = new Snail(10);
  }


  void game() {
    
    //lob1.create();
    
    snail1.create();
    
    
    ///////player functions////////
    me.shoot();
    me.display();
    me.recharge();
    
    ///////stars//////
    stars.display(100);
    
    //////test//////
    med1.display();
    med1.activate();
  }
}

