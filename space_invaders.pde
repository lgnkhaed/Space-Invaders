Game game;


void setup() {
  size(800, 800, P2D);
  
  // on charge les images 
  cyan_invader_1 = loadImage("data/cyan_invader_1.png");
  cyan_invader_2 = loadImage("data/cyan_invader_2.png");
  red_invader_1 = loadImage("data/red_invader_1.png");
  red_invader_2 = loadImage("data/red_invader_2.png");
  green_invader_1 = loadImage("data/green_invader_1.png");
  green_invader_2= loadImage("data/green_invader_2.png");
  spaceship_ = loadImage("data/spaceship.png");
  
  game = new Game();
}

void draw() {
  background(0);
  game.update();
  game.drawIt();
}

void keyPressed() {
  game.handleKey(key);
}

void mousePressed(){
}
