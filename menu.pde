class Menu {
  // position on the screen  
  PVector pos_corner;
  // the game whichis running while the maenu is called 
  Game game; 
  // values to draw the menu // to be changed into constants maybe 
  int menu_size = 400;
  int width_button = 200 ;
  int height_button = 50; 
  int space_between = 20;   

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
    rect(this.pos_corner.x, this.pos_corner.y, this.menu_size, this.menu_size);

    
   
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
    text("recommencer la partie",300,425); 

   
   noStroke();
 }
}