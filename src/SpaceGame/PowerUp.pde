class Powerup {
  int x;
  int y;
  int size = 45;
  int speed;

  Powerup() {
    speed = int(random(2, 4));    // gives 2 or 3
    x = int(random(size, width - size));
    y = -size;
  }

  void move() {
    y = y + speed;
  }

  void show() {
    image(powerupImg, x, y, size, size);
  }
}
