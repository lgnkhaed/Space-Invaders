Game game;
boolean spaceship_is_moving = false;
boolean game_is_running = false; // set true au début de jeu ;;; jl'uilise dans la classe Invaders 
int lastMoveTimeInvaders = 0;
int moveIntervalInvaders = 1000;


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
 
  // invaders bougent chaque 1 second 
   if (millis() - lastMoveTimeInvaders >= moveIntervalInvaders && game_is_running) {
        game._invader_tab.moveInvaders(game._board);
        lastMoveTimeInvaders = millis();  
    }
}

void keyPressed() {
 spaceship_is_moving = true; 
 game_is_running = true; 
 //print(game_is_running);
 // print(char(key));
 game.handleKey(key);

    
}

void mousePressed(){
}

void keyReleased() {
  if (  key =='D' || key == 'd' || key == 'Q' || key == 'q' || keyCode == LEFT || keyCode == RIGHT){
     spaceship_is_moving = false;   
  }
}