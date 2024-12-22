// varible pour créer un game pour tester le code  
PVector pos = new PVector(0,0);
PVector pos_deplacement; 
ArrayList<Bullet> bullets_spaceship = new ArrayList<Bullet>(); // liste pour géreres tirs 


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
    this._score = 0;
    this._lifes = START_LIFES ;
    this._levelName = "level 1";
  }


 // for the mean time , cette méthode gère les tirs et le score 
 void update() {
    for (int i = bullets_spaceship.size() - 1; i >= 0; i--) {
        Bullet b = bullets_spaceship.get(i);
        b.update(this, i);
        if (b.toRemove) { // Si la balle doit etre supprimée
            bullets_spaceship.remove(i);
            game._score += SCORE_KILL;
        } else if (b.pos.y < 0) {
            bullets_spaceship.remove(i);
        }
    }
}



  void drawIt() {
    _board.drawIt();
    _spaceship.drawIt();
    for (Bullet b : bullets_spaceship) {
      b.drawIt();
    }
    
  }
  

  void handleKey(int k){
    if( k =='D' || k == 'd' || keyCode == RIGHT){ 
        game._spaceship.move_spaceship_right();
        this._spaceship.update(this._board);
      }else if( k =='Q' || k == 'q' || keyCode == LEFT ){
          game._spaceship.move_spaceship_left();
          this._spaceship.update(this._board);
          // print(this._spaceship._position.x+"::::::"+this._spaceship._position.y);
      }
  }



  // void pour gérer les tirs 
  void handleMouse(int button){
      if(button == LEFT){
      PVector bulletPos = new PVector(_spaceship._position.x, _spaceship._position.y);
      bullets_spaceship.add(new Bullet(bulletPos));
      }
  }
   
   
  // void afichage le score et le nombre de vie 
  void printScore(){
    fill(255,0,0);
     text(this._score, 45,20);

     
  }

  void printLifes(){
    fill(255,0,0);
    text(this._lifes,120,20);
  }
 
  void printLevel(){
    fill(255,0,0);
    text(this._levelName,300,20);
  }
 
} 