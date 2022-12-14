class BossEnemy extends BasicEnemy
{
//Fields
//Inherited from character class 
  
int HP = 6;
int hitTimer;
  
  
//Methods
void update()
{
move();
checkWalls(); 

if (deathTimer > 0) deathTimer--;
}


boolean bossEnemyCollision(player player)
{
 return (abs((pos.x) - (player.pos.x)) < (110/2 + 110/2) && abs((pos.y) - (player.pos.y)) < (85/2 + 85/2));  
}

void dead()
{
deathTimer=60;
vel.x = 0;
vel.y = 0;
}



void move()
{
 pos.add(vel);
}


void killed()
{
 BossEnemy.remove(this);
}


void checkWalls()
{
if (pos.y > height + 450)
{
killed();
respawn();
}
}


void respawn()
{
BossEnemy.add(new BossEnemy(new PVector(random(-560, 595), random(-600, -400)), new PVector(0, 1),0,0,0));
}


void setRespawnTimer()
{ 
respawnTimer = 240; //60
}

boolean willRespawn()
{
  return respawnTimer == 0;
}

  
  
  
  
  
//Methods
void drawBossEnemy()
{
  
  
  
pushMatrix(); 
//translate(width/2, height/2);
//rotate(radians(180));
//translate(-640, -360); 
  
  
pushMatrix();
//scale(1.2);
translate(pos.x, pos.y);
  
  
//Arms
pushMatrix();
fill(0, 34, 102);
translate(670 ,330);
rotate(radians(125));
ellipse(0,20,15,60);
fill(255, 255, 77);
arc(0, 35, 13, 30, 0, PI);
popMatrix();

pushMatrix();
fill(0, 34, 102);
translate(605 ,360);
rotate(radians(60));
ellipse(0,20,15,60);
fill(255, 255, 77);
arc(0, 35, 13, 30, 0, PI);
popMatrix();

  
//Body
stroke(0);
fill(0, 34, 102);
ellipse(630, 356, 110, 80); //85 height before

//Mask
fill(0, 17, 51);
quad(595, 325, 575, 350, 685, 350,  665, 325);

pushMatrix();
translate(614 ,361);
rotate(radians(130));
arc(0, 35, 32, 10, 0, PI);
popMatrix();

pushMatrix();
translate(647 ,361);
rotate(radians(-130));
arc(0, 35, 32, 10, 0, PI);
popMatrix();


//Goggles
fill(204, 204, 204);
ellipse(617,335,25,15);
ellipse(643,335,25,15);
ellipse(600,344,20,12);
ellipse(660,344,20,12);


stroke(0);

fill(0, 204, 0);
ellipse(617,328,25,15);
ellipse(643,328,25,15);
ellipse(600,337,20,12);
ellipse(660,337,20,12);

strokeWeight(2);
//stroke(179, 179, 179);
//line(609, 344, 609, 337);
//line(592, 344, 592, 337);
//line(669, 344, 669, 337);
//line(651, 344, 651, 337);


fill(128, 85, 0);
rect(617.5, 350, 25, 46);
popMatrix();
popMatrix();

}





void drawDeadBossEnemy()
{
  
pushMatrix();
//scale(1.2);
translate(pos.x,pos.y); 

  
//Legs
stroke(0);
fill(0, 34, 102);
rect(585,200,40,100,100);  
rect(635,210,40,90,100);  

//Body
stroke(0);
fill(0, 34, 102);
ellipse(630, 335, 90, 150);

//Belt
pushMatrix();
translate(0,-30);
fill(255, 255, 77);
quad(615, 260, 600, 270, 625, 340, 630, 330);
quad(640, 275, 655, 285, 635, 340, 630, 330);
quad(592, 325, 587, 340, 673, 340, 669, 325);
rect(615, 322.5, 30, 20, 100);
popMatrix();
  
//Arms
pushMatrix();
stroke(0);
fill(0, 34, 102);
translate(670 ,350);
rotate(radians(200));
ellipse(0,20,25,90);
fill(255, 255, 77);
stroke(0);
arc(0, 45, 21, 40, 0, PI);
popMatrix();

pushMatrix();
stroke(0);
fill(0, 34, 102);
translate(610 ,350);
rotate(radians(250));
ellipse(0,20,25,90);
fill(255, 255, 77);
stroke(0);
arc(0, 45, 21, 40, 0, PI);
popMatrix();


//Head
pushMatrix();
fill(0, 34, 102);
arc(630, 386, 110, 90 , radians(0) ,radians(360)); //85 height before
popMatrix(); 


//Mask
pushMatrix();
translate(0,60);
fill(0, 17, 51);
quad(577, 315, 592, 358, 668, 358, 683, 315);
popMatrix();

//Goggles
stroke(0);
fill(0, 204, 0);
ellipse(617,390,25,25);
ellipse(643,390,25,25);
ellipse(600,405,20,20);
ellipse(660,405,20,20);

fill(128, 85, 0);
rect(618.5, 418, 25, 13);


//Mouth
noFill();
stroke(0);
strokeWeight(1.5); 

popMatrix();
}



//Constructor
BossEnemy(PVector pos, PVector vel, float HP, float width, float height)
{
super(pos, vel, 0, 0, 0);
}
  
  
  
}
