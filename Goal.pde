class Goal extends GameObjects {

  Goal( int x, int y) {
    super(x, y);

    imgX = 200;
    imgY = 200;

    img = loadImage("imgs/the castle of kestrels.gif");
    img.resize(imgX, imgY);
  }
  
  void move(){}
}
