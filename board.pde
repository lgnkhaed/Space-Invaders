// An enum is a special "class" that represents a group of constants.
enum TypeCell 
{
  EMPTY,
  SPACESHIP,
  INVADER,
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
       _cells[10][5] = TypeCell.SPACESHIP;
       _cells[15][10] = TypeCell.INVADER;
  }
  
  PVector getCellCenter(int i, int j) {
    return new PVector( _position.x + j * _cellSize + (_cellSize * 0.5),
                        _position.y + i * _cellSize + (_cellSize * 0.5) );
  }
  
  
  void drawIt(){
   
     for ( int i = 0 ; i < _nbCellsY ; i++){
        for ( int j = 0 ; j < _nbCellsX ; j++){
          
          switch (_cells[i][j]) {
             case INVADER:
                  imageMode(CENTER);
                  centre = getCellCenter(i, j);   
                  image(red_invader_2,centre.x,centre.y,20,20); 
                  break;
             case SPACESHIP:
                  imageMode(CENTER);
                  centre = getCellCenter(i, j);
                  image(spaceship_,centre.x,centre.y,20,20);
                  break;
             case OBSTACLE:
                  centre = getCellCenter(i, j);
                  print("hello i am an obstacle");
                  break;
             case EMPTY:
                  centre = getCellCenter(i, j);
                  fill(255, 0, 0);
                  circle(centre.x, centre.y, 0.5 * _cellSize);
                  break;
             default:
                  noFill();
                  break;
          }
       }
     }
  }
}
