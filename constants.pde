// Number of lifes.
final int START_LIFES = 3;
// Score for a kill.
final int SCORE_KILL = 10;
// loaded files should be dans la void setup() 
PImage cyan_invader_1 ;
PImage cyan_invader_2 ;
PImage red_invader_1 ;
PImage red_invader_2 ;
PImage green_invader_1 ;
PImage green_invader_2;
PImage spaceship_ ;

// la taille de la case dans bard et elle représente aussi le size display pour spaceship et invader 
final int taille_case = 30; 


// nombres de cases est 400 
int nbr_case = 20;
// taille du spaceshp 
// final float size_spaceship = 20;

// position départ Spaceship ,, modifiable durant la partie une fois terminé , elle se réintillise  
PVector start_position = new PVector(taille_case-1, taille_case/2);


// la vitesse du deplacement du spaceship 
final int speed = 30 ; 

final float pos_vertical_spaceship = 655;/* la position vertical final de  */

// constants to use in the startof the game 
final int  x_pos_invaders_dep = 2 ; 
final int y_pos_invaders_dep = 3; 



// font pour le projet 
PFont font_for_score;
PFont font_for_menu;