class Inventory
{
  float posX = 0;
  float posY = 0;
  int inventoryWidth = width;
  int inventoryHeight = 103;
  ArrayList<InventoryItem> itemsInInventory;
  
  Inventory()
  {
    itemsInInventory = new ArrayList(); 
  }
  
  void update()
  {
   
   fill(255,10);
   rect(posX,posY, inventoryWidth,inventoryHeight);
   if(itemsInInventory.size() > 0)
   {
     for(int i=itemsInInventory.size()-1; i >= 0; i--)
     {
       itemsInInventory.get(i).update();
     }
   }
  }
  
}
