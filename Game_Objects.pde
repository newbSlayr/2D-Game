abstract class GameObjects {
  //attributes
  int x, y;
  int speed;
  int imgX ;
  int imgY ;
  PImage img,img2, img3, img4;

  //constructors
  GameObjects( int x, int y) {
    this.x = x;
    this.y = y;
  }
  GameObjects(int x, int y, int imgX, int imgY) {
    this.x = x;
    this.y = y;
    this.imgX = imgX;
    this.imgY = imgY;
  }

  //methods
  void render() {
    image(img, x, y);
  }

  void update() {
    move();
    render();
  }

  abstract void move();
  
  //collision 
  boolean  collision(Enemy other)
  {
    return abs(this.x-other.x)<img.width/2 && abs(this.y-other.y)<img.height/2;
  }
}
