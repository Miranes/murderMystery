class Player
{

  boolean isMoving;
  float posX = 0;
  float posY = 0;
  float translateX = 0; 
  float translateY = 0;
  int playerHeight = 50;
  int playerWidth = 50; = 50;P
  void update() { 

    if (mousePressed && !isMoving) {
      translateX = mouseX - playerWidth/2;
      translateY = mouseY - playerHeight/2;
      isMoving = true;
    }
    if (posX != translateX && posY != translateY) 
    {
      posX = lerp(posX, translateX, .04);
      posY = lerp(posY, translateY, .04);
    } 

    rect(posX, posY, 50, 50);
  }

}
