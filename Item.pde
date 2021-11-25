class Item
{
  PImage itemImg;
  String itemPath;
  float xPos;
  float yPos;
  int itemWidth;
  int itemHeight;
  int normalWidth;
  int normalHeight;
  int hoveredWidth;
  int hoveredHeight;
  boolean itemFound;
  boolean diary;
  boolean collected;
  InventoryItem itemInv;
  
  
  Item(String pItemPath ,float pXPos, float pYPos, int pItemWidth, int pItemHeight, boolean pDiary,  InventoryItem pItemInv)
  {
    itemPath = pItemPath;
    itemImg = loadImage(pItemPath);
    xPos = pXPos;
    yPos = pYPos;
    itemWidth = pItemWidth;
    itemHeight = pItemHeight;
    diary = pDiary;
    itemInv = pItemInv;
    normalWidth = pItemWidth;
    normalHeight = pItemHeight;
    hoveredWidth = pItemWidth + 10;
    hoveredHeight = pItemHeight + 10;
    
  }
  
  void update()
  {
    //checking if item is already collected and adding it to array
    if(playerHover() && !collected)
    {
      if(diary) inventory.diariesInInventory.add(itemInv); 
      else inventory.itemsInInventory.add(itemInv);

      collected = true;
    }
    
    //hovering over item with cursor if not collected yet
    if(!collected)
    {
      if(mouseHover())
      {
        if(itemWidth != hoveredWidth)
        {
          itemWidth = hoveredWidth;
          itemHeight = hoveredHeight;
        }
      }
      else
      {
        if(itemWidth != normalWidth)
        {
         itemWidth = normalWidth;
         itemHeight = normalHeight;
        }
      }
    }
    
    //displaying item if not collected
    if(!collected) image(itemImg,xPos,yPos,itemWidth,itemHeight);
    
  }
  
  boolean playerHover()
  {
    if(mainCharacter.posX+mainCharacter.imageWidth-230 >= xPos &&
       mainCharacter.posX <= xPos+itemWidth+20 &&
       mainCharacter.posY+20 <= yPos+itemHeight &&
       mainCharacter.posY+mainCharacter.imageHeight+40 >= yPos )
       {
         itemFound = true; 
         return true;
       }
    return false;
  }

  boolean mouseHover()
  {
    if(mouseX >= xPos  &&
       mouseX <= xPos+itemWidth-10 &&
       mouseY >= yPos-10 &&
       mouseY <= yPos+itemHeight-10) return true;
   return false; 
  }
}
