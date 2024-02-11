class Bomb extends Enemy {

  Bomb( int x, int y) {
    super(x, y);
    imgX = 70;
    imgY = 70;
    img = loadImage("imgs/bomb.png");
    img.resize(imgX, imgY);
  }

  @Override
    void move () {
    speed = 5;
    y= y+ speed;
  }
}
