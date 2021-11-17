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
  
  currentScreen = 2;
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
  
  //initializing all 11 screens
  int spawnHeight = height-200;
  int spawnLeft = 100;
  int spawnRight = width-100;
  
  currentScreen = 4;
  mainCharacter = new Player();
  //initializing all 11 screens
  startScreen = new Screen(loadImage("startScreen.png"), "Start Screen");
  explanationScreen = new Screen(loadImage("explanationScreen.png"), "Explanation");
  creditScreen = new Screen(loadImage("creditScreen.png"), "Credits");
  respawnScreen = new Screen(loadImage("respawnScreen.png"), "Respawn");
  entranceScreen = new Screen(loadImage("entranceScreen.png"), "Entrance", new Arrow[]{new Arrow(width-100, height-100, radians(0), 6, spawnLeft, spawnHeight), new Arrow(width/2, 250, radians(-90.0), 5, width/2, spawnHeight)});
  upstairHallScreen = new Screen(loadImage("upstairHallScreen.png"), "Upstairs Hall", new Arrow[]{new Arrow(width/2, height-10, radians(90.0), 4, width/2, height/2), new Arrow(width-50, height-150, radians(0), 9, spawnLeft, spawnHeight), new Arrow(50, height-150, radians(180), 11, width-100, spawnHeight), new Arrow(width/2, 250, radians(-90.0), 8, width/2, spawnHeight)});
  kitchenScreen = new Screen(loadImage("kitchenScreen.png"), "Kitchen", new Arrow[]{new Arrow(width/2, height-50, radians(90.0), 4, 400, spawnHeight), new Arrow(width/2, 50, radians(-90.0), 2, 200, spawnHeight)});
  basementScreen = new Screen(loadImage("basementScreen.png"), "Basement", new Arrow[]{new Arrow(width/2, height-100, radians(90.0), 1, 400, spawnHeight), new Arrow(width/2, 50, radians(-90.0), 1, 200, spawnHeight)});
  masterBedScreen = new Screen(loadImage("masterBedScreen.png"), "Master Bedroom", new Arrow[]{new Arrow(width/2, height-100, radians(90.0), 0, 400, spawnHeight), new Arrow(width/2, 50, radians(-90.0), 0, 200, spawnHeight)});
  atticHallScreen = new Screen(loadImage("atticHallScreen.png"), "Attic Hall", new Arrow[]{new Arrow(width-50, 100, radians(-45), 10, width/2, spawnHeight), new Arrow(50, height-150, radians(180), 5, width-100, spawnHeight)});
  atticScreen = new Screen(loadImage("atticScreen.png"), "Attic", new Arrow[]{new Arrow(width/2, 50, radians(-90.0), 9, 200, spawnHeight)});
  hallScreen = new Screen(loadImage("hallScreen.png"), "Hall", new Arrow[]{new Arrow(width/2, 50, radians(-90.0), 9, 200, spawnHeight)});
  livingRoomScreen = new Screen(loadImage("livingRoomScreen.png"), "Living Room", new Arrow[]{new Arrow(width/2, 50, radians(-90.0), 9, 200, spawnHeight)});

  screens = new Screen[]{startScreen, explanationScreen, creditScreen, respawnScreen, entranceScreen, upstairHallScreen, kitchenScreen, basementScreen, masterBedScreen, atticHallScreen, atticScreen, hallScreen, livingRoomScreen};
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
  
  
  
  mainCharacter.update();
}

void mouseReleased()
{
 mainCharacter.isMoving = false; 
}
