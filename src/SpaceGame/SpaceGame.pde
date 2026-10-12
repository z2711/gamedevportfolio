import gifAnimation.*;

Gif shipImg;
PImage asteroidImg;
PImage laserImg;
PImage powerupImg;

Spaceship ship;
ArrayList<Asteroid> asteroids;
ArrayList<Laser> lasers;
ArrayList<Powerup> powerups;

int score = 0;
int health = 3;
int missed = 0;
boolean gameOver = false;

void setup() {
  size(800, 1100);
  imageMode(CENTER);

  shipImg = new Gif(this, "spaceship.gif");
  shipImg.loop();
  asteroidImg = loadImage("asteroid.png");
  laserImg = loadImage("laser.png");
  powerupImg = loadImage("powerup.png");

  startGame();
}

void startGame() {
  ship = new Spaceship();
  asteroids = new ArrayList<Asteroid>();
  lasers = new ArrayList<Laser>();
  powerups = new ArrayList<Powerup>();
  score = 0;
  health = 3;
  missed = 0;
  gameOver = false;
}

void draw() {
  background(0);

  if (gameOver == true) {
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(60);
    text("GAME OVER", width / 2, height / 2 - 30);
    fill(255);
    textSize(25);
    text("Score: " + score, width / 2, height / 2 + 20);
    text("Click to play again", width / 2, height / 2 + 60);
    return;
  }

  
  if (frameCount % 60 == 0) {
    asteroids.add(new Asteroid());
  }
  
  if (int(random(350)) == 0) {
    powerups.add(new Powerup());
  }

  
  ship.move();
  ship.show();

  
  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser l = lasers.get(i);
    l.move();
    l.show();
    if (l.y < 0) {
      lasers.remove(i);
    }
  }

  
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    a.move();
    a.show();

    boolean hit = false;

    
    for (int j = lasers.size() - 1; j >= 0; j--) {
      Laser l = lasers.get(j);
      if (dist(a.x, a.y, l.x, l.y) < a.size / 2) {
        lasers.remove(j);
        score = score + 10;
        hit = true;
        break;
      }
    }

    
    if (hit == false && dist(a.x, a.y, ship.x, ship.y) < a.size / 2 + 20) {
      health = health - 1;
      hit = true;
    }

    
    if (hit == false && a.y > height + a.size) {
      missed = missed + 1;
      hit = true;
    }

    
    if (hit == true) {
      asteroids.remove(i);
    }
  }

  
  for (int i = powerups.size() - 1; i >= 0; i--) {
    Powerup p = powerups.get(i);
    p.move();
    p.show();

    if (dist(p.x, p.y, ship.x, ship.y) < p.size / 2 + 20) {
      health = health + 1;
      powerups.remove(i);
    } else if (p.y > height + p.size) {
      powerups.remove(i);
    }
  }

  
  fill(255);
  textSize(22);
  textAlign(LEFT);
  text("Score: " + score, 15, 30);
  text("Health: " + health, 15, 60);
  textAlign(RIGHT);
  text("Missed: " + missed + "/5", width - 15, 30);

  
  if (missed > 5 || health <= 0) {
    gameOver = true;
  }
}

void mousePressed() {
  if (gameOver == true) {
    startGame();
  } else if (mouseButton == LEFT) {
    lasers.add(new Laser(ship.x, ship.y));
  }
}
