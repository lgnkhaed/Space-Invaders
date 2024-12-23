// varible pour créer un game pour tester le code  
PVector pos = new PVector(0,0);
PVector pos_deplacement; 
ArrayList<Bullet> bullets_spaceship = new ArrayList<Bullet>(); // liste pour gérer les tirs du spaceship  
ArrayList<Bullet> bullets_invaders = new ArrayList<Bullet>();  //liste pour gérer les tirs des Invaders 

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


 // for the mean time , cette méthode gère les tirs du spacesip et le score 
 void update() {
    // boucle for arrraylist of the spacesip bullets 
    for (int i = bullets_spaceship.size() - 1; i >= 0; i--) {
        Bullet b = bullets_spaceship.get(i);
        b.update_spaceship();
         //print("this is bullet before boucle " + b.case_x + "::" + b.case_y + "\n");
        // boucle pour vérifier si bullet se croise avec un invader 
        if (this._board._cells[b.case_y][b.case_x] == TypeCell.INVADER_RED || 
            this._board._cells[b.case_y][b.case_x] == TypeCell.INVADER_GREEN || 
            this._board._cells[b.case_y][b.case_x] == TypeCell.INVADER_CYAN) { 
          // la condition suivante vérifie si la bullet est dans le tableau des invaders sur le board // mainetant ell est juste on rentre dans la boucle quand la bulet travesrse les invaders 
          if (b.case_y >= this._invader_tab.x_first_cell && 
             b.case_y < this._invader_tab.x_first_cell + this._invader_tab._invaders.length
             && b.case_x >= this._invader_tab.y_first_cell && b.case_x < this._invader_tab.y_first_cell + this._invader_tab._invaders[1].length){
               // print("i am in !!!!!");
                int x_tab = b.case_x - this._invader_tab.x_first_cell;
                int y_tab = b.case_y - this._invader_tab.y_first_cell;
                
                if (x_tab >= 0 && x_tab < this._invader_tab._invaders[0].length &&
                y_tab >= 0 && y_tab < this._invader_tab._invaders.length){
        
                  if (this._invader_tab._invaders[y_tab][x_tab] != TypeCell.EMPTY){
                    this._board._cells[b.case_y][b.case_x] = TypeCell.EMPTY;
                    this._invader_tab._invaders[y_tab][x_tab] = TypeCell.EMPTY;
                    b.toRemove = true;
                  }
                }
          }
        }


        if (b.toRemove) { // Si la balle doit etre supprimée
            bullets_spaceship.remove(i);
            game._score += SCORE_KILL;
        } else if (b.pos.y < 0) {
            bullets_spaceship.remove(i);
        }
    }
   
    // boucle for handling the bullets of the invaders 
     for (int i = bullets_invaders.size() - 1; i >= 0; i--) {
        Bullet b = bullets_invaders.get(i);
        b.update_invaders_bullet(); 
      
         if (b.case_x >= 0 && b.case_x < _board._cells[0].length && 
            b.case_y >= 0 && b.case_y < _board._cells.length) {
            
            if (_board._cells[b.case_y][b.case_x] == TypeCell.SPACESHIP) {
                
                b.toRemove = true;
            }
          }

          if (b.toRemove) { // Si la balle doit etre supprimée
            bullets_invaders.remove(i);
            this._lifes -= 1;
        } else if (b.pos.y > 600) {
            bullets_invaders.remove(i);
        }

      }
}



  void drawIt() {
    _board.drawIt();
    _spaceship.drawIt();
    // parcourir les bullets du spaceship 
    for(Bullet b : bullets_spaceship){
      b.drawIt_spaceship();
    }
    // dessiner bullets du invaedrs 
    for(Bullet b2 : bullets_invaders){
        b2.drawIt_invaders();
    }

    
  }
  

  void handleKey(int k){
    if( k =='D' || k == 'd' || keyCode == RIGHT){ 
        game._spaceship.move_spaceship_right();
        this._spaceship.update(this._board);
        //print("::: "+this._spaceship._position.x+":::"+this._spaceship._position.y+"\n");
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
 

  // fonction dans game qui génére qui retourne une case random du board ou il y a un invader 
  int[] random_case(){
    boolean case_vide=true;
    while(case_vide){
      int x = (int) random(0,14);
      int y = (int) random(0,3);
      // pour vérfier si l'invader n'est pas tué 
      if(this._invader_tab._invaders[y][x] == TypeCell.INVADER_RED ||  
        this._invader_tab._invaders[y][x] == TypeCell.INVADER_GREEN ||
        this._invader_tab._invaders[y][x] == TypeCell.INVADER_CYAN){
         
         int x_case = y + this._invader_tab.x_first_cell;
         int y_case = x + this._invader_tab.y_first_cell;

         int[] random_case = {x_case,y_case};
         return random_case;
      }
    }
    return new int[]{-1, -1};
  }



} 