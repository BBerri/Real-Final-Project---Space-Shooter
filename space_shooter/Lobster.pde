class Lobster extends Enemy {
  
  Lobster (int thealth) {
    rw = 100;
    rh = 100;
    health = thealth;
    damage = 100;
    zspeed = .001;
    zacc = .0005;
    zacc2 = .000008;
    behavior = "laser";
    pic = loadImage("lobster.png");
  }
  
  void create() {
    display();
    approach();
    hit();
  }
}
