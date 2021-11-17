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
  startScreen = new Screen(color(255,0,0),"Start Screen");
  creditScreen = new Screen(color(0,0,255),"Credits");
  explanationScreen = new Screen(color(0,255,0),"Explanation",new Arrow[]{new Arrow(width - 50,height/2,radians(0.0),3)},new Item[]{items[0],items[1]});
  respawnScreen = new Screen(color(255,0,0),"Respawn",new Arrow[]{new Arrow(width - 50,height/2,radians(0.0),4)}, new Item[]{items[2],items[3],items[4]});
  entranceScreen = new Screen(color(0,255,0),"Entrance",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),5), new Arrow(width/2,50,radians(-90.0),6)});
  upstairHallScreen = new Screen(color(0,0,255),"Upstairs Hall",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),0), new Arrow(width/2,50,radians(-90.0),0)});
  kitchenScreen = new Screen(color(255,0,0),"Kitchen",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),2), new Arrow(width/2,50,radians(-90.0),2)});
  basementScreen = new Screen(color(0,255,0),"Basement",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),1), new Arrow(width/2,50,radians(-90.0),1)});
  masterBedScreen = new Screen(color(0,0,255),"Master Bedroom",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),0), new Arrow(width/2,50,radians(-90.0),0)});
  atticHallScreen = new Screen(color(255,0,0),"Attic Hall",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),2), new Arrow(width/2,50,radians(-90.0),2)});
  atticScreen = new Screen(color(0,255,0),"Attic",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),1), new Arrow(width/2,50,radians(-90.0),1)});
  
  screens = new Screen[]{startScreen, creditScreen, explanationScreen, respawnScreen, entranceScreen, upstairHallScreen, kitchenScreen, basementScreen, masterBedScreen, atticHallScreen, atticScreen};
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
