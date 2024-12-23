// une classe pour gérer les 30  invaders dans le jeux 
boolean offset_right = true;

class Invaders{
    // les valeurs int sont pour les première case de mon tableau sur le board 
     int x_first_cell; 
     int y_first_cell; 
    TypeCell _invaders[][];

 
    // consturcteur au début met les invaders au millieu *** il prend un Board comme parametres 
    Invaders(Board board){
       this.x_first_cell = x_pos_invaders_dep ; //ligne 
       this.y_first_cell = y_pos_invaders_dep;  // colonnes 
       this._invaders = new TypeCell[3][14];
       this.intialisation_table();
       this.placer_invaders(board); 
    }

    // méthode pour instialliser le tableau 
    void intialisation_table(){
        for (int i = 0; i < this._invaders[0].length; i++) {
            _invaders[0][i] = TypeCell.INVADER_RED;
            _invaders[1][i] = TypeCell.INVADER_GREEN;
            _invaders[2][i] = TypeCell.INVADER_CYAN;
        }
    }
 

   // méthode pour remplir le Board à partir du tableau invaders 
  void placer_invaders(Board board) {
    for (int case_x = 0; case_x < this._invaders.length; case_x++) {
        for (int case_y = 0; case_y < this._invaders[case_x].length; case_y++) {
            int target_x = this.x_first_cell + case_x;
            int target_y = this.y_first_cell + case_y;
            
            // je vérifie juste à cause de l'exception Arrayout bound index 
            if (target_x < board._cells.length && target_y < board._cells[0].length) {
                board._cells[target_x][target_y] = this._invaders[case_x][case_y];
            }
        }
    }
}
    // méthode pour gérer les déplacements des invaders 

  void moveInvaders(Board board) {
      if (offset_right) {
         moveRight(board);
         if (this.y_first_cell + this._invaders[0].length >= 20){
           offset_right = false;
            moveDown(board);
         }
      }else{
        moveLeft(board);
        if(this.y_first_cell <= 0){
            offset_right = true;
            moveDown(board);
        }
      }

    // on, arrette si on est en bas 
      if (this.y_first_cell + this._invaders.length >= 19) {
        game_is_running = false;
      }
}

    


     // déplacement à droite
    void moveRight(Board board) {
        supprimer_invaders(board);
        this.y_first_cell++;
        placer_invaders(board);
    }

    // déplacement à gauche
    void moveLeft(Board board) {
        supprimer_invaders(board);
        this.y_first_cell--;
        placer_invaders(board);
    }

    // déplacement en bas 
    void moveDown(Board board) {
        supprimer_invaders(board);
        this.x_first_cell++;
        placer_invaders(board);
    }

    // supprimer les invaders du board 
    void supprimer_invaders(Board board) {
    for (int x = 0; x < this._invaders.length; x++) {
        for (int y = 0; y < this._invaders[x].length; y++) {
            int target_x = this.x_first_cell + x;
            int target_y = this.y_first_cell + y;
            
            // Vérifier les limites avant de supprimer
            if (target_x < board._cells.length && target_y < board._cells[0].length) {
                board._cells[target_x][target_y] = TypeCell.EMPTY;
            }
        }
    }
}



}