class Item
{
  PImage itemImg;
  float xPos;
  float yPos;
  int itemWidth;
  int itemHeight;
  boolean itemFound;
  boolean diary;
  InventoryItem itemInv;
  
  
  Item(PImage pItemImg ,float pXPos, float pYPos, int pItemWidth, int pItemHeight, boolean pDiary,  InventoryItem pItemInv)
  {
    itemImg = pItemImg;
    xPos = pXPos;
    yPos = pYPos;
    itemWidth = pItemWidth;
    itemHeight = pItemHeight;
    diary = pDiary;
    itemInv = pItemInv;
  }
  
  void update()
  {
    if(diary)
    {
      if(hover() && !inventory.diariesInInventory.contains(itemInv))inventory.diariesInInventory.add(itemInv); 
    }
    else
    {
      if(hover() && !inventory.itemsInInventory.contains(itemInv))inventory.itemsInInventory.add(itemInv);
    }
    image(itemImg,xPos,yPos,itemWidth,itemHeight);
    
  }
  
  boolean hover()
  {
    if(mainCharacter.posX-40+mainCharacter.imageWidth-165 >= xPos &&
       mainCharacter.posX <= xPos+itemWidth+20 &&
       mainCharacter.posY+20 <= yPos+itemHeight &&
       mainCharacter.posY+mainCharacter.imageHeight-30 >= yPos )
       {
         itemFound = true; 
         return true;
       }
    return false;
  }

}
