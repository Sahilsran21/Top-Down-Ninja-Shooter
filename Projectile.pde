class projectile
{
 //Fields
 PVector pos, vel;
 PVector dim;
 boolean isAlive;
 
 int deathTimer = -1;
  
  
 //Methods 
 void draw()
 {
  //Draw the bullet projectile
  pushMatrix();
  translate(pos.x, pos.y);
  stroke(0);
  fill(153, 115, 0);
  rect(642.5, 248, 10, 10);
  arc(647, 250, 10, 20, radians(-180), radians(0));
  popMatrix();  
  
  
   //rect(pos.x,pos.y, 200,200);
  //rect(pos.x+642.5, pos.y+248, 10, 20);
  //rect(0, 0, 5, 10);
 } 
  
 void update()
 {
 moveBullet();
 checkWalls();  
 draw();
 }
  
  
 void moveBullet()
 {
   pos.add(vel);
 }
  
  
 void checkWalls()
 {
  if (abs((pos.x+642.5) - width/2) > width/2 ||abs((pos.y - 248) - height/2) > height + 150)
  {
  isAlive = false;
  }
 }
  
  
 void hit(BasicEnemy BasicE)
 {
 if (BasicE.deathTimer == -1 && abs((pos.x) - (BasicE.pos.x)) < (10/2 + 110/2) && abs((pos.y) - (BasicE.pos.y + 50)) < (20/2 + 85/2))
 {
//(640, 360)
 isAlive = false; 
  
 BasicE.HP--;
 BasicE.pos.y -= 40;
 
 if (BasicE.HP == 0)
 {   
  
 //if (deathTimer > 0)
 //{
 BasicE.dead(); 
 BasicE.drawBasicDeadEnemy();

 Score.basicEnemyScoreUpdate(1);
 Score.totalScoreUpdate(1);
 //}
 
 //if (deathTimer == 0)
 //{
 BasicE.killed();
 BasicE.respawn();
 //}
   
 }
 }
 

 
 }
 
 
 
 
 void hit(BossEnemy BossE)
 {
 if (abs((pos.x) - (BossE.pos.x)) < (10/2 + 110/2) && abs((pos.y) - (BossE.pos.y + 50)) < (20/2 + 85/2))
 {
  
 isAlive = false;
 
 BossE.HP--;
 BossE.pos.y -= 40;
 
 if (BossE.HP == 0) 
 {
 BossE.dead();
 BossE.drawDeadBossEnemy();
 deathTimer--;

 Score.bossEnemyScoreUpdate(1);
 Score.totalScoreUpdate(5);
  
 BossE.killed();
 BossE.respawn();
 
 }
 }
 
 
 }
   
  
  
  
 //Constructor
 projectile(PVector pos, PVector vel)
 {
 this.pos = pos;
 this.vel = vel;
 isAlive=true;
 }
 
  
}
