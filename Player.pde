class Player
{

  boolean isMoving;
  float posX = 0;
  float posY = 0;
  float tX = 0; 
  float tY = 0;
  int playerHeight = 50;
  int playerWidth = 50;



  void update() { 

    if (mousePressed && !isMoving) {
      tX = mouseX;
      tY = mouseY;
      isMoving = true;
    }
    if (isMoving && tX/posX < 0.99 || tX/posX > 1.01 || tY/posY < 0.99 || tY/posY > 1.01  ) 
    {
      posX = lerp(posX, tX, .04);
      posY = lerp(posY, tY, .04);
    } 

    rect(posX, posY, 50, 50);
  }

}
