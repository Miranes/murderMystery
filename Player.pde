class Player
{

  boolean isMoving;
  float posX = width/2;
  float posY = height/2;
  float translateX = width/2; 
  float translateY = height/2;
  float nextScreenPosX;
  float nextScreenPosY;
  int playerHeight = 50;
  int playerWidth = 50;
  
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
