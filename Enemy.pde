class Enemy extends GameObjects {
  int speed = 1;

  int frameCounter=0;
  int countDirection=1;

  Enemy( int x, int y) {
    super(x, y);
  }

  void move() {
    x = x+ speed;
    if ( this.x > width) {
      x = 0;
      y = (int) random(0, height);
    }
  }
}
 
