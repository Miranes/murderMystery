//declaring screens
Screen[] screens;
Screen startScreen;
Screen explanationScreen1;
Screen explanationScreen2;
Screen explanationScreen3;
Screen creditScreen;
Screen respawnScreen;
Screen entranceScreen;
Screen upstairHallScreen;
Screen kitchenScreen;
Screen basementScreen;
Screen masterBedScreen;
Screen atticHallScreen;
Screen atticScreen;
Screen hallScreen;
Screen livingRoomScreen;

//declaring items 
Item[] items;
Item butlerEntree;
Item maidEntree;
Item brotherEntree;
Item wifeEntree;
Item driedFlower;
Item morphine;
Item screwDriver;
Item keyAttic;
Item keyBasement;
Item letter;

//declaring NPCs
Npc wife;
Npc brother;
Npc butler;
Npc maid;
Npc cat;

//declaring player
Player mainCharacter;

//declaring Inventory 
Inventory inventory;

//Game font
PFont pixelFont;

int currentScreen;

void setup() {
 
  size(1200, 675);
  pixelFont = createFont("pixelFont.ttf",72);
  textFont(pixelFont);

  currentScreen = 0;
  mainCharacter = new Player();
  
  float dialogueBoxX = width/2;
  float dialogueBoxY = height - 48;
  PImage dialogueBoxImg = loadImage("dialogueBox.png");
  //initializing npcs
  wife = new Npc(width/2-38,height/2+28,200,200,"wife",new TextBox(dialogueBoxX,dialogueBoxY,900,150,20,"Hey, you! Thieve!",dialogueBoxImg),new Animation(loadImage("wifeIdle.png"),6,1));
  brother = new Npc(width/2+100,height/2-2,230,230,"brother",new TextBox(dialogueBoxX,dialogueBoxY,900,150,20,"Hey, you! Thieve!",dialogueBoxImg),new Animation(loadImage("brotherIdle.png"),5,1));
  butler = new Npc(width/2-98,height/2-2,230,230,"butler",new TextBox(dialogueBoxX,dialogueBoxY,900,150,20,"Hey, you! Thieve!",dialogueBoxImg),new Animation(loadImage("butlerIdle.png"),4,1));
  maid = new Npc(width/2-56,height/2+28,200,200,"maid",new TextBox(dialogueBoxX,dialogueBoxY,900,150,20,"Hey, you! Thieve!",dialogueBoxImg),new Animation(loadImage("maidIdle.png"),4,1));
  cat = new Npc(width/2,height/2,100,100,"cat",new TextBox(dialogueBoxX,dialogueBoxY,900,150,20,"Hey, you! Thieve!",dialogueBoxImg),new Animation(loadImage("butlerIdle.png"),4,1));
  
  //initializing inventory
  inventory = new Inventory();
  
  int buttonXOffset = 50;
  int buttonYOffset = 150;
  
  //initializing the items
  /*
  butlerEntree = new Item(loadImage("emptyEntree.png"),200,height/2,50,50,true,new InventoryItem(loadImage("writtenEntree.png"),inventory.posX+30,20 + inventory.posY,true,"butlerEntree"));
  maidEntree = new Item(loadImage("emptyEntree.png"),width - 200, height - 60,50,50,true,new InventoryItem(loadImage("writtenEntree.png"),70 + inventory.posX,20 + inventory.posY,true,"maidEntree"));
  brotherEntree = new Item(loadImage("emptyEntree.png"),width/2, 60, 50,50,true,new InventoryItem(loadImage("writtenEntree.png"),110 + inventory.posX,20 + inventory.posY,true,"brotherEntree"));
  wifeEntree = new Item(loadImage("emptyEntree.png"),width/2, height - 120,50,50,true,new InventoryItem(loadImage("writtenEntree.png"),150 + inventory.posX,20 + inventory.posY,true,"wifeEntree"));
  driedFlower = new Item(loadImage("driedFlower.png"),width/2, height - 180,50,50,false,new InventoryItem(loadImage("driedFlower.png"),inventory.posX+30,80 + inventory.posY,false,"driedFlower"));
  morphine = new Item(loadImage("morphine.png"),width/2, height - 240,50,50,false,new InventoryItem(loadImage("morphine.png"),70 + inventory.posX,80 + inventory.posY,false,"morphine"));
  screwDriver = new Item(loadImage("screwDriver.png"),width/2, height - 300,50,50,false,new InventoryItem(loadImage("screwDriver.png"),110 + inventory.posX,80 + inventory.posY,false,"screwDriver"));
  keyAttic = new Item(loadImage("keyAttic.png"),width/2, height - 360,50,50,false,new InventoryItem(loadImage("keyAttic.png"),150 + inventory.posX,80 + inventory.posY,false,"keyAttic"));
  keyBasement = new Item(loadImage("keyBasement.png"),width/2, height - 420,50,50,false,new InventoryItem(loadImage("keyBasement.png"),30 + inventory.posX,80 + inventory.posY,false,"keyBasement"));
  letter = new Item(loadImage("letter.png"),width/2, height - 480,50,50,false,new InventoryItem(loadImage("letter.png"),30 + inventory.posX,80 + inventory.posY,false,"letter"));
  */
  
  //items = new Item[]{butlerEntree, maidEntree, brotherEntree, wifeEntree, driedFlower, morphine, screwDriver, keyAttic, keyBasement, letter};
  
  //initializing all 11 screens
  startScreen = new Screen(loadImage("entrance.png"), "Main Menu", new TextBox[]{new TextBox(width/2,height*0.33334,250,80,50,"START",loadImage("button.png")),new TextBox(width/2,height*0.66667,250,80,50,"CREDITS",loadImage("button.png"))});
  creditScreen = new Screen(loadImage("creditScreen.png"), "Credits", new TextBox[]{new TextBox(100,500,100,60,25,"MENU",loadImage("menuButton.png"))});
  explanationScreen1 = new Screen(loadImage("explanationScreen1.png"), "Cutscene", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),3)});
  explanationScreen2 = new Screen(loadImage("explanationScreen2.png"), "Cutscene", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),4)});
  explanationScreen3 = new Screen(loadImage("explanationScreen3.png"), "Cutscene", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),5)});
  respawnScreen = new Screen(loadImage("respawnScreen.png"), "Cutscene", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),6)});
  entranceScreen = new Screen(loadImage("entrance.png"), "Entrance", new Arrow[]{new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 8), new Arrow(width/2, 250, radians(-90.0), 7)},new Item[]{butlerEntree, wifeEntree, maidEntree, brotherEntree, driedFlower, morphine, screwDriver},new Npc[]{butler});
  upstairHallScreen = new Screen(loadImage("upstairHall.png"), "Upstairs Hall", new Arrow[]{new Arrow(width/2, height-40, radians(90.0), 6), new Arrow(width-50, height-buttonYOffset, radians(0), 11), new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 13), new Arrow(width/2, 250, radians(-90.0), 10)});
  kitchenScreen = new Screen(loadImage("kitchen.png"), "Kitchen", new Arrow[]{new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 6), new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 9)},new Item[]{keyBasement,keyAttic,letter},new Npc[]{maid});
  basementScreen = new Screen(loadImage("basement.png"), "Basement", new Arrow[]{new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 8)});
  masterBedScreen = new Screen(loadImage("bedroom.png"), "Master Bedroom", new Arrow[]{new Arrow(width/2+70, height-120, radians(120.0), 7)},new Npc[]{wife});
  atticHallScreen = new Screen(loadImage("atticHall.png"), "Attic Hall", new Arrow[]{new Arrow(width-buttonXOffset, buttonYOffset, radians(-45), 12), new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 7)});
  atticScreen = new Screen(loadImage("attic.png"), "Attic", new Arrow[]{new Arrow(buttonXOffset, height-50, radians(125), 11)},new Npc[]{cat});
  hallScreen = new Screen(loadImage("leftHallway.png"), "Hall", new Arrow[]{new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 7), new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 14)});
  livingRoomScreen = new Screen(loadImage("livingRoom.png"), "Living Room", new Arrow[]{new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 13)},new Npc[]{brother});

  screens = new Screen[]{startScreen, creditScreen, explanationScreen1, explanationScreen2, explanationScreen3, respawnScreen, entranceScreen, upstairHallScreen, kitchenScreen, basementScreen, masterBedScreen, atticHallScreen, atticScreen, hallScreen, livingRoomScreen};
}

void draw()
{

  for(int i=0; i<screens.length; i++)
  {
     if(i == currentScreen)
     {
       screens[i].update(); 
       break;
     } 
  }
  
   if(currentScreen >= 6) mainCharacter.update();
  
}

void mouseReleased()
{
  //arrows in the cutscenes and credit screen
  if(currentScreen > 0 && currentScreen < 6)
  {
      try
      {
        for(int i=0; i<screens[currentScreen].arrows.length ; i++)
        {
          screens[currentScreen].arrows[i].clicked = false;
        }
      }
      catch(Exception e){}
  }
  
  //All UI in screens where the player can interact with objects
  if(currentScreen > 5)
  {
    mainCharacter.isMoving = false; 
    if(inventory.clicked) inventory.clicked = false;
    
    //diary entrees
    for(int i=0; i<inventory.diariesInInventory.size(); i++)
    {
     if(inventory.diariesInInventory.get(i).clicked)
     {
       inventory.diariesInInventory.get(i).clicked = false;
     }
    }
    
    //buttons to close diary entrees
    for(int i=0; i<inventory.diariesInInventory.size(); i++)
    {
     if(inventory.diariesInInventory.get(i).closeButton.clicked)
     {
       inventory.diariesInInventory.get(i).closeButton.clicked = false;
     }
      
    }
  }
}
