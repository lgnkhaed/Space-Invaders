  

class Menu {
  // position on the screen  
  PVector pos_corner;
  // the game whichis running while the maenu is called 
  Game game; 
  // values to draw the menu // to be changed into constants maybe 
 
  Menu(Game game){
     this.game = game ; 
     this.pos_corner = new PVector(100,100);
  }
  
  void drawIt() {
    // background of the menu  
    stroke(255);
    strokeWeight(2);
    fill(0);
    rectMode(CORNER);
    rect(this.pos_corner.x, this.pos_corner.y, menu_size, menu_size);

    
   
    // dessinner les buttons
    // 1er button 
    fill(255,0,0);
    rect(200,120,width_button,height_button);
    textFont(font_for_menu);
    textAlign(CENTER,CENTER);
    fill(255);
    text("recommencer la partie",300,145); 

   //2em button
    fill(255,0,0); 
    rect(200,190,width_button,height_button);
    textFont(font_for_menu);
    textAlign(CENTER,CENTER);
    fill(255);
    text("sauvegarder la partie",300,215); 
   
   // 3em button 
    fill(255,0,0);
    rect(200,260,width_button,height_button);
    textFont(font_for_menu);
    textAlign(CENTER,CENTER);
    fill(255);
    text("charger une partie ",300,285); 

    // 4em button 
    fill(255,0,0);
    rect(200,330,width_button,height_button);
    textFont(font_for_menu);
    textAlign(CENTER,CENTER);
    fill(255);
    text("les meilleurs scores",300,355); 

    // 5em buttton 
    fill(255,0,0);
    rect(200,400,width_button,height_button);
    textFont(font_for_menu);
    textAlign(CENTER,CENTER);
    fill(255);
    text("quitter la partie",300,425); 

   
   noStroke();
 }

  // method to print he best scores 
  void printBestScores(){
      // Draw menu background
  stroke(255);
  fill(0);
  rect(150, 150, 300, 300);
  noStroke();
  // Draw "X" button // to be chnaged
  stroke(255);
  strokeWeight(4);
  line(420, 165, 440, 185);  // Diagonal line 1
  line(440, 165, 420, 185);  // Diagonal line 2
  
  noStroke();
  fill(255);
  textSize(20);
  text("Best Scores", 300, 180);
    // print the scores 
    for(int i = 1 ; i < best_scores.length ; i++){
      String score = best_scores[i];
      fill(255);
      text(score,300,i*40 + 180);
    }
  }

}