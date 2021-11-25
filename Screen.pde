class Screen {
  PImage backgroundImg;
  PImage screenNameBckg;
  String screen;
  Arrow[] arrows;
  Item[] items;
  TextBox[] textboxes;
  TextBox menu;
  TextBox chooseButton;
  Npc[] npcs = null;
  boolean locked;

  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, Item[] pItems, Npc[] pNpcs, boolean pLocked){
    backgroundImg = pBackground;
    screen = pScreen;
    arrows = pArrows;
    items = pItems;
    npcs = pNpcs;
    locked = pLocked;
    screenNameBckg = loadImage("roomName.png");
    //back to menu buttons
    menu = new TextBox(100,80,130,75,33,"MENU",loadImage("menuButton.png"));
    //choosing murderer button
    chooseButton = new TextBox(width/2,height/2,300,300,loadImage("menuButton.png"));
    
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
  
  Screen(PImage pBackground, Item[] pItems, boolean pLocked)
  {
    this(pBackground,null,null,pItems,null,pLocked);
  }
  
  void update() {
    image(backgroundImg,0,0,width,height);
    if(currentScreen < 15)
    {
      textSize(44);
      textAlign(CENTER,CENTER);
      image(screenNameBckg, width/2-145,30,290,100);
      text(screen, width/2, 75); 
    }  
    
      if(currentScreen == 0)
      {
        for(int i=0; i<textboxes.length; i++)
        {
           //hovering over start screen's buttons
           if(textboxes[i].hover())
           {
             if(textboxes[i].boxWidth != 300)
              {
                textboxes[i].boxWidth = 450;
                textboxes[i].boxHeight = 144;
                textboxes[i].textSize = 90;
              }
              if(mousePressed && !textboxes[i].clicked)
              {
                if(i == 0) currentScreen = 2;
                else if(i == 1) currentScreen = 1;
                else currentScreen = 18;
              }
           }
           else if(textboxes[i].boxWidth != 250)
            {
              textboxes[i].boxWidth = 375;
              textboxes[i].boxHeight = 120;
              textboxes[i].textSize = 75;
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
    
    if(currentScreen > 5 && currentScreen < 15)
    { 
        if(!inventory.open)
        {
          if(inventory.buttons[0].hover())
          {
            if(inventory.buttons[0].boxWidth != 110)
            {
              inventory.buttons[0].boxWidth = 165;
              inventory.buttons[0].boxHeight = 135;
            }
          }
          else
          {
            inventory.buttons[0].boxWidth = 150;
            inventory.buttons[0].boxHeight = 115;
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
        if(chooseButton.hover() && mousePressed && !chooseButton.clicked)
        {
          currentScreen = 15;
          chooseButton.clicked = true;
        }
        chooseButton.update();
    }
    
    if(currentScreen > 0)
    {
      if(menu.hover())
      {
        if(menu.boxWidth != 150)
        {
          menu.boxWidth = 150;
          menu.boxHeight = 95;
          menu.textSize = 38;
        }
        if(mousePressed &&!menu.clicked) currentScreen = 0;
      }
      else
      {
       if(menu.boxWidth != 130)
       {
         menu.boxWidth = 130;
         menu.boxHeight = 75;
         menu.textSize = 33;
       }
      }
      menu.update();
    }
  }
  
}
