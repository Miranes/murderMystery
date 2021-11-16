//declaring screens
Screen[] screens;
Screen startScreen;
Screen secondScreen;
Screen thirdScreen;
Screen fourthScreen;
Screen secondScreen;
Screen thirdScreen;
Screen startScreen;
Screen secondScreen;
Screen thirdScreen;

//keep track of current screen
int screen;

//declaring char
Player mainChar;
void setup() {
  size(1000, 600);
  
  screen = 0;
  player1 = new Player();
  startScreen = new Screen(color(255,0,0),"something",new Arrow[]{new Arrow(width/2,height-100,radians(90.0)), new Arrow(width/2,50,radians(-90.0)),});
  //secondScreen = new Screen(color(0,255,0),"else");
  //thirdScreen = new Screen(color(0,0,255),"bro");

  
  screens = new Screen[]{startScreen, secondScreen, thirdScreen};
}

Player player1;

Screen screen1;

//Screen screen2; 
//Screen screen3; 

void draw() {
  
  switch(screen)
  {
   case 0:
     screens[0].update();
     break;
   case 1:
     screens[1].update();
     break;
   case 2:
     screens[2].update();
     break;
   case 3:
     screens[3].update();
     break;
  }
  
  player1.update();
  
}
