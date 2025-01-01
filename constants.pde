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

// position départ Spaceship ,, modifiable durant la partie une fois terminé , elle se réintillise  
PVector start_position = new PVector(taille_case-1, taille_case/2);


// la vitesse du deplacement du spaceship 
final int speed = 30 ; 

final float pos_vertical_spaceship = 655;/* la position vertical final de  */

// constants to use in the startof the game 
final int  x_pos_invaders_dep = 2 ; 
final int y_pos_invaders_dep = 3; 

// dimensions pour les buttons de menu 
int menu_size = 400;
int width_button = 200 ;
int height_button = 50; 
int space_between = 20; 

// font pour le projet 
PFont font_for_score;
PFont font_for_menu;

// tableau Strings pour chager text file des  meilleurs scores
String[] best_scores; 

// variables
Game game;
boolean game_is_running = false; // set true au début de jeu ;;; jl'uilise dans la classe Invaders 
boolean tab_pressed = false; 
int lastMoveTimeInvaders = 0;
int moveIntervalInvaders = 1000; // moves chaque 1s 
int shotIntervalInvaders = 5000;  // tirent chaque 5s 
Menu menu;
ArrayList<Bullet> bullets_spaceship = new ArrayList<Bullet>(); // liste pour gérer les tirs du spaceship  
ArrayList<Bullet> bullets_invaders = new ArrayList<Bullet>();  //liste pour gérer les tirs des Invaders 
int number_of_games_saved = 0 ; // variable used inthe menu when we save the game 
int number_game_to_charge ; // variable used in the menu to charge a game 
String chemin_game_to_charge; 
import javax.swing.JOptionPane;
boolean printScores = false; 

// boolean pour finrir le jeu 
boolean game_is_over = false;
boolean you_win =false; 

// varible pour créer un game pour tester le code  
PVector pos = new PVector(0,0);
PVector pos_deplacement; 