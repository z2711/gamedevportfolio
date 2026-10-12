class Spaceship {
  int x;
  int y;

  Spaceship() {
    x = width / 2;
    y = height - 100;
  }

  // ship follows the mouse
  void move() {
    x = mouseX;
    y = mouseY;
  }

  void show() {
    image(shipImg, x, y);
  }
}
