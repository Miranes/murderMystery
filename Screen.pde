class Screen {
  PImage backgroundImg;
  PImage screenNameBckg;
  String screen;
  Arrow[] arrows;
  Item[] items;
  TextBox[] textboxes;
  Npc[] npcs = null;
  int amountLetters;

  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, Item[] pItems, Npc[] pNpcs){
    backgroundImg = pBackground;
    screen = pScreen;
    arrows = pArrows;
    items = pItems;
    npcs = pNpcs;
    screenNameBckg = loadImage("menuButton.png");
    amountLetters = pScreen.length();
  }
  
  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, Npc[] pNpcs)
  {
    this(pBackground,pScreen,pArrows,null,pNpcs);
  }
  
  Screen(PImage pBackground, String pScreen, Arrow[] pArrows)
  {
    this(pBackground,pScreen,pArrows,null,null);
  }
  
  Screen(PImage pBackground, String pScreen, TextBox[] pTextboxes)
  {
    this(pBackground,pScreen,null,null,null);
    textboxes = pTextboxes;
  }
  
  void update() {
    background(backgroundImg);
    textSize(32);
    textAlign(CENTER,CENTER);
    image(screenNameBckg, width/2-amountLetters*20/2,15,amountLetters*19,80);
    text(screen, width/2, 50); 
    if(textboxes != null)
    {
      if(currentScreen == 0)
      {
        for(int i=0; i<textboxes.length; i++)
        {
           //hovering over start screen's buttons
           if(textboxes[i].hover())
           {
             if(textboxes[i].boxWidth != 300)
              {
                textboxes[i].boxWidth = 300;
                textboxes[i].boxHeight = 96;
                textboxes[i].textSize = 60;
              }
              if(mousePressed && !textboxes[i].clicked)
              {
                if(i == 0) currentScreen = 2;
                else currentScreen = 1;
              }
           }
           else if(textboxes[i].boxWidth != 250)
            {
              textboxes[i].boxWidth = 250;
              textboxes[i].boxHeight = 80;
              textboxes[i].textSize = 50;
            }
            
            textboxes[i].update(); 
        }
      }
    }
    if(arrows != null)
    {
      for(int i=0; i<arrows.length; i++)
      {
        arrows[i].update();
      }
    }
    if(npcs != null)for(int i=0; i<npcs.length; i++)npcs[i].update();
    if(items != null) for(int i=0; i<items.length;i++)items[i].update();
    
    if(currentScreen >= 6) inventory.update();
  }
  
}
