class Screen {
  //PImame backgroundImg;
  color background;
  String screen;
  Arrow[] arrows;
  Item[] items;

  Screen(color pBackground, String pScreen, Arrow[] pArrows, Item[] pItems){
    background = pBackground;
    screen = pScreen;
    arrows = pArrows;
    items = pItems;
  }
  
  Screen(color pBackground, String pScreen, Arrow[] pArrows){
    background = pBackground;
    screen = pScreen;
    arrows = pArrows;
  }
  
  Screen(color pBackground, String pScreen)
  {
    background = pBackground;
    screen = pScreen;
  }
  void update() {
    background(background);
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
