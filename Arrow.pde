class Arrow
{
 float xPos;
 float yPos;
 int arrowWidth = 50;
 int arrowHeight = 50;
 float rotation;
 PImage arrow;
 int transition;
 
 
 Arrow(float pXPos, float pYPos, float pRotation, int pTransition)
 {
   
   transition = pTransition;
   xPos = pXPos;
   yPos = pYPos; 
   arrow = loadImage("arrow.png");
   rotation = pRotation;
 }
  
  //Arrow(float pXPos, float pYPos){
  //xPos = pXPos; 
  //yPos = pYPos; 
  
  
 void update()
 {
   pushMatrix();
   translate(xPos,yPos);
   rotate(rotation);
   image(arrow,-25,-25,50,50);
   popMatrix();
   
   
   if(mainChar.playerPos()[0] > xPos-25 && mainChar.playerPos()[0] < xPos+25 && mainChar.playerPos()[1] >yPos-25 && mainChar.playerPos()[1] < yPos+25){
    
   }
   
   println(mainChar.playerPos()[0]);
   
 }
  
boolean hover()
{
  return false;
}
  
}
