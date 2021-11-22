class Npc
{
  float posX;
  float posY;
  int npcWidth;
  int npcHeight;
  String npcImgName;
  TextBox dialogue;
  Animation npcAnimation;
  

  Npc(float pPosX, float pPosY, int pNpcWidth, int pNpcHeight, String pNpcImgName, TextBox pDialogue,  Animation pNpcAnimation)
  {
     posX = pPosX;
     posY = pPosY;
     npcWidth = pNpcWidth;
     npcHeight = pNpcHeight;
     npcImgName = pNpcImgName;
     dialogue = pDialogue;
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
    dialogue.update();
  }
  
}
