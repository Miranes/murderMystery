class Screen {
  PImage backgroundImg;
  PImage screenNameBckg;
  String screen;
  Arrow[] arrows;
  Item[] items;
  TextBox[] textboxes;
  TextBox menu;
  Npc[] npcs = null;
  boolean locked;

  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, Item[] pItems, Npc[] pNpcs, boolean pLocked){
    backgroundImg = pBackground;
    screen = pScreen;
    arrows = pArrows;
    items = pItems;
    npcs = pNpcs;
    locked = pLocked;
    screenNameBckg = loadImage("menuButton.png");
    //float pXPos, float pYPos, int pBoxWidth, int pBoxHeight, int pTextSize, String pBoxText, PImage pBoxIm
    menu = new TextBox(100,50,100,60,25,"MENU",loadImage("menuButton.png"));
  }
  
  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, Npc[] pNpcs, boolean pLocked)
  {
    this(pBackground,pScreen,pArrows,null,pNpcs, pLocked);
  }
  
  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, boolean pLocked)
  {
    this(pBackground,pScreen,pArrows,null,null, pLocked);
  }
  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, Item[] pItems, boolean pLocked)
  {
    this(pBackground,pScreen,pArrows,pItems,null,pLocked);
  }
  
  Screen(PImage pBackground, String pScreen, TextBox[] pTextboxes, boolean pLocked)
  {
    
    this(pBackground,pScreen,null,null,null,pLocked);
    textboxes = pTextboxes;
  }
  
  Screen(PImage pBackground, String pScreen, boolean pLocked)
  {
    this(pBackground,pScreen,null,null,null,pLocked);
  }
  
  void update() {
    image(backgroundImg,0,0,width,height);
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
    
    if(currentScreen >= 6)
    {
        
      if(!inventory.open)
      {
        if(inventory.buttons[0].hover())
        {
          if(inventory.buttons[0].boxWidth != 110)
          {
            inventory.buttons[0].boxWidth = 110;
            inventory.buttons[0].boxHeight = 94;
          }
        }
        else
        {
          inventory.buttons[0].boxWidth = 100;
          inventory.buttons[0].boxHeight = 84;
        }
      }
      else
      {
        if(inventory.buttons[1].hover())
        {
            if(inventory.buttons[1].boxWidth != 40)
            {
              inventory.buttons[1].boxWidth = 40;
              inventory.buttons[1].boxHeight = 40;
              inventory.buttons[1].textSize = 43;
            }
        }
        else
        {
           if(inventory.buttons[1].boxWidth != 35)
           {
             inventory.buttons[1].boxWidth = 35;
             inventory.buttons[1].boxHeight = 35;
             inventory.buttons[1].textSize = 39;
           }
        }
      }
      inventory.update();
    }
    if(currentScreen > 0)
    {
      if(menu.hover())
      {
        if(menu.boxWidth != 110)
        {
          menu.boxWidth = 110;
          menu.boxHeight = 70;
          menu.textSize = 30;
        }
        if(mousePressed &&!menu.clicked) currentScreen = 0;
      }
      else
      {
       if(menu.boxWidth != 100)
       {
         menu.boxWidth = 100;
         menu.boxHeight = 60;
         menu.textSize = 25;
       }
      }
      menu.update();
    }
  }
  
}
