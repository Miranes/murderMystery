class Inventory
{
  PImage inventoryBag;
  PImage inventoryOpen;
  int inventoryWidth = 375;
  int inventoryHeight = 255;
  float posX = 1500;
  float posY = 20;
  ArrayList<InventoryItem> itemsInInventory;
  ArrayList<InventoryItem> diariesInInventory;
  TextBox[] buttons;
  boolean clicked;
  boolean open;
  boolean diaryIsOpen;
  
  Inventory()
  {
    itemsInInventory = new ArrayList();
    diariesInInventory = new ArrayList();
    inventoryBag = loadImage("inventoryButton.png");
    inventoryOpen = loadImage("inventoryOpen.png");
    buttons = new TextBox[]{new TextBox(width-100,50,100,84,inventoryBag),new TextBox(posX+inventoryWidth-30,posY + 30, 35,35,39,"X")};
  }
  
  void update()
  {
     overInventoryBox();
     if(open)
     {
         if(buttons[1].hover() && mousePressed && !clicked)
         {
           open = false;    
           clicked = true;
         }
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
         if(diariesInInventory.size() > 0)
         {
           for(int i=diariesInInventory.size()-1; i >= 0; i--)
           {
             diariesInInventory.get(i).update();
           }
         }
     }
     else
     {
        buttons[0].update();
        for(int i=diariesInInventory.size()-1; i >= 0; i--)
        {
          if(diariesInInventory.get(i).diaryOpen)diariesInInventory.get(i).update();
        }
        if(buttons[0].hover() && mousePressed && !clicked)
        {
            for(int i=diariesInInventory.size()-1; i >= 0; i--)
            {
              if(diariesInInventory.get(i).identifier == "wifeEntree")
              {
                diariesInInventory.get(i).clicked = true;
                break; 
              }
            }
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
  
  boolean overInventoryBox()
  {
    if(mouseX >= posX &&
       mouseX <= posX+inventoryWidth &&
       mouseY >= posY &&
       mouseY <= posY+inventoryHeight && open) return true;
    return false;
  }
}
