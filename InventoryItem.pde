class InventoryItem
{
 float posX;
 float posY;
 int invItemWidth = 50;
 int invItemHeight = 50;
 PImage itemImg;
 
  InventoryItem(PImage pItemImg, float pPosX, float pPosY)
 {
   itemImg = pItemImg;
   posX = pPosX;
   posY = pPosY;
 }
 
 void update()
 {
   image(itemImg,posX,posY, invItemWidth, invItemHeight);
 }
}
