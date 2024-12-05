// varible pour créer un game pour tester le code  
PVector pos = new PVector(200,200);


class Game 
{
  Board _board;
  Spaceship _spaceship;
  String _levelName;
  int _lifes;
  int _score;
  
  Game() {
    this._board = new Board(pos,taille_case,taille_case,taille_case);
    this._spaceship = new Spaceship(start_position); 
  }
  
  void update() {
  }
  
  void drawIt() {
    _board.drawIt();
    _spaceship.drawIt();
  }
  
  void handleKey(int k) {
  }
}
