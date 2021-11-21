class Item
{
  float xPos;
  float yPos;
  int itemWidth;
  int itemHeight;
  int rgbItem = 255;
  boolean itemFound;
  InventoryItem itemInv;
  
  Item(float pXPos, float pYPos, int pItemWidth, int pItemHeight, InventoryItem pItemInv)
  {
    xPos = pXPos;
    yPos = pYPos;
    itemWidth = pItemWidth;
    itemHeight = pItemHeight;
    itemInv = pItemInv;

  }
  
  void update()
  {
    
    if(hover()&& !inventory.itemsInInventory.contains(itemInv))inventory.itemsInInventory.add(itemInv);
    else rgbItem = 255;
    fill(rgbItem);
    rect(xPos,yPos,itemWidth,itemHeight);
    fill(255);
    
  }
  
boolean hover()
{
  if(mainCharacter.posX >= xPos &&
     mainCharacter.posX <= xPos + itemWidth &&
     mainCharacter.posY + mainCharacter.imageHeight/2 >= yPos &&
     mainCharacter.posY + mainCharacter.imageHeight/2 <= yPos + itemHeight)
     {
       itemFound = true; 
       return true;
     }
  return false;
}

}
