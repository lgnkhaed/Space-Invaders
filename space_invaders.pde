Game game;
boolean spaceship_is_moving = false;
boolean game_is_running = false; // set true au début de jeu ;;; jl'uilise dans la classe Invaders 
int lastMoveTimeInvaders = 0;
int moveIntervalInvaders = 1000; // moves chaque 1s 
int shotIntervalInvaders = 5000;  // tirent chaque 5s 

 
 
void setup() {
  size(600, 600, P2D);
  
  // on charge les images 
  cyan_invader_1 = loadImage("data/cyan_invader_1.png");
  cyan_invader_2 = loadImage("data/cyan_invader_2.png");
  red_invader_1 = loadImage("data/red_invader_1.png");
  red_invader_2 = loadImage("data/red_invader_2.png");
  green_invader_1 = loadImage("data/green_invader_1.png");
  green_invader_2= loadImage("data/green_invader_2.png");
  spaceship_ = loadImage("data/spaceship.png");
  
  font = createFont("Georgia",32); 
  textFont(font,32);
  textAlign(CENTER,CENTER);
  
  game = new Game();
  
}

void draw() {
  background(0);
  game.update();
  game.drawIt();
  game.printLevel();
  // pour écrire le score // le update on verra 
  game.printScore();
  game.printLifes();  
   
   // boucle for the invaders' shots 
   if (millis() - shotIntervalInvaders >= shotIntervalInvaders && game_is_running){
      //print("nothing");
      int[] tab = game.random_case();
      printArray(tab); // [0] : les lignes [1] les colonnes 
      bullets_invaders.add(new Bullet(tab[0],tab[1]));
      shotIntervalInvaders = millis();
   }


   // boucle for the invaders' movement 
   if (millis() - lastMoveTimeInvaders >= moveIntervalInvaders && game_is_running) {
        game._invader_tab.moveInvaders(game._board);
        lastMoveTimeInvaders = millis();  
        // invaders bougent chaque 1 second      
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
  game.handleMouse(mouseButton);
}
 

void keyReleased() {
  if (  key =='D' || key == 'd' || key == 'Q' || key == 'q' || keyCode == LEFT || keyCode == RIGHT){
     spaceship_is_moving = false;   
  }
}