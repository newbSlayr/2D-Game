class Goblin extends Enemy{
 
  Goblin( int x, int y) {
    super(x, y);
    imgX = 70;
    imgY = 70;
    img = loadImage("imgs/walk1.png");
    img2 = loadImage("imgs/walk2.png");
    img3 = loadImage("imgs/walk3.png");
    img4 = loadImage("imgs/walk4.png");
  }
   @Override
  void render() //display Goblin walking
  {
    imageMode(CENTER);
    frameCounter = frameCounter + countDirection;

    if ( frameCounter >= 0 && frameCounter <10  )

      image(img, x, y);
    else if ( frameCounter >= 10 && frameCounter <20  )

      image(img2, x, y);
    else if ( frameCounter >= 20 && frameCounter <30  )

      image(img3, x, y);
    else
    {
      image(img4, x, y);
    }
    if (frameCounter >=40)
      frameCounter =0;
  }
}
