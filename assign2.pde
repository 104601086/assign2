//You should implement your assign2 here.

final int GAME_START   =0;
final int GAME_PLAYING =1;
final int GAME_LOSE    =2;

int gameState;


int bg1x,bg2x;
int enemyX,enemyY;
int treasureX,treasureY;
int w;
float fighterX,fighterY,speed=5;

PImage start1;
PImage start2;
PImage end1;
PImage end2;
PImage fighter;
PImage enemy;
PImage bg1;
PImage bg2;
PImage hp;
PImage treasure;

boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

void setup () {
  size(640, 480);
  
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  fighter=loadImage("img/fighter.png");
  enemy=loadImage("img/enemy.png");
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  
  //fighter
  fighterX=550;
  fighterY=floor(random(0,400));
  
  //ENEMY
  enemyX=0;
  enemyY=floor(random(20,420));
  
  //treasure
  treasureX=floor(random(0,590));
  treasureY=floor(random(20,425));
  //BG
  bg1x=640;
  bg2x=0;
  
  //hp
 w=0;
 gameState=GAME_START;

}

void draw() {
  switch(gameState){
    case GAME_START:
      image(start2,0,0);
      if(mouseY>360 && mouseY<420 && mouseX>210 && mouseX<450){
         if(mousePressed){
           gameState=GAME_PLAYING;
      }else{
         image(start1,0,0);     
      }
      }
     break;
    
    case GAME_PLAYING:
          //bg
            image(bg1,bg1x-640,0);
            image(bg2,bg2x-640,0);
            bg1x++;
            bg2x++;
            bg1x%=1280;
            bg2x%=1280;
            
          //HP
           fill(255,0,0);
           noStroke();
           rect(16,10,w+40,20);
           image(hp,10,10);
           
            //treasure
            image(treasure,treasureX,treasureY);
            if(treasureX+40>fighterX&&treasureY+40>fighterY && treasureX<fighterX+40&&treasureY<fighterY+40){
              treasureX=floor(random(0,590));
              treasureY=floor(random(20,425));
              w=w+20;
            }else if(w>130){
              w=160;
            }
         
          //fighter
            image(fighter,fighterX,fighterY);
       
            if(upPressed){
            fighterY -=speed;
          }
            if(downPressed){
            fighterY +=speed;
          }
            if(leftPressed){
            fighterX-=speed;
          }
            if(rightPressed){
            fighterX +=speed;
          }
        
          //boundary detection
          if(fighterX>590){
            fighterX=590;
          }
          if(fighterX<0){
            fighterX=0;
          }
          if(fighterY>425){
            fighterY=425;
          }
          if(fighterY<0){
            fighterY=0;
          }
          
       
          
          //enemy
            image(enemy,enemyX,enemyY);
            enemyX+=5;
            if(enemyX>width){
               enemyX%=640;
               enemyY=floor(random(15,350));
            }else if(enemyX+47>fighterX&&enemyY+47>fighterY && enemyX<fighterX+47&&enemyY<fighterY+47){
                enemyX=0;
                enemyY=floor(random(20,420));
                w-=40;
            }else if(w<0){
              gameState=GAME_LOSE;
            }
      break;
        
      case GAME_LOSE:
           image(end2,0,0);
           
           if(mouseY>300 && mouseY<360 && mouseX>210 && mouseX<450){
              if (mousePressed){
             gameState=GAME_PLAYING;
             w=40;
  
               }else{
                 image(end1,0,0);
               }
           }
     break;
  }
  }

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed=true;
        break;
      case DOWN:
        downPressed=true;
        break;
      case LEFT:
        leftPressed=true;
        break;
      case RIGHT: 
        rightPressed=true;
        break;
    }
  }
}
void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed=false;
        break;
      case DOWN:
        downPressed=false;
        break;
      case LEFT:
        leftPressed=false;
        break;
      case RIGHT: 
        rightPressed=false;
        break;
    }
  }
}
