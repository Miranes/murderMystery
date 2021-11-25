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
Screen chooseMurdererScreen;
Screen wonScreen;
Screen lostScreen;
Screen howToPlay;

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
Item wifePortrait;
Item brotherPortrait;
Item maidPortrait;
Item butlerPortrait;

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

PImage cursorImg;

void setup() {

  size(1920,1080,P2D);
  //fullScreen(P2D);
  
  //Font
  pixelFont = createFont("pixelFont.ttf",72);
  textFont(pixelFont);
  
  //cursor
  cursorImg = loadImage("crosshair.png");
  cursor(cursorImg);

  currentScreen = 0;
  mainCharacter = new Player();
  
  float dialogueBoxX = width/2;
  float dialogueBoxY = height - 80;
  PImage dialogueBoxImg = loadImage("dialogueBox.png");
  
  //initializing npcs
  wife = new Npc(width/2-38,height/2+60,300,300,"wife",new TextBox(dialogueBoxX,dialogueBoxY,1400,220,40,"Hey, you! Thieve!",dialogueBoxImg),new Animation(loadImage("npcs/wifeIdle.png"),6,1));
  brother = new Npc(width-500,height/2+30,330,330,"brother",new TextBox(dialogueBoxX,dialogueBoxY,1400,220,40,"Hey, you! Thieve!",dialogueBoxImg),new Animation(loadImage("npcs/brotherIdle.png"),5,1));
  butler = new Npc(width/2-98,height/2+30,330,330,"butler",new TextBox(dialogueBoxX,dialogueBoxY,1400,220,40,"Hey, you! Thieve!",dialogueBoxImg),new Animation(loadImage("npcs/butlerIdle.png"),4,1));
  maid = new Npc(width/2-56,height/2+60,300,300,"maid",new TextBox(dialogueBoxX,dialogueBoxY,1400,220,40,"Hey, you! Thieve!",dialogueBoxImg),new Animation(loadImage("npcs/maidIdle.png"),4,1));
  cat = new Npc(320,height/2-280,250,250,"cat",new TextBox(dialogueBoxX,dialogueBoxY,1400,220,40,"Hey, you! Thieve!",dialogueBoxImg),new Animation(loadImage("npcs/catIdle.png"),6,1));
  
  //initializing inventory
  inventory = new Inventory();
  
  int buttonXOffset = 50;
  int buttonYOffset = 150;
  
  //item temp imgs variables
  PImage emptyEntree = loadImage("items/emptyEntree.png");
  PImage ButlerEntree = loadImage("items/butlerEntree.png");
  PImage MaidEntree = loadImage("items/maidEntree.png");
  PImage BrotherEntree = loadImage("items/brotherEntree.png");
  PImage WifeEntree = loadImage("items/wifeEntree.png");
  PImage DriedFlower = loadImage("items/driedFlower.png");
  PImage Morphine = loadImage("items/morphine.png");
  PImage ScrewDriver = loadImage("items/screwDriver.png");
  PImage KeyAttic = loadImage("items/keyAttic.png") ;
  PImage KeyBasement = loadImage("items/keyBasement.png");
  PImage Letter = loadImage("items/letter.png");
  PImage WifePortrait = loadImage("items/wifePortrait.png");
  PImage BrotherPortrait = loadImage("items/brotherPortrait.png");
  PImage MaidPortrait = loadImage("items/maidPortrait.png");
  PImage ButlerPortrait = loadImage("items/butlerPortrait.png");
  
  //initializing the items
  butlerEntree = new Item(emptyEntree,width-110,300,50,50,true,new InventoryItem(ButlerEntree,inventory.posX+30,60 + inventory.posY,true,"butlerEntree"));
  maidEntree = new Item(emptyEntree,width/2 + 350, height/2-30,50,50,true,new InventoryItem(MaidEntree,100 + inventory.posX,60 + inventory.posY,true,"maidEntree"));
  brotherEntree = new Item(emptyEntree,width/2-350, height-300, 50,50,true,new InventoryItem(BrotherEntree,170 + inventory.posX,60 + inventory.posY,true,"brotherEntree"));
  wifeEntree = new Item(emptyEntree,width-250, height-220,50,50,true,new InventoryItem(WifeEntree,240 + inventory.posX,60 + inventory.posY,true,"wifeEntree"));
  driedFlower = new Item(DriedFlower,width-280, height - 220,50,50,false,new InventoryItem(DriedFlower,inventory.posX+310,60 + inventory.posY,false,"driedFlower"));
  morphine = new Item(Morphine,width/2-280, height/2+110,50,50,false,new InventoryItem(Morphine,30 + inventory.posX,150 + inventory.posY,false,"morphine"));
  screwDriver = new Item(ScrewDriver,90,height/2+175,50,50,false,new InventoryItem(ScrewDriver,100 + inventory.posX,150 + inventory.posY,false,"screwDriver"));
  keyAttic = new Item(KeyAttic,500, height/2+310,50,50,false,new InventoryItem(KeyAttic,170 + inventory.posX,150 + inventory.posY,false,"keyAttic"));
  keyBasement = new Item(KeyBasement,width/2+500, height/2+150,50,50,false,new InventoryItem(KeyBasement,240 + inventory.posX,150 + inventory.posY,false,"keyBasement"));
  letter = new Item(Letter,width-100, height/2-170,50,50,false,new InventoryItem(Letter,310+ inventory.posX,150 + inventory.posY,false,"letter"));
  wifePortrait = new Item(WifePortrait,width-190, height-220,50,50,false,new InventoryItem(Letter,310+ inventory.posX,150 + inventory.posY,false,"letter"));
  brotherPortrait = new Item(BrotherPortrait,width-190, height-220,50,50,false,new InventoryItem(Letter,310+ inventory.posX,150 + inventory.posY,false,"letter"));
  maidPortrait = new Item(MaidPortrait,width-190, height-220,50,50,false,new InventoryItem(Letter,310+ inventory.posX,150 + inventory.posY,false,"letter"));
  butlerPortrait = new Item(ButlerPortrait,width-190, height-220,50,50,false,new InventoryItem(Letter,310+ inventory.posX,150 + inventory.posY,false,"letter"));
  
  
  items = new Item[]{butlerEntree, maidEntree, brotherEntree, wifeEntree, driedFlower, morphine, screwDriver, keyAttic, keyBasement, letter};
  
  //initializing all 11 screens
  startScreen = new Screen(loadImage("backgrounds/mainMenu.png"), "Main Menu", new TextBox[]{new TextBox(width/2,height*0.33334,375,120,75,"START",loadImage("button.png")),new TextBox(width/2,height*0.66667,375,120,75,"CREDITS",loadImage("button.png")),new TextBox(width/2,height/2,375,120,75,"HOW TO PLAY",loadImage("button.png"))},false);
  creditScreen = new Screen(loadImage("backgrounds/credits.png"), "Credits",false);
  howToPlay = new Screen(loadImage("backgrounds/howToPlay.png"), "User Interface",false);
  explanationScreen1 = new Screen(loadImage("backgrounds/explanation1.png"), "Cutscene", new Arrow[]{new Arrow(width-buttonXOffset-30,height/2,50,50,3)},false);
  explanationScreen2 = new Screen(loadImage("backgrounds/explanation2.png"), "Cutscene", new Arrow[]{new Arrow(width-buttonXOffset-30,height/2,50,50,4)},false);
  explanationScreen3 = new Screen(loadImage("backgrounds/npcLeaving.png"), "Cutscene", new Arrow[]{new Arrow(width-buttonXOffset-30,height/2,50,50,5)},false);
  respawnScreen = new Screen(loadImage("backgrounds/respawnScreen.png"), "Cutscene", new Arrow[]{new Arrow(width-buttonXOffset-30,height/2,50,50,6)},false);
  entranceScreen = new Screen(loadImage("backgrounds/entrance.png"), "Entrance", new Arrow[]{new Arrow(width-325, height/2,200,350, 8), new Arrow(width/2-100, 350,200,50,7)},new Npc[]{butler},false);
  upstairHallScreen = new Screen(loadImage("backgrounds/upstairsHall.png"), "Upstairs Hall", new Arrow[]{new Arrow(width/2-200, height-190,400,25, 6), new Arrow(width-50,150,25,750,11), new Arrow(buttonXOffset,150,25,750,13), new Arrow(width/2, 250,50,50,10)},false);
  kitchenScreen = new Screen(loadImage("backgrounds/kitchen.png"), "Kitchen", new Arrow[]{new Arrow(150,height/2,200,350, 6), new Arrow(width-50,150,25,750,9)},new Item[]{keyBasement},new Npc[]{maid},false);
  basementScreen = new Screen(loadImage("backgrounds/basement.png"), "Basement", new Arrow[]{new Arrow(buttonXOffset,150,25,750, 8)},new Item[]{maidEntree,driedFlower},new Npc[]{cat},true);
  masterBedScreen = new Screen(loadImage("backgrounds/bedroom.png"), "Master Bedroom", new Arrow[]{new Arrow(buttonXOffset, 150,25,750,7)},new Item[]{letter,morphine,wifeEntree},new Npc[]{wife},true);
  atticHallScreen = new Screen(loadImage("backgrounds/atticHall.png"), "Attic Hall", new Arrow[]{new Arrow(width-75, buttonYOffset,50,220, 12), new Arrow(buttonXOffset,150,25,750,7)},false);
  atticScreen = new Screen(loadImage("backgrounds/attic.png"), "Attic", new Arrow[]{new Arrow(width-330,height-400,150,220,11)},new Item[]{butlerEntree,screwDriver},true);
  hallScreen = new Screen(loadImage("backgrounds/leftHall.png"), "Hall", new Arrow[]{new Arrow(width-buttonXOffset, 150,25,750, 7), new Arrow(buttonXOffset, 150,25,750,14)}, new Item[]{keyAttic},false);
  livingRoomScreen = new Screen(loadImage("backgrounds/livingRoom.png"), "Living Room", new Arrow[]{new Arrow(width-buttonXOffset,150,25,750,13)},new Item[]{brotherEntree},new Npc[]{brother},false);
  chooseMurdererScreen = new Screen(loadImage("backgrounds/choosingMurderer.png"),new Item[]{wifePortrait,brotherPortrait,maidPortrait,butlerPortrait},false);
  wonScreen = new Screen(loadImage("backgrounds/wonScreen.png"), "You Won",false);
  lostScreen = new Screen(loadImage("backgrounds/lostScreen.png"), "You Lost",false);

  screens = new Screen[]{startScreen, creditScreen, explanationScreen1, explanationScreen2, explanationScreen3, 
                        respawnScreen, entranceScreen, upstairHallScreen, kitchenScreen, basementScreen, masterBedScreen, 
                        atticHallScreen, atticScreen, hallScreen, livingRoomScreen, chooseMurdererScreen, wonScreen, lostScreen, howToPlay};
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
  
   if(currentScreen > 5 && currentScreen < 15) mainCharacter.update();
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
    if(screens[currentScreen].chooseButton.clicked) screens[currentScreen].chooseButton.clicked = false;
  }
}
