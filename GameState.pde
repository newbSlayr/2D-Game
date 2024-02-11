int score =0;
int health = 3;
int level =1;
int counter =0;

class GameState {

  void stats() {
    textAlign(CENTER);
    fill(255);
    text("Score: " + score, 24*2, 24);
    text("Lives: " + health, 24*2, 24*2);
    text("Level: " + level, 24*2, 24*3);
    textSize(24);
  }

  //gameover resets the screen and display 'game over' and your score
  void gameOver() {
    gameMode = FINISHED;
    background(0);
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(100);
    text("GAME OVER", width/2, height/2);
    Goblins.removeAll(trash);
    Goblins.removeAll(Goblins);
    diglet.removeAll(trash);
    results();
  }


  void level_1() {
    if (counter >60 ) {
      int randomX = (int) random(-5, width-200);
      int randomY = (int) random(0, height);
      Goblins.add ( new Goblin (0, randomY));
      diglet.add ( new Bomb (randomX, 0));

      counter= 0;
    }
  }

  void level_2() {
    if (counter >40 ) {
      int randomX = (int) random(-5, width-200);
      int randomY = (int) random(0, height);
      Goblins.add ( new Goblin (0, randomY));
      diglet.add ( new Bomb (randomX, 0));

      counter= 0;
    }
  }


  void results() {
    String scoreSTR = str(score);
    String [] list = split(scoreSTR, '\n');
    saveStrings("data/results.txt", list);

    String[] scoreL = loadStrings("results.txt");
    for (int i = 0; i < scoreL.length; i++) {
      textSize(50);
      text("Score " + scoreL[i], width/2, height/3);
    }
  }
}
