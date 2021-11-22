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
  
  currentScreen = 6;
  mainCharacter = new Player();
    
  //initializing the items
  box = new Item(200,height/2,50,50,new InventoryItem(loadImage("brother.png"),20 +950,height/2-30 -270));
  rope = new Item(width - 200, height - 60,50,50,new InventoryItem(loadImage("butler.png"),60 +950,height/2-30 -270));
  knife = new Item(width/2, 60, 50,50,new InventoryItem(loadImage("maid.png"),100 +950,height/2-30 -270));
  fork = new Item(width/2, height - 120,50,50,new InventoryItem(loadImage("wife.png"),140 +950,height/2-30 -270));
  phone = new Item(width/2, height - 180,50,50,new InventoryItem(loadImage("brother.png"),20 +950,height/2+30-270));
  pen = new Item(width/2, height - 240,50,50,new InventoryItem(loadImage("butler.png"),60 +950,height/2+30 -270));
  pillow = new Item(width/2, height - 300,50,50,new InventoryItem(loadImage("maid.png"),100 +950,height/2+30 -270));
  pills = new Item(width/2, height - 360,50,50,new InventoryItem(loadImage("wife.png"),140 +950,height/2+30 -270));
  doorKey = new Item(width/2, height - 420,50,50,new InventoryItem(loadImage("brother.png"),50 +950,50 -270));
  matches = new Item(width/2, height - 480,50,50,new InventoryItem(loadImage("butler.png"),50 +950,50 -270));
  
  items = new Item[]{box, rope, knife, fork, phone, pen, pillow, pills, doorKey, matches};
  //float pXPos, float pYPos, int pBoxWidth, int pBoxHeight, int pTextSize, String pBoxText, PImage pBoxImg
  
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
  
  //initializing all 11 screens
  startScreen = new Screen(loadImage("entrance.png"), "Main Menu", new TextBox[]{new TextBox(width/2,height*0.33334,250,80,50,"START",loadImage("button.png")),new TextBox(width/2,height*0.66667,250,80,50,"CREDITS",loadImage("button.png"))});
  creditScreen = new Screen(loadImage("creditScreen.png"), "Credits", new Arrow[]{new Arrow(buttonXOffset,height/2,radians(180.0),0)});
  explanationScreen1 = new Screen(loadImage("explanationScreen1.png"), "Explanation", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),3)});
  explanationScreen2 = new Screen(loadImage("explanationScreen2.png"), "Explanation", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),4)});
  explanationScreen3 = new Screen(loadImage("explanationScreen3.png"), "Explanation", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),5)});
  respawnScreen = new Screen(loadImage("respawnScreen.png"), "Respawn", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),6)});
  entranceScreen = new Screen(loadImage("entrance.png"), "Entrance", new Arrow[]{new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 8), new Arrow(width/2, 250, radians(-90.0), 7)},new Item[]{knife, fork, box, rope, phone, pen, pillow, pills},new Npc[]{butler});
  upstairHallScreen = new Screen(loadImage("upstairHall.png"), "Upstairs Hall", new Arrow[]{new Arrow(width/2, height-40, radians(90.0), 6), new Arrow(width-50, height-buttonYOffset, radians(0), 11), new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 13), new Arrow(width/2, 250, radians(-90.0), 10)});
  kitchenScreen = new Screen(loadImage("kitchen.png"), "Kitchen", new Arrow[]{new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 6), new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 9)},new Npc[]{maid});
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
  try
  {
    for(int i=0; i<screens[currentScreen].arrows.length ; i++)
    {
      screens[currentScreen].arrows[i].clicked = false;
    }
  }
  catch(Exception e){}
  mainCharacter.isMoving = false; 
  if(inventory.clicked) inventory.clicked = false;
}
