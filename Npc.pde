class Npc
{
  float posX;
  float posY;
  int npcWidth;
  int npcHeight;
  String npcImgName;
  TextBox dialogue;
  Animation npcAnimation;
  boolean clicked;
  String futureText;

  Npc(float pPosX, float pPosY, int pNpcWidth, int pNpcHeight, String pNpcImgName, TextBox pDialogue, String pFutureText,  Animation pNpcAnimation)
  {
     posX = pPosX;
     posY = pPosY;
     npcWidth = pNpcWidth;
     npcHeight = pNpcHeight;
     npcImgName = pNpcImgName;
     dialogue = pDialogue;
     futureText = pFutureText;
     npcAnimation = pNpcAnimation;
     npcAnimation.posX = pPosX;
     npcAnimation.posY = pPosY;
     npcAnimation.npcImgWidth = pNpcWidth;
     npcAnimation.npcImgHeight = pNpcHeight;
  }
  
  void update()
  {
    try
    {
      npcAnimation.update();
    }
    catch(Exception e)
    {
      rect(posX,posY,npcWidth,npcHeight);
    }
    
    if(hover() )//&& mousePressed && !clicked)
    {
     //clicked = true;
     dialogue.boxText = futureText;
    }
    else
    {
       dialogue.boxText = "hey";
    }
    dialogue.update();
  }
  
  boolean hover()
  {
    if(mouseX >= posX-200 &&
       mouseX <= posX+npcWidth-400 &&
       mouseY >= posY &&
       mouseY <= posY+npcHeight) return true;
    return false; 
  }
  
}
