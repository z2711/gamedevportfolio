class Asteroid {
  int x;
  int y;
  int size;
  int speed;

  Asteroid() {
    size = int(random(50, 100));
    speed = int(random(1, 4));    
    x = int(random(size, width - size));
    y = -size;
  }

  void move() {
    y = y + speed;
  }

  void show() {
    image(asteroidImg, x, y, size, size);
  }
}
