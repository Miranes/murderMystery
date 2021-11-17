class Screen {
  //PImame backgroundImg;
  color background;
  String screen;
  Arrow[] arrows;

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
    rect(width/2-25,height/2-25,50,50);
    if(arrows != null)
    {
      for(int i=0; i<arrows.length; i++)
      {
        arrows[i].update();
      }
    }
  }
  
  void startScreen()
  {
    
  }

}
