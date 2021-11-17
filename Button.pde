class Button
{
 float xPos;
 float yPos;
 int boxWidth = 250;
 int boxHeight = 70;
 int[] rgbColor = new int[3];
 String boxText;
 int textSize = 50;
 boolean clicked;
  
  Button(float pXPos, float pYPos, String pBoxText)
  {
    xPos = pXPos;
    yPos = pYPos;
    boxText = pBoxText;
  }
  
  void update()
  {
    if(hover())
    {
      if(boxWidth != 300)
      {
        rgbColor[0] = 120;
        rgbColor[1] = 10;
        rgbColor[2] = 20;
        boxWidth = 300;
        boxHeight = 84;
        textSize = 60;
      }
    }
    else if(boxWidth != 250)
    {
      rgbColor[0] = 0;
      rgbColor[1] = 0;
      rgbColor[2] = 0;
      boxWidth = 250;
      boxHeight = 70;
      textSize = 50;
    }
    
    fill(rgbColor[0],rgbColor[1],rgbColor[2],170);  
    noStroke();
    rect(xPos-boxWidth/2, yPos-boxHeight/2, boxWidth, boxHeight,7); 
    textAlign(CENTER,CENTER);
    textSize(textSize);
    fill(255);
    text(boxText,xPos,yPos-textSize/10);
   
  }
  
  boolean hover()
  {
    if(mouseX >= xPos-boxWidth/2 &&
       mouseX <= xPos+boxWidth/2 &&
       mouseY >= yPos-boxHeight/2 &&
       mouseY <= yPos+boxHeight/2) return true;
     return false;
  }
}
