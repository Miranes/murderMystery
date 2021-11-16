class Arrow
{
 float xPos;
 float yPos;
 int arrowWidth = 50;
 int arrowHeight = 50;
 float rotation;
 PImage arrow;
 
 Arrow(float pXPos, float pYPos, float pRotation)
 {
   xPos = pXPos;
   yPos = pYPos; 
   arrow = loadImage("arrow.png");
   rotation = pRotation;
 }
  
 void update()
 {
   pushMatrix();
   translate(xPos,yPos);
   rotate(rotation);
   image(arrow,0,0,50,50);
   popMatrix();
 }
  
boolean hover()
{
  return false;
}
  
}
