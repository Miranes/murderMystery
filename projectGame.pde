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

//declaring player
Player mainCharacter;

//keep track of current screen
int currentScreen;


void setup() {
  size(1000, 600);
  
  currentScreen = 2;
  mainCharacter = new Player();
  //initializing all 11 screens
  startScreen = new Screen(color(255,0,0),"Start Screen");
  creditScreen = new Screen(color(0,0,255),"Credits");
  explanationScreen = new Screen(color(0,255,0),"Explanation",new Arrow[]{new Arrow(width/2,50,radians(0.0),3)});
  respawnScreen = new Screen(color(255,0,0),"Respawn",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),2), new Arrow(width/2,50,radians(-90.0),2)});
  entranceScreen = new Screen(color(0,255,0),"Entrance",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),1), new Arrow(width/2,50,radians(-90.0),1)});
  upstairHallScreen = new Screen(color(0,0,255),"Upstairs Hall",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),0), new Arrow(width/2,50,radians(-90.0),0)});
  kitchenScreen = new Screen(color(255,0,0),"Kitchen",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),2), new Arrow(width/2,50,radians(-90.0),2)});
  basementScreen = new Screen(color(0,255,0),"Basement",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),1), new Arrow(width/2,50,radians(-90.0),1)});
  masterBedScreen = new Screen(color(0,0,255),"Master Bedroom",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),0), new Arrow(width/2,50,radians(-90.0),0)});
  atticHallScreen = new Screen(color(255,0,0),"Attic Hall",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),2), new Arrow(width/2,50,radians(-90.0),2)});
  atticScreen = new Screen(color(0,255,0),"Attic",new Arrow[]{new Arrow(width/2,height-100,radians(90.0),1), new Arrow(width/2,50,radians(-90.0),1)});
  
  screens = new Screen[]{startScreen, creditScreen, explanationScreen, respawnScreen, entranceScreen, upstairHallScreen, kitchenScreen, basementScreen, masterBedScreen, atticHallScreen, atticScreen};
}

void draw() {
  
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
