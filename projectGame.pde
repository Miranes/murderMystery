
//declaring screens
Screen[] screens;
Screen startScreen;
Screen explanationScreen;
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
Item box;
Item rope;
Item knife;
Item fork;
Item phone;
Item pen;
Item pillow;
Item pills;
Item doorKey;
Item matches;

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

String[] fontList = PFont.list();

int currentScreen;

//Keeps track of which of the 6 different story versions the current one is
int storyVersion;


void setup() {
 
  size(1200, 675);
  pixelFont = createFont("pixelFont.ttf",72);
  textFont(pixelFont);


  storyVersion = (int)random(1,7);
  
  currentScreen = 0;
  mainCharacter = new Player();
  
  
  //initializing the items
  box = new Item(200,height/2,50,50,new InventoryItem(loadImage("maid.png"),10,10));
  rope = new Item(width - 200, height - 60,50,50,new InventoryItem(loadImage("maid.png"),10,10));
  knife = new Item(width/2, 60, 50,50,new InventoryItem(loadImage("maid.png"),10,10));
  fork = new Item(width/2, height - 120,50,50,new InventoryItem(loadImage("wife.png"),50,10));
  phone = new Item(width/2, height - 180,50,50,new InventoryItem(loadImage("maid.png"),50,50));
  pen = new Item(width/2, height - 240,50,50,new InventoryItem(loadImage("maid.png"),50,50));
  pillow = new Item(width/2, height - 300,50,50,new InventoryItem(loadImage("maid.png"),50,50));
  pills = new Item(width/2, height - 360,50,50,new InventoryItem(loadImage("maid.png"),50,50));
  doorKey = new Item(width/2, height - 420,50,50,new InventoryItem(loadImage("maid.png"),50,50));
  matches = new Item(width/2, height - 480,50,50,new InventoryItem(loadImage("maid.png"),50,50));
  
  items = new Item[]{box, rope, knife, fork, phone, pen, pillow, pills, doorKey, matches};
  
  //initializing npcs
  wife = new Npc(width/2-38,height/2+28,200,200,"wife.png",new TextBox(width/2+260,height/2,180,40,20,"Hey, you! Thieve!"));
  brother = new Npc(width/2+18,height/2-2,230,230,"brother.png",new TextBox(width/2+260,height/2,180,40,20,"Hey, you! Thieve!"));
  butler = new Npc(width/2+98,height/2-22,250,250,"butler.png",new TextBox(width/2+330,height/2-22,180,40,20,"Hey, you! Thieve!"));
  maid = new Npc(width/2-56,height/2+28,200,200,"maid.png",new TextBox(width/2+200,height/2,180,40,20,"Hey, you! Thieve!"));
  cat = new Npc(width/2,height/2,100,100,new TextBox(width/2+260,height/2,180,40,20,"Hey, you! Thieve!"));
  
  //initializing inventory
  inventory = new Inventory();
  
  int buttonXOffset = 50;
  int buttonYOffset = 150;
  
  //initializing all 11 screens
  startScreen = new Screen(loadImage("entrance.png"), "Main Menu", new TextBox[]{new TextBox(width/2,height*0.33334,250,70,50,"START"),new TextBox(width/2,height*0.66667,250,70,50,"CREDITS")});
  creditScreen = new Screen(loadImage("entrance.png"), "Credits", new Arrow[]{new Arrow(buttonXOffset,height/2,radians(180.0),0)});
  explanationScreen = new Screen(loadImage("entrance.png"), "Explanation", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),3)});
  respawnScreen = new Screen(loadImage("entrance.png"), "Respawn", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),4)});
  entranceScreen = new Screen(loadImage("entrance.png"), "Entrance", new Arrow[]{new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 6), new Arrow(width/2, 250, radians(-90.0), 5)},new Item[]{knife, fork},new Npc[]{butler});
  upstairHallScreen = new Screen(loadImage("upstairHall.png"), "Upstairs Hall", new Arrow[]{new Arrow(width/2, height-40, radians(90.0), 4), new Arrow(width-50, height-buttonYOffset, radians(0), 9), new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 11), new Arrow(width/2, 250, radians(-90.0), 8)});
  kitchenScreen = new Screen(loadImage("kitchen.png"), "Kitchen", new Arrow[]{new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 4), new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 7)},new Npc[]{maid});
  basementScreen = new Screen(loadImage("basement.png"), "Basement", new Arrow[]{new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 6)});
  masterBedScreen = new Screen(loadImage("bedroom.png"), "Master Bedroom", new Arrow[]{new Arrow(width/2, height-50, radians(90.0), 5)},new Npc[]{wife});
  atticHallScreen = new Screen(loadImage("atticHall.png"), "Attic Hall", new Arrow[]{new Arrow(width-buttonXOffset, buttonYOffset, radians(-45), 10), new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 5)});
  atticScreen = new Screen(loadImage("attic.png"), "Attic", new Arrow[]{new Arrow(buttonXOffset, height-50, radians(125), 9)},new Npc[]{cat});
  hallScreen = new Screen(loadImage("leftHallway.png"), "Hall", new Arrow[]{new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 5), new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 12)});
  livingRoomScreen = new Screen(loadImage("livingRoom.png"), "Living Room", new Arrow[]{new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 11)},new Npc[]{brother});

  screens = new Screen[]{startScreen, creditScreen, explanationScreen, respawnScreen, entranceScreen, upstairHallScreen, kitchenScreen, basementScreen, masterBedScreen, atticHallScreen, atticScreen, hallScreen, livingRoomScreen};
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
  
  if(currentScreen >= 4) mainCharacter.update();
  
}

void mouseReleased()
{
  try
  {
    for(int i=0; i<screens[currentScreen].arrows.length ; i++)
    {
      screens[currentScreen].arrows[i].clicked = false;
    }
  }
  catch(Exception e){}
  mainCharacter.isMoving = false; 
}
