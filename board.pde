// An enum is a special "class" that represents a group of constants.
enum TypeCell 
{
  EMPTY,
  SPACESHIP,
  INVADER_RED,
  INVADER_GREEN,
  INVADER_CYAN,
  OBSTACLE
}
// une varible pour m'aider à calculer les centres des cases pour faire le draw 
PVector centre;

class Board 
{
  TypeCell _cells[][];
  PVector _position;
  int _nbCellsX;
  int _nbCellsY;
  int _cellSize; // Cells should be square.
  
  
  Board(PVector pos, int nbX, int nbY, int size) {
    _position = pos.copy();
    _nbCellsX = nbX;
    _nbCellsY = nbY;
    _cellSize = size;
    _cells = new TypeCell[_nbCellsY][_nbCellsX];

      /* intialisation des cases en Empty */ 
       for ( int i = 0 ; i <_nbCellsY ; i++ ){
          for( int j = 0 ; j < _nbCellsX ; j++ ){
             _cells[i][j] = TypeCell.EMPTY;
          }
       }
       
       
      // juste pour tester l'affichage du board 
       // _cells[10][10] = TypeCell.OBSTACLE;
      // _cells[15][10] = TypeCell.INVADER;
  }

  // constructeur pour aider à remplir le board à partir d'un fihcier text 
  Board(){
     this._position = new PVector(0,0);
     this._nbCellsX = nbr_case;
     this._nbCellsY = nbr_case;
     _cellSize = taille_case;
     _cells = new TypeCell[_nbCellsY][_nbCellsX];
  }





  PVector getCellCenter(int i, int j) {
    return new PVector( _position.x + j * _cellSize + (_cellSize * 0.5),
                        _position.y + i * _cellSize + (_cellSize * 0.5) );
  }
  
  
  void drawIt(){
   
     for ( int i = 2 ; i < _nbCellsY ; i++){ // starting from 2 because the first two lines to be able to display the score and lifes 
        for ( int j = 0 ; j < _nbCellsX ; j++){
          
          switch (_cells[i][j]) {
             case INVADER_RED:
                  imageMode(CENTER);
                  centre = getCellCenter(i, j);   
                  image(red_invader_1,centre.x,centre.y,20,20); 
                  break;
             case INVADER_GREEN:
                  imageMode(CENTER);
                  centre = getCellCenter(i, j);   
                  image(green_invader_1,centre.x,centre.y,20,20); 
                  break;
             case INVADER_CYAN:
                  imageMode(CENTER);
                  centre = getCellCenter(i, j);   
                  image(cyan_invader_1,centre.x,centre.y,20,20); 
                  break;          
             case SPACESHIP:
                  imageMode(CENTER);
                  centre = getCellCenter(i, j);
                  image(spaceship_,centre.x,centre.y,taille_case,taille_case);
                  break;
             case OBSTACLE:
                  centre = getCellCenter(i, j);
                  fill(64,64,64);
                  rectMode(CENTER);
                  rect(centre.x,centre.y,this._cellSize,this._cellSize);
                  break;
             case EMPTY:
                  centre = getCellCenter(i, j);
                  fill(0);
                  //stroke(255); 
                  // strokeWeight(2); 
                  rectMode(CENTER); 
                  rect(centre.x, centre.y,this._cellSize, this._cellSize);
                  break;
             default:
                  noFill();
                  break;
          }
       }
     }
  }

// void to save the board 
void saveBoard() {
    ArrayList<String> to_save_board = new ArrayList<>();
    to_save_board.add("Game number : " + number_of_games_saved);
    number_of_games_saved++; 

    for (int i = 2; i < this._nbCellsY; i++) {
        String line = "";
        for (int j = 0; j < this._nbCellsX; j++) {
            switch (this._cells[i][j]) {
                case EMPTY:
                    line += "E";
                    break;
                case INVADER_GREEN:
                case INVADER_CYAN:
                case INVADER_RED:
                    line += "I";
                    break;
                case OBSTACLE:
                    line += "X";
                    break;
                case SPACESHIP:
                    line += "S";
                    break;
            }
        }
        to_save_board.add(line);
    }
    
    saveStrings("saved_games/game" + number_of_games_saved, to_save_board.toArray(new String[0]));
}


}
