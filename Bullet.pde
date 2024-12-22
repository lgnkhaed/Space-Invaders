class Bullet {
  PVector pos;
  // les cases du bullet sur le baord 
  int case_x; 
  int case_y; 
  float speed = 8;
  boolean toRemove = false; 

  Bullet(PVector pos_spaceship) {
    this.pos = new PVector(pos_spaceship.x, pos_spaceship.y);
    this.case_x = (int) this.pos.x / 30;
    this.case_y = (int) this.pos.y / 30;
    
  }

  void update(Game game , int index_list){
    this.pos.y -= speed;
    this.case_y = (int) this.pos.y / 30; 
    // je vas gérer les tirs ici 
       if (game._board._cells[this.case_y][this.case_x] == TypeCell.INVADER_RED || 
            game._board._cells[this.case_y][this.case_x] == TypeCell.INVADER_GREEN || 
            game._board._cells[this.case_y][this.case_x] == TypeCell.INVADER_CYAN) {
            
            // game._score += SCORE_KILL;  /// j'ssaye de modifier le le score dans game update 
 
          if (this.case_y >= game._invader_tab.y_first_cell && 
             this.case_y < game._invader_tab.y_first_cell + game._invader_tab._invaders.length){
    
                int x_tab = this.case_x - game._invader_tab.x_first_cell;
                int y_tab = this.case_y - game._invader_tab.y_first_cell;
                // print(" ////////"+ x_tab + "::::::" + y_tab + "///////////" );

                if (x_tab >= 0 && x_tab < game._invader_tab._invaders[0].length &&
                y_tab >= 0 && y_tab < game._invader_tab._invaders.length){
        
                  if (game._invader_tab._invaders[y_tab][x_tab] != TypeCell.EMPTY){
                    game._board._cells[this.case_y][this.case_x] = TypeCell.EMPTY;
                    game._invader_tab._invaders[y_tab][x_tab] = TypeCell.EMPTY;
                    this.toRemove = true;
                  }
                }
          }

           
        }
    

  }

  void drawIt() {
    fill(255, 0, 0);
    ellipse(this.pos.x,this.pos.y, 8, 8);
  }

}