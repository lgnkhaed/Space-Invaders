

class Spaceship {
  // Position on screen.
  PVector _position;
  // Position on board.
  int _cellX, _cellY;
  // Display size.
  float _size;
      
  // je passe aucun argument pour le constructeur il démarre de (10,10) sur le board 
  Spaceship(){
    this._cellX = 10;
    this._cellY = 19;
    this._position = new PVector();
    this._position.x = 315 /* 10 * taille case + 15 */ ;
    this._position.y = 585 ; 
    this._size = taille_case;
    //  print(this._cellX +" ***********" + this._cellY + "**********" + this._position.x + ":"+this._position.y);
  }
   

 void move(Board board, PVector dir){}
  

 void update(Board board) {
    // calcul des nums des cases en dépendant sur la position après le movement 
    int newCellX = floor((this._position.x - board._position.x) / board._cellSize);
    int newCellY = floor((this._position.y - board._position.y) / board._cellSize);

    // Constrain the values 
    newCellX = constrain(newCellX, 0, board._nbCellsX - 1);
    newCellY = constrain(newCellY, 0, board._nbCellsY - 1);

    // update the board cells si spaceship a changé de place 
    if (newCellX != this._cellX || newCellY != this._cellY) {
        board._cells[this._cellY][this._cellX] = TypeCell.EMPTY; // Clear the old cell
        this._cellX = newCellX;
        this._cellY = newCellY;
        board._cells[this._cellY][this._cellX] = TypeCell.SPACESHIP; // Set the new cell
    }

    // just to verfiy le update et les cases sont justes 
    // print("Spaceship updated: cellX=" + this._cellX + ", cellY=" + this._cellY);
}
      

  
  void drawIt() {
    imageMode(CENTER);
    image(spaceship_,this._position.x,this._position.y,taille_case,taille_case);
  }

//  déplacement du spaceship right 
  void move_spaceship_right(){

     if(this._position.x < 570 ){
       this._position.x  += speed;
    } 
   
  }

// deplacement du spaceship left
   void move_spaceship_left(){ 
      if(this._position.x > 30.0){
       this._position.x  -= speed;
     } 
  }

  

}
