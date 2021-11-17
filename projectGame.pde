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

//declaring player
Player mainCharacter;

Item[] inventory;

int currentScreen;

//Keeps track of which of the 6 different story versions the current one is
int storyVersion;


void setup() {
  size(1000, 600);
  
  storyVersion = (int)random(1,7);
  
  currentScreen = 0;
  mainCharacter = new Player();
  
  //initializing the items
  box = new Item(200,height/2,50,50);
  rope = new Item(width - 200, height - 60,50,50);
  knife = new Item(width/2, 60, 50,50);
  fork = new Item(width/2, height - 120,50,50);
  phone = new Item(width/2, height - 180,50,50);
  pen = new Item(width/2, height - 240,50,50);
  pillow = new Item(width/2, height - 300,50,50);
  pills = new Item(width/2, height - 360,50,50);
  doorKey = new Item(width/2, height - 420,50,50);
  matches = new Item(width/2, height - 480,50,50);
  
  items = new Item[]{box, rope, knife, fork, phone, pen, pillow, pills, doorKey, matches};
  
  int buttonXOffset = 50;
  int buttonYOffset = 150;
  
  //initializing all 11 screens
  startScreen = new Screen(loadImage("startScreen.png"), "Start Screen", new Button[]{new Button(width/2,height*0.33334,"START"),new Button(width/2,height*0.66667,"CREDITS")});
  creditScreen = new Screen(loadImage("creditScreen.png"), "Credits");
  explanationScreen = new Screen(loadImage("explanationScreen.png"), "Explanation", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),3)});
  respawnScreen = new Screen(loadImage("respawnScreen.png"), "Respawn", new Arrow[]{new Arrow(width-buttonXOffset,height/2,radians(0),4)});
  entranceScreen = new Screen(loadImage("entranceScreen.png"), "Entrance", new Arrow[]{new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 6), new Arrow(width/2, 250, radians(-90.0), 5)});
  upstairHallScreen = new Screen(loadImage("upstairHallScreen.png"), "Upstairs Hall", new Arrow[]{new Arrow(width/2, height-40, radians(90.0), 4), new Arrow(width-50, height-buttonYOffset, radians(0), 9), new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 11), new Arrow(width/2, 250, radians(-90.0), 8)});
  kitchenScreen = new Screen(loadImage("kitchenScreen.png"), "Kitchen", new Arrow[]{new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 4), new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 7)});
  basementScreen = new Screen(loadImage("basementScreen.png"), "Basement", new Arrow[]{new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 6)});
  masterBedScreen = new Screen(loadImage("masterBedScreen.png"), "Master Bedroom", new Arrow[]{new Arrow(width/2, height-50, radians(90.0), 5)});
  atticHallScreen = new Screen(loadImage("atticHallScreen.png"), "Attic Hall", new Arrow[]{new Arrow(width-buttonXOffset, buttonYOffset, radians(-45), 10), new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 5)});
  atticScreen = new Screen(loadImage("atticScreen.png"), "Attic", new Arrow[]{new Arrow(buttonXOffset, height-50, radians(125), 9)});
  hallScreen = new Screen(loadImage("hallScreen.png"), "Hall", new Arrow[]{new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 5), new Arrow(buttonXOffset, height-buttonYOffset, radians(180), 12)});
  livingRoomScreen = new Screen(loadImage("livingRoomScreen.png"), "Living Room", new Arrow[]{new Arrow(width-buttonXOffset, height-buttonYOffset, radians(0), 11)});

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
 mainCharacter.isMoving = false; 
}
