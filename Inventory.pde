class Inventory
{
  PImage inventoryBag;
  PImage inventoryOpen;
  int inventoryWidth = 200;
  int inventoryHeight = 150;
  float posX = 20;
  float posY = height/2 - 50;
  ArrayList<InventoryItem> itemsInInventory;
  TextBox[] buttons;
  boolean clicked;
  boolean open;
  
  Inventory()
  {
    itemsInInventory = new ArrayList();
    inventoryBag = loadImage("inventoryButton.png");
    inventoryOpen = loadImage("inventoryOpen.png");
    //float pXPos, float pYPos, int pBoxWidth, int pBoxHeight, PImage pBoxImg
    buttons = new TextBox[]{new TextBox(width-100,50,100,84,inventoryBag),new TextBox(inventoryWidth,posY + 20, 20,20)};
    buttons[0].rgbColor[1] = 255;
    buttons[0].rgbColor[2] = 255;

  }
  
  void update()
  {
     
     if(open)
     {
         if(buttons[1].hover() && mousePressed && !clicked)
         {
           open = false;    
           clicked = true;
         }
         fill(255,150);
         image(inventoryOpen,posX,posY, inventoryWidth,inventoryHeight);
         fill(0);
         buttons[1].update();
         fill(255);
         if(itemsInInventory.size() > 0)
         {
           for(int i=itemsInInventory.size()-1; i >= 0; i--)
           {
             itemsInInventory.get(i).update();
             
           }
         }
     }
     else
     {
        buttons[0].update();
        if(buttons[0].hover() && mousePressed && !clicked){
          open = true;
          clicked = true; 
        }
     }
  }
  
  boolean overButton()
  {
    if(buttons[0].hover() || buttons[1].hover()) return true;
    return false;
  }
}
