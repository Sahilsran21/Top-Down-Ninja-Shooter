class BasicEnemy extends character
{
//Fields
//Inherited from character class
float diameter = 50;

int HP = 3;


//Methods
void update()
{
move();
checkWalls(); 

if (deathTimer > 0) deathTimer--;
}


void move()
{
 pos.add(vel);
}


void dead()
{
deathTimer = 60;
 vel.x = 0;
 vel.y = 0;
}


void killed()
{ 
BasicEnemy.remove(this);
}



void checkWalls()
{
if (pos.y > height + 450)
{
killed();
respawn();
}
}

boolean basicEnemyCollision(player player)
{
 return (abs((pos.x) - (player.pos.x)) < (110/2 + 110/2) && abs((pos.y) - (player.pos.y)) < (85/2 + 85/2));  
}




void respawn()
{
BasicEnemy.add(new BasicEnemy(new PVector(random(-560, 595), random(-600, -400)), new PVector(0,2),0,0,0));
}


void setRespawnTimer()
{ 
respawnTimer = 240; //60
}

boolean willRespawn()
{
  return respawnTimer == 0;
}



void drawBasicEnemy()
{
pushMatrix(); 
//translate(width/2, height/2);
//rotate(radians(180));
//translate(-640, -360); 
  
pushMatrix();
translate(pos.x, pos.y);


//Arms
pushMatrix();
fill(255, 255, 204);
translate(670 ,330);
rotate(radians(125));
ellipse(0,20,15,60);
fill(223, 191, 159);
arc(0, 35, 13, 30, 0, PI);
popMatrix();

pushMatrix();
fill(255, 255, 204);
translate(605 ,360);
rotate(radians(60));
ellipse(0,20,15,60);
fill(223, 191, 159);
arc(0, 35, 13, 30, 0, PI);
popMatrix();

//Hands
fill(223, 191, 159);

//Body
//noStroke();
fill(230, 230, 0);
arc(630, 357, 110, 85 , radians(180) ,radians(360));
fill(223, 191, 159);
ellipse(630, 350, 70, 70);
stroke(0);
fill(255, 255, 204);
arc(630, 356, 110, 80 , radians(-20) ,radians(200)); //85 height before

//Mask
fill(255, 128, 0);
quad(605, 325, 596, 340, 664, 340,  655, 325);

//Eyes
fill(38, 38, 38);
ellipse(615,330,10,10);
ellipse(645,330,10,10);

popMatrix();
popMatrix();
}
  
  
  
  
void drawBasicDeadEnemy()
{
pushMatrix();
translate(pos.x, pos.y);

  
//Legs
stroke(0);
fill(255, 255, 204);
rect(585,200,40,100,100);  
rect(635,210,40,90,100);  

//Body
stroke(0);
fill(255, 255, 204);
ellipse(630, 335, 90, 150);

//Belt
pushMatrix();
translate(0,-30);
fill(255, 128, 0);
quad(615, 260, 600, 270, 625, 340, 630, 330);
quad(640, 275, 655, 285, 635, 340, 630, 330);
quad(592, 325, 587, 340, 673, 340, 669, 325);
rect(615, 322.5, 30, 20, 100);
popMatrix();
  
//Arms
pushMatrix();
stroke(0);
fill(255, 255, 204);
translate(670 ,350);
rotate(radians(150));
ellipse(0,20,25,90);
fill(223, 191, 159);
stroke(0);
arc(0, 45, 21, 40, 0, PI);
popMatrix();

pushMatrix();
stroke(0);
fill(255, 255, 204);
translate(600 ,350);
rotate(radians(250));
ellipse(0,20,25,90);
fill(223, 191, 159);
stroke(0);
arc(0, 45, 21, 40, 0, PI);
popMatrix();

//Head
pushMatrix();
fill(230, 230, 0);
arc(630, 386, 110, 80 , radians(0) ,radians(360)); //85 height before
popMatrix(); 

//Face
fill(223, 191, 159);
ellipse(630, 390, 70, 70);

//Mask
pushMatrix();
translate(0,55);
fill(255, 128, 0);
quad(596, 325, 596, 340, 664, 340,  664, 325);
popMatrix();

//Head
fill(255, 255, 204);
arc(630, 386, 110, 80 , radians(20) ,radians(160)); //85 height before

//Mouth
noFill();
arc(630, 365, 15, 10, radians(0), radians(180));
stroke(0);
strokeWeight(1.5);

popMatrix();

}
  
  
//Constructor
BasicEnemy(PVector pos, PVector vel, float HP, float width, float height)
{
super(pos, vel, 0, 0, 0);
}
  

  
  
}
