<<<<<<< HEAD
=======
//trying out pull request
//yep
//yep
//yep
>>>>>>> bca04f69510e290acfc46b814919b620669241e9
//declaring screens
Screen[] screens;
Screen startScreen;
Screen secondScreen;
Screen thirdScreen;
//Screen fourthScreen;
//Screen secondScreen;
//Screen thirdScreen;
//Screen startScreen;
//Screen secondScreen;
//Screen thirdScreen;

<<<<<<< HEAD
=======

>>>>>>> bca04f69510e290acfc46b814919b620669241e9
//keep track of current screen
int currentScreen;

//declaring char
Player mainChar;
void setup() {
  size(1000, 600);
  
  currentScreen = 2;
  player1 = new Player();
  startScreen = new Screen(color(255,0,0),"something",new Arrow[]{new Arrow(width/2,height-100,radians(90.0)), new Arrow(width/2,50,radians(-90.0))});
  secondScreen = new Screen(color(0,255,0),"else",new Arrow[]{new Arrow(width/2,height-100,radians(90.0)), new Arrow(width/2,50,radians(-90.0))});
  thirdScreen = new Screen(color(0,0,255),"bro",new Arrow[]{new Arrow(width/2,height-100,radians(90.0)), new Arrow(width/2,50,radians(-90.0))});

  
  screens = new Screen[]{startScreen, secondScreen, thirdScreen};
}

Player player1;

Screen screen1;

//Screen screen2; 
//Screen screen3; 

void draw() {
  
  for(int i=0; i<screens.length; i++)
  {
   if(i == currentScreen) screens[i].update(); 
  }
  
  player1.update();
  
}
