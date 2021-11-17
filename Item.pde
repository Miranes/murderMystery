class Item
{
  float xPos;
  float yPos;
  int itemWidth;
  int itemHeight;
  int rgbItem = 255;
  boolean itemFound;
  
  Item(float pXPos, float pYPos, int pItemWidth, int pItemHeight)
  {
    xPos = pXPos;
    yPos = pYPos;
    itemWidth = pItemWidth;
    itemHeight = pItemHeight;
  }
  
  void update()
  {
    if(hover())rgbItem = 0;
    fill(rgbItem);
    rect(xPos,yPos,itemWidth,itemHeight);
    fill(255);
    
  }
  
boolean hover()
{
  if(mainCharacter.posX + mainCharacter.playerWidth/2 >= xPos &&
     mainCharacter.posX + mainCharacter.playerWidth/2 <= xPos + itemWidth &&
     mainCharacter.posY + mainCharacter.playerHeight/2 >= yPos &&
     mainCharacter.posY + mainCharacter.playerHeight/2 <= yPos + itemHeight)
     {
       itemFound = true; 
       return true;
     }
  return false;
}

}
