class Laser {
  int x;
  int y;
  int speed = 12;

  Laser(int startX, int startY) {
    x = startX;
    y = startY;
  }

  void move() {
    y = y - speed;
  }

  void show() {
    image(laserImg, x, y);
  }
}
