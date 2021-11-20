class Arrow
{
 float xPos;
 float yPos;
 int arrowWidth = 50;
 int arrowHeight = 50;
 float rotation;
 PImage arrow;
 int transition;
 float sXPos = width/2;
 float sYPos = height/2;
 boolean clicked = false;
 
 
 Arrow(float pXPos, float pYPos, float pRotation, int pTransition)
 {
   
   transition = pTransition;
   xPos = pXPos;
   yPos = pYPos; 
   arrow = loadImage("arrow.png");
   rotation = pRotation;
 }  
  
 void update()
 {
     pushMatrix();
     translate(xPos,yPos);
     fill(255);
     rotate(rotation);
     image(arrow,-25,-25,50,50);
     popMatrix();
    

    if(hoverPlayer())
    {
       currentScreen = transition; 
       mainCharacter.posX = sXPos;
       mainCharacter.posY = sYPos;
       mainCharacter.translateX = sXPos;
       mainCharacter.translateY = sYPos;
     }   
 }

//Check where the arrows start and finish to improve the hovers method (not working properly)
boolean hoverPlayer()
{
  if(mainCharacter.posX >= xPos-25 &&
     mainCharacter.posX <= xPos + arrowWidth-25 &&
     mainCharacter.posY + mainCharacter.playerHeight/2 >= yPos-25 &&
     mainCharacter.posY + mainCharacter.playerHeight/2 <= yPos + arrowHeight-25) return true;
  return false;
}

boolean hoverMouse()
{
 if(mouseX >= xPos-25 &&
    mouseX <= xPos+arrowWidth-25 &&
    mouseY >= yPos-25 &&
    mouseY <= yPos+arrowHeight-25) return true;
    return false;
}
  
}
