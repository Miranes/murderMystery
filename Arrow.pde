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
 int timer;
 
 
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
     if(hoverMouse())
     {
       if(arrowWidth != 60)
       {
        arrowWidth = 60;
        arrowHeight = 60;
       }
     }
     else
     {
        if(arrowWidth != 50)
        {
          arrowWidth = 50;
          arrowHeight = 50;
        }
     }  
     image(arrow,xPos,yPos,arrowWidth,arrowHeight);
   }
   
    //teleporting to screens that are not locked
    if(hoverPlayer() && currentScreen >= 6 && (transition != 9 || !screens[9].locked) 
       && (transition != 10 || !screens[10].locked) && (transition != 12 || !screens[12].locked) )
    {
       currentScreen = transition; 
       mainCharacter.posX = sXPos;
       mainCharacter.posY = sYPos;
       mainCharacter.translateX = sXPos;
       mainCharacter.translateY = sYPos;
     }
     else if(hoverPlayer() && ((transition == 9 && screens[9].locked) || (transition == 10 && screens[10].locked) || (transition == 12 && screens[12].locked)))
     {
       text("Room locked, find key!", width/2,height-150); 
     }
     
     if(currentScreen < 6 && hoverMouse() && mousePressed && !clicked)
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
