// varible pour créer un game pour tester le code  
PVector pos = new PVector(100,100);
PVector pos_deplacement; 



class Game 
{
  Board _board;
  Spaceship _spaceship;
  Invaders _invader_tab;
  String _levelName;
  int _lifes;
  int _score;
  
  Game() {
    this._board = new Board(pos,20,20,taille_case);
    this._spaceship = new Spaceship(); 
    this._invader_tab = new Invaders(this._board);
  }
  
  void update() {

  }
  
  void drawIt() {
    _board.drawIt();
    _spaceship.drawIt();
  }
  
  void handleKey(int k){
    if( k =='D' || k == 'd' || keyCode == RIGHT){ 
        game._spaceship.move_spaceship_right();
        this._spaceship.update(this._board);
      }else if( k =='Q' || k == 'q' || keyCode == LEFT ){
          game._spaceship.move_spaceship_left();
          this._spaceship.update(this._board);
      }
  }
}
