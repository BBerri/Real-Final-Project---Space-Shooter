class Squid extends Enemy {

  Squid (int thealth) {
    rw = 100;
    rh = 100;
    health = thealth;
    damage = 100;
    zspeed = .001;
    zacc = .0005;
    zacc2 = .000008;
    behavior = "stick";
    pic = loadImage("squidfly.png");
  }

  void create() {
    display();
    approach();
    hit();

    if (attached == true && alive == true) {
      if (sucking.position() < sucking.length()) {
      sucking.play();
      }
      else {
        sucking.rewind();
      }
    }
    if (alive == false) {
      sucking.pause();
      sucking.rewind();
    }
  }
}

