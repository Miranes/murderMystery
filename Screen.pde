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
  void update() {
    background(background);
    rect(width/2-25,height/2-25,50,50);
    for(int i=0; i<arrows.length; i++)
    {
      arrows[i].update();
    }
  }
  
}
