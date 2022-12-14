//Global Variables

float numBasicEnemy = 5;
float numBossEnemy = 1;
int MaxHP = 5;
PFont font;

float speed = 2;
PVector upMove = new PVector (0, -speed);
PVector downMove = new PVector (0, speed);
PVector leftMove = new PVector (-speed, 0);
PVector rightMove = new PVector (speed, 0);

boolean up, down, left, right;

int respawnTimer = -1;
//int deathTimer = -1;


//Declare all objects/arraylist
ArrayList <character> characters = new ArrayList<character>();
ArrayList <BasicEnemy> BasicEnemy = new ArrayList<BasicEnemy>();
ArrayList <BossEnemy> BossEnemy = new ArrayList<BossEnemy>();
//BossEnemy BossEnemy;

player player;
Score Score;


void setup()
{
  size(1280, 720);
  
  Score = new Score();
  font = loadFont("QuicksandBold-Regular-48.vlw");
  textFont(font);
  textSize(35);
  

  //Initialize arraylist
  addNewCharacter();
   
  //Initialize all objects
  player = new player(new PVector(), new PVector(), 0,0,0);
}

void addNewCharacter()
{ 
for (int i=0; i < numBasicEnemy; i++) //BasicEnemy.length 
  {
   BasicEnemy.add(new BasicEnemy(new PVector(random(-560, 595), random(-600, -400)), new PVector(0,2),0,0,0));
  }
  //560
for (int i=0; i < numBossEnemy; i++) //BasicEnemy.length 
  {
   BossEnemy.add(new BossEnemy(new PVector(random(-560, 595), random(-600, -400)), new PVector(0,1),0,0,0));
  }  
}


void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP) up = true;
    else if (keyCode == DOWN) down = true;
    else if (keyCode == LEFT) left = true;
    else if (keyCode == RIGHT) right = true;
  }
  
  if (key==' ')
  {
   player.fire();
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == UP) up = false;
    else if (keyCode == DOWN) down = false;
    else if (keyCode == LEFT) left = false;
    else if (keyCode == RIGHT) right = false;
  }
} 


void draw()
{
 background();
 Score.scoreBoard();
 Score.drawBasicEnemyScore();
 Score.drawBossEnemyScore();
 Score.drawTotalPointsScore();
 
 Score.drawHPBar();
 
 pushMatrix();
 player.update();
 
 //if (deathTimer == -1)
 //{
 player.drawPlayer(); 
// }
 popMatrix();
 

 //player.drawDeadPlayer();
 
 
 
 
   
 for (int i=0; i<BasicEnemy.size(); i++)
 {
  
  BasicEnemy BasicE = BasicEnemy.get(i);
  BasicE.update();
  //BasicE.setRespawnTimer();
  BasicE.drawBasicEnemy();
  
  //Test collision for Basic Enemy
  if (BasicE.basicEnemyCollision(player))
  {
  player.hit();
  }
  
  //Testing hitbox detection for basic enemy
  pushMatrix(); 
  //translate(width/2, height/2);
  rotate(radians(180));
  //rect(BasicE.pos.x + 580, BasicE.pos.y + 300, 10, 10);
  //rect(BasicE.pos.x - 60, BasicE.pos.y - 50, 100, 100);
  popMatrix();
  
  
  if (respawnTimer > 0)
  {
  respawnTimer--;
  }
 } 
 
 
 for (int i=0; i<BossEnemy.size(); i++)
 { 
   BossEnemy BossE = BossEnemy.get(i);
   BossE.update();
   BossE.drawBossEnemy();
   
   
  //Test collision for Basic Enemy
  if (BossE.bossEnemyCollision(player))
  {
  player.hit();
  }
   
   
   
   if (respawnTimer > 0)
   {
   respawnTimer--;
   } 
 }
//player.followcursor();
}







void addNewEnemy (boolean addBoss)
 {
  if (addBoss == true)
  {
  BasicEnemy.add(new BasicEnemy(new PVector(random(-1200, -45), random(100, 400)), new PVector(0,-3),0,0,0));
  }
  
  if (addBoss == false)
  {
  BossEnemy.add(new BossEnemy(new PVector(random(-1200, -45), random(100, 400)), new PVector(0,-2),0,0,0));
  }
   
 }



void background() 
{
noStroke();
fill(255);
  
//Foreground


fill(148, 184, 184);
rect(0, 0, 1280, 720);
fill(102, 153, 153);
rect(440, 20, 220, 300, 70);
fill(82, 122, 122);
rect(470, 25, 150, 270, 70);

fill(102, 153, 153);
rect(20, 200, 280, 300, 70);
fill(82, 122, 122);
rect(70, 220, 180, 270, 70);

fill(102, 153, 153);
rect(200, 450, 280, 250, 70);
fill(82, 122, 122);
rect(200, 450, 180, 200, 70);


//Ground path
fill(204, 153, 102);
rect(1000, 320, 100, 400);
rect(700, 320, 400, 100);
rect(700, 0, 70, 350);
rect(400, 320, 400, 100);
rect(500, 320, 70, 350);
rect(330, 170, 70, 250);
rect(0, 100, 400, 70);

fill(191, 128, 64);
rect(1015, 340, 70, 370, 100);
rect(345, 330, 740, 80, 100);
}
