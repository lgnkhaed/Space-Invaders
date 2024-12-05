
class Spaceship {
  // Position on screen.
  PVector _position;
  // Position on board.
  int _cellX, _cellY;
  // Display size.
  float _size;
      
  Spaceship(PVector position){
    this._position = position;
    this._cellX = 200 +int(position.y)*20;
    this._cellY = 200+int(position.x)*20;
    this._size = size_spaceship;
  }
   
   
   /* pour déplacer  spachship */
  void move(Board board, PVector dir){
    this._cellX = int(dir.x) ; 
    this._cellY = int(dir.y);
    board._cells[_cellX][_cellY] = TypeCell.SPACESHIP;
  }
  
  void update(Board board){

  }
  
  void drawIt() {
    imageMode(CENTER);
    image(spaceship_,_cellX,_cellY,taille_case,taille_case);
  }
}
