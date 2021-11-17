class Button
{
 float xPos;
 float yPos;
 int boxWidth = 200;
 int boxHeight = 50;
 int[] rgbColor = new int[]{176, 54, 72};
 String boxText;
 int textSize = 40;
  
  Button(float pXPos, float pYPos, String pBoxText)
  {
    xPos = pXPos;
    yPos = pYPos;
    boxText = pBoxText;
  }
  
  void update()
  {
   rect(xPos, yPos, boxWidth, boxHeight); 
   
   text(boxText,xPos,yPos);
  }
}
