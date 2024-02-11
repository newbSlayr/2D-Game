class Player extends GameObjects {

  //constructor 
  Player(int x, int y) {
    super(x, y);
    imgX = 70;
    imgY = 70;
    img = loadImage("imgs/player.png");
    img.resize(imgX, imgY);
    imageMode(CENTER);
  }



  void mouseClicked() {
    if  (mouseButton == LEFT) {
      x = mouseX ;
      y =mouseY ;
    }
  }

  @Override
    void move() {
    mouseClicked();
  }

 
}
