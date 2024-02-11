import java.util.Arrays;
import java.util.Collections;


PImage bg;

final int PLAYING = 0;
final int FINISHED = 1;
int gameMode = PLAYING;

// arraylist of enemy obj
ArrayList<Goblin> Goblins = new ArrayList<Goblin>();
ArrayList<Bomb> diglet = new ArrayList<Bomb>();
ArrayList<Enemy> trash = new ArrayList<>(); // list to remove obj

//creating obj of class from calling the constructor
Goal castle;
Player p1;
GameState game;

void setup()
{
  size(1000, 700);
  bg = loadImage("imgs/background.jpg");
  bg.resize(width, height);

  //declaring constructor parameters for the new objs created
  castle = new Goal(900, 400);
  p1 = new Player(width/2, height/2);
  game = new GameState();
}


void draw()
{


  if (gameMode == PLAYING) {

    // render objects
    background(bg);
    castle.update();
    p1.update();

    //calling method stats for onscreen lives etc...
    game.stats();

    counter +=1; //counter to set the speed at which the enemies are spawned ( the higher the more objs are spawned)

        // Render Goblins
    for (Goblin goblin : Goblins) {
      goblin.update(); // Update Goblin position
      goblin.render();  // Render Goblin
    }
    
    game.level_1();
    if (score > 10) {
      game.level_2();
      level = 2;
    }
    
    for ( int i = 0; i<diglet.size(); i++)
    {
      Bomb Bomb = diglet.get(i);
      Bomb.update();

      if (p1.collision(Bomb)) {
        game.gameOver();
      }
    }

    for ( int i = 0; i<Goblins.size(); i++)
    {
      Goblin Goblin = Goblins.get(i);
      Goblin.update();

      if (castle.collision(Goblin) ) { //if collision with goblin with goal is true, Goblin is added to trash arraylist
        trash.add(Goblin);
        health -= 1;
        if (health <= 0 ) {
          game.gameOver();
        }
      }
      if ( mouseButton == LEFT ) {
        if (p1.collision(Goblin)) {
          trash.add(Goblin); //if collision with goblin with player is true, Goblin is added to trash arraylist
          score +=1;
        }
      }
    }
  }
  Goblins.removeAll(trash);
}


void keyPressed() {
  if (gameMode == FINISHED) {
    if (key == ' ') {
      score = 0;
      health = 3;
      level = 1;
      counter = 0;
      gameMode = PLAYING;
      Goblins.clear();
      diglet.clear();
      trash.clear();
      p1 = new Player(width/2, height/2);
      castle = new Goal(900, 400);
    }
  }
}
