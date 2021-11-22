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
 float sYPos = height/2 + 30;
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
   if(currentScreen < 6)
   {
     pushMatrix();
     translate(xPos,yPos);
     fill(255);
     rotate(rotation);
     image(arrow,-25,-25,50,50);
     popMatrix();
   }
   
    if(hoverPlayer() && currentScreen >= 6)
    {
       currentScreen = transition; 
       mainCharacter.posX = sXPos;
       mainCharacter.posY = sYPos;
       mainCharacter.translateX = sXPos;
       mainCharacter.translateY = sYPos;
     }
     else if(hoverMouse() && mousePressed && !clicked && currentScreen < 6)
     {
       
       for(int i=2; i<6; i++)
       {
        screens[i].arrows[0].clicked = true; 
       }
       if(currentScreen == 5) mainCharacter.isMoving = true;
       currentScreen = transition;
     }
 }


boolean hoverPlayer()
{
  if(mainCharacter.posX-40+mainCharacter.imageWidth-165 >= xPos &&
     mainCharacter.posX <= xPos+arrowWidth &&
     mainCharacter.posY+20 <= yPos+arrowHeight &&
     mainCharacter.posY+mainCharacter.imageHeight-30 >= yPos ) return true;
     
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
