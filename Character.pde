//Superclass for all the characters
class character
{ 
 //fields
 PVector pos, vel;
 float HP;
 float width, height;
 
 float damp = 0.8;
 int deathTimer = -1;
 boolean isAlive;
 boolean isDead;
  
 //Methods
 void moveCharacter()
 {
 if (up) player.accelerate(upMove);
 if (down) player.accelerate(downMove);
 if (left) player.accelerate(leftMove);
 if (right) player.accelerate(rightMove); 
 }
 

 
 //Update physics of the player
 void update()
 {
vel.mult(damp);
pos.add(vel);

moveCharacter();
checkWalls();  

 }
 
 
 void accelerate(PVector speed)
 {
 vel.add(speed); 
 }
 

 //Dummy drawCharacter class that holds initial placeholder shape
 void drawCharacter()
 {
 player.drawPlayer(); 
   
   
 
 //BossEnemy.drawBossEnemy();
 //BasicEnemy.drawBasicEnemy();
 }
 
 
 
void dead()
{
deathTimer = 60;
 vel.x = 0;
 vel.y = 0;
}


boolean isDead()
{
  return deathTimer == 0;
}

 
 
 
 
 
 //Character collision detection
 void hitCharacter(player P, BasicEnemy BasicE, BossEnemy BossE)
 {
 if (abs((player.pos.x) - (BasicE.pos.x)) < (10/2 + 110/2) && abs((player.pos.y) - (BasicE.pos.y + 50)) < (20/2 + 85/2))
 {
//(640, 360)

 P.killed();
 P.respawn();
 isAlive = false;
 }
 }
 
 
 
 void decreaseHealth()
 {
   
   
   
   
 }
 
 
 
 void checkWalls()
 {
  //Statement to have object appear on other side of screen if it surpasses horizontal screen boundaries
    if (pos.x > 720) 
    {
      pos.x = -640 ;
    }
    if (pos.x < -720) 
    {
      pos.x = 660;
    }
    
   //Same collision detection for vertical screen boundaries
    if (pos.y > 460) 
    {
      pos.y = -420;
    }
    if (pos.y < -420) 
    {
      pos.y = 400;
    } 
 }
 
 


 
 
 
 //Constructor
 character(PVector pos, PVector vel, float HP, float width, float height)
 {
 this.HP = HP;
 this.width = width;
 this.height = height;
 this.pos = pos;
 this.vel = vel;
 //vel = new PVector();
 }
 
  
}
