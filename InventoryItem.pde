class InventoryItem
{
 float posX;
 float posY;
 float zoomedPosX;
 float zoomedPosY;
 int invItemWidth = 50;
 int invItemHeight = 50;
 int zoomedInvWidth = 500;
 int zoomedInvHeight = 500;
 String identifier;
 PImage itemImg;
 boolean isClickable;
 boolean clicked;
 boolean diaryOpen;
 TextBox closeButton;
 
  InventoryItem(PImage pItemImg, float pPosX, float pPosY, boolean pIsClickable, String pIdentifier)
 {
   itemImg = pItemImg;
   posX = pPosX;
   posY = pPosY;
   isClickable = pIsClickable;
   identifier = pIdentifier;
   if(isClickable)
   {
     zoomedPosX = width/2-zoomedInvWidth/2;
     zoomedPosY = height/2-zoomedInvHeight/2;
     closeButton = new TextBox(zoomedPosX + zoomedInvWidth-130,zoomedPosY + 60, 20,20,22,"X");
   }
 }
 
 void update()
 {
   if(isClickable && hover())
   {
      if(invItemWidth != 60)
      {
        invItemWidth = 60;
        invItemHeight = 60;
      }
      if(mousePressed && !clicked)
      {
         clicked = true; 
         diaryOpen = true;
      }
   }
   else if(isClickable)
   {
      if(invItemWidth != 50)
      {
        invItemWidth = 50;
        invItemHeight = 50;
      }
   }
   
   if(diaryOpen)
   {
         image(itemImg,zoomedPosX,zoomedPosY,zoomedInvWidth,zoomedInvHeight);
         if(closeButton.hover())
         {
            if(closeButton.boxWidth != 25)
            {
              closeButton.boxWidth = 25;
              closeButton.boxHeight = 25;
              closeButton.textSize = 27;
            }
            if(mousePressed && !closeButton.clicked)
            {
              mainCharacter.isMoving = true;
             diaryOpen = false;
             closeButton.clicked = true;
            }
          }
          else
          {
             if(closeButton.boxWidth != 20)
             {
               closeButton.boxWidth = 20;
               closeButton.boxHeight = 20;
               closeButton.textSize = 22;
             }
          }
          closeButton.update();
 
   }
   else
   {
        image(itemImg,posX,posY, invItemWidth, invItemHeight);
   }
   
 }
 
   boolean hover()
   {
     if(mouseX >= posX+10 &&
           mouseX <= posX+invItemWidth-10 &&
           mouseY >= posY &&
           mouseY <= posY+invItemHeight) return true;
         return false;
   }
   
}
