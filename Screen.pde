class Screen {
  PImage backgroundImg;
  String screen;
  Arrow[] arrows;
  Item[] items;
  Button[] buttons;

  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, Item[] pItems){
    backgroundImg = pBackground;
    screen = pScreen;
    arrows = pArrows;
    items = pItems;
  }
  
  Screen(PImage pBackground, String pScreen, Arrow[] pArrows){
    backgroundImg = pBackground;
    screen = pScreen;
    arrows = pArrows;
  }
  
  Screen(PImage pBackground, String pScreen, Button[] pButtons)
  {
    backgroundImg = pBackground;
    screen = pScreen;
    buttons = pButtons;
  }
  Screen(PImage pBackground, String pScreen)
  {
    backgroundImg = pBackground;
    screen = pScreen;
  }
  void update() {
    background(backgroundImg);
    textSize(32);
    textAlign(CENTER,CENTER);
    text(screen, width/2, 30); 
    if(buttons != null)
    {
      for(int i=0; i<buttons.length; i++)
      {
         buttons[i].update(); 
         if(mousePressed && buttons[i].hover() && !buttons[i].clicked)
         {
          if(i == 0) currentScreen = 2;
          else currentScreen = 1;
         }
      }
    }
    if(arrows != null)
    {
      for(int i=0; i<arrows.length; i++)
      {
        arrows[i].update();
        if(currentScreen == 2 && mousePressed && arrows[i].hoverMouse() && !arrows[i].clicked)
        {
          currentScreen = 3;
          arrows[i].clicked = true;
          respawnScreen.arrows[i].clicked = true;
        }
        else if(currentScreen == 3 && mousePressed && arrows[i].hoverMouse() && !arrows[i].clicked)
        {
          currentScreen = 4;
          arrows[i].clicked = true;
          mainCharacter.isMoving = true;
        }
      }
    }
    if(items != null) for(int i=0; i<items.length;i++)items[i].update();
  }
  
}
