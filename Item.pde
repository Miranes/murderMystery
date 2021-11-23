class Item
{
  PImage itemImg;
  float xPos;
  float yPos;
  int itemWidth;
  int itemHeight;
  int rgbItem = 255;
  boolean itemFound;
  InventoryItem itemInv;
  
  Item(PImage pItemImg ,float pXPos, float pYPos, int pItemWidth, int pItemHeight, InventoryItem pItemInv)
  {
    itemImg = pItemImg;
    xPos = pXPos;
    yPos = pYPos;
    itemWidth = pItemWidth;
    itemHeight = pItemHeight;
    itemInv = pItemInv;
  }
  
  void update()
  {
    
    if(hover()&& !inventory.itemsInInventory.contains(itemInv))inventory.itemsInInventory.add(itemInv);
    rect(xPos,yPos,itemWidth,itemHeight);
    image(itemImg,xPos,yPos,itemWidth,itemHeight);

    
  }
  
boolean hover()
{
  if(mainCharacter.posX-40+mainCharacter.imageWidth-165 >= xPos &&
     mainCharacter.posX <= xPos+itemWidth+20 &&
     mainCharacter.posY+20 <= yPos+itemHeight &&
     mainCharacter.posY+mainCharacter.imageHeight-30 >= yPos )/*mainCharacter.posX >= xPos &&
     mainCharacter.posX <= xPos + itemWidth &&
     mainCharacter.posY + mainCharacter.imageHeight/2 >= yPos &&
     mainCharacter.posY + mainCharacter.imageHeight/2 <= yPos + itemHeight)*/
     {
       itemFound = true; 
       return true;
     }
  return false;
}

}
