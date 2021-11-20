class Screen {
  PImage backgroundImg;
  String screen;
  Arrow[] arrows;
  Item[] items;
  TextBox[] textboxes;
  Npc[] npcs = null;

  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, Item[] pItems, Npc[] pNpcs){
    backgroundImg = pBackground;
    screen = pScreen;
    arrows = pArrows;
    items = pItems;
    npcs = pNpcs;
  }
  
  Screen(PImage pBackground, String pScreen, Arrow[] pArrows, Npc[] pNpcs){
    backgroundImg = pBackground;
    screen = pScreen;
    arrows = pArrows;
    npcs = pNpcs;
  }
  
  Screen(PImage pBackground, String pScreen, Arrow[] pArrows){
    backgroundImg = pBackground;
    screen = pScreen;
    arrows = pArrows;
  }
  
  Screen(PImage pBackground, String pScreen, TextBox[] pTextboxes)
  {
    backgroundImg = pBackground;
    screen = pScreen;
    textboxes = pTextboxes;
  }
  
  void update() {
    background(backgroundImg);
    textSize(32);
    textAlign(CENTER,CENTER);
    text(screen, width/2, 30); 
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
                textboxes[i].rgbColor[0] = 120;
                textboxes[i].rgbColor[1] = 10;
                textboxes[i].rgbColor[2] = 20;
                textboxes[i].boxWidth = 300;
                textboxes[i].boxHeight = 84;
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
              textboxes[i].rgbColor[0] = 0;
              textboxes[i].rgbColor[1] = 0;
              textboxes[i].rgbColor[2] = 0;
              textboxes[i].boxWidth = 250;
              textboxes[i].boxHeight = 70;
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
        else if(currentScreen == 1 && mousePressed && arrows[i].hoverMouse() && !arrows[i].clicked)
        {
         currentScreen = 0;
         arrows[i].clicked = true;
        }
      }
    }
    if(npcs != null)for(int i=0; i<npcs.length; i++)npcs[i].update();
    if(items != null) for(int i=0; i<items.length;i++)items[i].update();
    inventory.update();
  }
  
}
