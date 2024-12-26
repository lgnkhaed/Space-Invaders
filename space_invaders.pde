Game game;
boolean game_is_running = false; // set true au début de jeu ;;; jl'uilise dans la classe Invaders 
boolean tab_pressed = false; 

int lastMoveTimeInvaders = 0;
int moveIntervalInvaders = 1000; // moves chaque 1s 
int shotIntervalInvaders = 5000;  // tirent chaque 5s 
Menu menu;

 
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
  

  // je charge le level 1 
  String[] level1 = loadStrings("levels/level1.txt");
  
  // creating fonts
  font_for_score  = createFont("Georgia",32); 
  textFont(font_for_score,32);
  textAlign(CENTER,CENTER);
  
  font_for_menu = createFont("Georgia",20);

  game = new Game(level1);
  menu= new Menu(game);

  
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
   if (millis() - shotIntervalInvaders >= shotIntervalInvaders && game_is_running && !tab_pressed){
      //print("nothing");
      int[] tab = game.random_case();
      // printArray(tab); // [0] : les lignes [1] les colonnes 
      bullets_invaders.add(new Bullet(tab[0],tab[1]));
      shotIntervalInvaders = millis();
   }


   // boucle for the invaders' movement 
   if (millis() - lastMoveTimeInvaders >= moveIntervalInvaders && game_is_running && !tab_pressed) {
        game._invader_tab.moveInvaders(game._board);
        lastMoveTimeInvaders = millis();  
        // invaders bougent chaque 1 second      
    }
    

    // pour dessineer  le menu 
    if(tab_pressed){
      game.menu.drawIt();

      // gérer le curser 
    }





    

}

void keyPressed(){ 
 game.handleKey(key);
}


void mousePressed(){
  game.handleMouse(mouseButton);
}
 

void keyReleased() {
  
}