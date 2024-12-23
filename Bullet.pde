class Bullet {
  PVector pos;
  // les cases du bullet sur le baord 
  int case_x; 
  int case_y; 
  float speed;
  boolean toRemove = false; 
  

  // this constructor is for the bullets tirer par spaceship 
  Bullet(PVector pos_spaceship){
    this.pos = new PVector(pos_spaceship.x, pos_spaceship.y);
    this.case_x = (int) this.pos.x / 30;
    this.case_y = (int) this.pos.y / 30;
    this.speed = 8;  
    
  }

// constructeur pour bullets from invaders 
  Bullet(int case_x , int case_y){
    this.speed = 2;
    this.case_x = case_x;
    this.case_y = case_y;
    this.pos = new PVector(case_x * taille_case + 15 ,case_y * taille_case + 15 ); // +15 our avoir le centre de la case    
  } 

  void update_spaceship(){
    this.pos.y -= speed;
    this.case_y = (int) this.pos.y / 30; 
  }

  void drawIt_spaceship() {
    fill(255, 0, 0);
    ellipse(this.pos.x,this.pos.y, 8, 8);
  }

   void update_invaders_bullet(){
    this.pos.y += speed;
    this.case_y = (int) this.pos.y / 30 ;
   }

   void drawIt_invaders(){
    fill(255,255,255);
    ellipse(this.pos.x,this.pos.y,8,8);
   }


}