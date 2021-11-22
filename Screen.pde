class Screen {
  PImage backgroundImg;
  PImage screenNameBckg;
  String screen;
  Arrow[] arrows;
  Item[] items;
  TextBox[] textboxes;
  TextBox menu;
  Npc[] npcs = null;

  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, Item[] pItems, Npc[] pNpcs){
    backgroundImg = pBackground;
    screen = pScreen;
    arrows = pArrows;
    items = pItems;
    npcs = pNpcs;
    screenNameBckg = loadImage("menuButton.png");
    //float pXPos, float pYPos, int pBoxWidth, int pBoxHeight, int pTextSize, String pBoxText, PImage pBoxIm
    menu = new TextBox(100,50,100,60,25,"MENU",loadImage("menuButton.png"));
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
  
  Screen(PImage pBackground, String pScreen)
  {
    this(pBackground,pScreen,null,null,null);
  }
  
  void update() {
    background(backgroundImg);
    textSize(32);
    textAlign(CENTER,CENTER);
    image(screenNameBckg, width/2-122,15,240,80);
    text(screen, width/2, 50); 
    
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
    if(currentScreen > 0)
    {
      if(menu.hover() && mousePressed &&!menu.clicked)
      {
        currentScreen = 0;
      }
      menu.update();
    }
  }
  
}
