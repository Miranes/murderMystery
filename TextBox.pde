class TextBox
{
 float xPos;
 float yPos;
 int boxWidth;
 int boxHeight;
 int[] rgbColor = new int[3];
 String boxText;
 int textSize;
 boolean clicked;
  
  TextBox(float pXPos, float pYPos, int pBoxWidth, int pBoxHeight, int pTextSize, String pBoxText)
  {
    xPos = pXPos;
    yPos = pYPos;
    boxWidth = pBoxWidth;
    boxHeight = pBoxHeight;
    textSize = pTextSize;
    boxText = pBoxText;
  }
  
  void update()
  {
    
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
