class Arrow
{
 float xPos;
 float yPos;
 int arrowWidth;
 int arrowHeight;
 PImage arrow;
 int transition;
 float sXPos = width/2;
 float sYPos = height/2 + 30;
 boolean clicked = false;
 
 
 Arrow(float pXPos, float pYPos, int pArrowWidth, int pArrowHeight,int pTransition)
 {
   
   transition = pTransition;
   xPos = pXPos;
   yPos = pYPos; 
   arrowWidth = pArrowWidth;
   arrowHeight = pArrowHeight;
   arrow = loadImage("arrow.png");
 }  
  
 void update()
 {
   if(currentScreen < 6)
   {
     if(hoverMouse())fill(255);
     else fill(0);
     rect(xPos,yPos,arrowWidth,arrowHeight);
     fill(255);
     image(arrow,xPos,yPos,50,50);
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
     mainCharacter.posX-30 <= xPos+arrowWidth &&
     mainCharacter.posY+20 <= yPos+arrowHeight &&
     mainCharacter.posY+mainCharacter.imageHeight+40 >= yPos ) return true;
     
     return false;
}

boolean hoverMouse()
{
 if(mouseX >= xPos-15 &&
    mouseX <= xPos+arrowWidth-10 &&
    mouseY >= yPos-15 &&
    mouseY <= yPos+arrowHeight-10) return true;
    return false;
}
  
}
