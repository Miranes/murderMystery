class Arrow
{
 float xPos;
 float yPos;
 int arrowWidth = 50;
 int arrowHeight = 50;
 float rotation;
 PImage arrow;
 int transition;
 boolean onTop;
 float sXPos = width/2;
 float sYPos = height/2;
 
 
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
   rotate(rotation);
   image(arrow,-25,-25,50,50);
   popMatrix();
   
   
      if(hover())
      {
         currentScreen = transition; 
         mainCharacter.posX = sXPos;
         mainCharacter.posY = sYPos;
         mainCharacter.translateX = sXPos;
         mainCharacter.translateY = sYPos;
       }   
 }
  
boolean hover()
{
  if(mainCharacter.posX + mainCharacter.playerWidth/2 >= xPos &&
     mainCharacter.posX + mainCharacter.playerWidth/2 <= xPos + arrowWidth &&
     mainCharacter.posY + mainCharacter.playerHeight/2 >= yPos &&
     mainCharacter.posY + mainCharacter.playerHeight/2 <= yPos + arrowHeight) return true;
  return false;
}
  
}
