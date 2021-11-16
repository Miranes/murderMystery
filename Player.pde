class Player
{
  
  boolean isMoving;
  float posX = 0;
  float posY = 0;
  float tX = 0; 
  float tY = 0;


  void update() { 
   
    if (mousePressed && !isMoving) {
      tX = mouseX;
      tY = mouseY;
      isMoving = true;
    }
    if (isMoving && tX/posX < 0.99 || tX/posX > 1.01 || tY/posY < 0.99 || tY/posY > 1.01  ) {
      posX = lerp(posX, tX, .01);
      posY = lerp(posY, tY, .01);
    } else {
      isMoving = false;
    }

    rectMode(CENTER);
    rect(posX, posY, 50, 150);

  }
}
