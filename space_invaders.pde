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
   
  // je charge le .txt file which contains the best scores 
  best_scores = loadStrings("bestScore.txt"); 

  // creating fonts
  font_for_score  = createFont("Georgia",32); 
  textFont(font_for_score,32);
  textAlign(CENTER,CENTER);
  
  font_for_menu = createFont("Georgia",20);

 

  // creating instances 
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

    // pour afficher les meilleurs 
    if(printScores){
      this.menu.printBestScores();
    }
   
    // pour voir s'il le joueur a perdu 
    if(game_is_over){
      game_is_running = false;
      textFont(font_for_score);
      stroke(255);
      fill(255,0,0);
      rect(300,300,300,300);
      fill(0);
      text(" YOU LOST " , 300, 300);
      noStroke();
    }

    // pour voir si le jour a gagné 
    if(you_win){
      game_is_running = false; 
      stroke(255);
      textFont(font_for_score);
      fill(255,0,0);
      rect(300,300,300,300);
      fill(0);
      text("YOU WON " , 300, 300);
      noStroke();
    }

    

}

void keyPressed(){ 
 game.handleKey(key);
}


void mousePressed(){
  game.handleMouse(mouseButton);
}
 


int askInteger () {
  int i = 0;
  noLoop();
  String r = JOptionPane.showInputDialog(null, "Entrez un entier", "askInteger", JOptionPane.QUESTION_MESSAGE);
  loop();
  try {
    i = Integer.parseInt(r);
  } 
  catch(NumberFormatException e) {
    println("Note: Ce n'est pas un entier!");
  }

  return i;
}