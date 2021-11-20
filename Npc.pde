class Npc
{
  float posX;
  float posY;
  int npcWidth;
  int npcHeight;
  String npcImgPath;
  PImage npcImg;
  TextBox dialog;
  
  Npc(float pPosX, float pPosY, int pNpcWidth, int pNpcHeight, TextBox pDialog)
  {
     this(pPosX,pPosY,pNpcWidth,pNpcHeight,"",pDialog);
  }
  Npc(float pPosX, float pPosY, int pNpcWidth, int pNpcHeight, String pNpcImgPath, TextBox pDialog)
  {
     posX = pPosX;
     posY = pPosY;
     npcWidth = pNpcWidth;
     npcHeight = pNpcHeight;
     npcImgPath = pNpcImgPath;
     npcImg = loadImage(npcImgPath);
     dialog = pDialog;
  }
  
  void update()
  {
    try
    {
      image(npcImg,posX,posY, npcWidth, npcHeight);
    }
    catch(Exception e)
    {
      rect(posX,posY,npcWidth,npcHeight);
    }
    dialog.update();
  }
  
}
