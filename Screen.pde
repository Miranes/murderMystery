class Screen {
  PImame backgroundImg;
  String screen;
  Arrow[] arrows;
  Item[] items;

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
  
  Screen(PImage pBackground, String pScreen)
  {
    backgroundImg = pBackground;
    screen = pScreen;
  }
  void update() {
    background(backgroundImg);
    textSize(32);
    text(screen, 10, 30); 
    if(arrows != null)
    {
      for(int i=0; i<arrows.length; i++)
      {
        arrows[i].update();
      }
    }
    if(items != null) for(int i=0; i<items.length;i++)items[i].update();
  }
  
  void startScreen()
  {
    
  }

}
