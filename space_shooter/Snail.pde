class Snail extends Enemy {
  
  Snail (int thealth) {
    rw = 100;
    rh = 100;
    health = thealth;
    damage = 50;
    zspeed = .001;
    zacc = .0005;
    zacc2 = .000008;
    behavior = "slime";
    pic = loadImage("snail1.png");
    snail2 = loadImage("snail2.png");
  }
  
  void create() {
    display();
    approach();
    hit();
  }
}
