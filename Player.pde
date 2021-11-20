class Player
{
  boolean isMoving;
  float posX = width/2;
  float posY = height/2;
  float translateX = width/2; 
  float translateY = height/2;
  float nextScreenPosX;
  float nextScreenPosY;
  int playerHeight = 200;
  int playerWidth = 200;
  PImage charImg;
  int spriteWidth;
  int spriteHeight;
  int imageWidth;
  int imageHeight;
  int spritePosX;
  int spritePosY;
  int spriteColumns = 3;
  int spriteRows = 2;
  int currentImg = 0;
  PImage[] images = new PImage[6];
  boolean left;
  
  Player()
  {
   charImg = loadImage("mainChar.png"); 
   spriteWidth = charImg.width;
   spriteHeight = charImg.height;
   imageWidth = spriteWidth/spriteColumns;
   imageHeight = spriteHeight/spriteRows;
   
   for(int i=0; i<images.length; i++)
   {
     spritePosX = i % spriteColumns*imageWidth;
     spritePosY = i / spriteColumns*imageHeight;
     println("posX: "+spritePosX);
     println("posY: "+spritePosY);
     println("imageWidth: "+ imageWidth);
     images[i] = charImg.get(spritePosX,spritePosY,imageWidth,imageHeight);
   }
   
  }
  
  void update() { 

    if (mousePressed && !isMoving) {
      translateX = mouseX - playerWidth/2 + 100;
      translateY = mouseY - playerHeight/2;
      isMoving = true;
    }
    
     pushMatrix();

     if(translateX - posX < 0){
       scale(-1,1);
       left = true;
     }
     else{
       scale(1,1);
       left = false;
     }
     
     

    if (posX != translateX && posY != translateY) 
    {
      posX = lerp(posX, translateX, .04);
      posY = lerp(posY, translateY, .04);
    } 

    if(!left) image(images[currentImg],posX-playerWidth/2,posY,playerWidth,playerHeight);
    else image(images[currentImg],-posX-playerWidth/2,posY,playerWidth,playerHeight);
      
    popMatrix();
    if(frameCount % 7 == 0) nextImg();
    if(currentImg > 5) currentImg = 0; 

  }
  
  void nextImg()
  {
    currentImg++;
  }
  

}
