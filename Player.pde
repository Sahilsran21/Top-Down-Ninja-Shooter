class player extends character
{
//Fields
//Inherited from character class

int HP = MaxHP;

ArrayList<projectile> projectiles = new ArrayList<projectile>();

float rotationX, rotationY;
int hitTimer = 0;


//Methods
void followcursor()
{
translate(640, 360); //Moving the point of origin to the center of the character
fill(255, 0, 0);
ellipse(0, 0, 20, 20);

rotationX = map(mouseX - 650 , radians(20), radians(-155), radians(105), radians(80));
rotationY = map(mouseY, radians(30), radians(-70), radians(105), radians(80));


rotate(radians(rotationX));
//rotate(radians(rotationY));

translate(-640, -360);
}



void hit()
{
if(hitTimer == 0)
{
HP--;
hitTimer = 60;

if (HP < 0)
{
  HP = 5;
}
}


}



void fire()
{
projectiles.add(new projectile(new PVector(pos.x, pos.y), new PVector(0, -8)));
}


void killed()
{
  
  
  
}



void respawn()
{
 
}



void checkProjectiles()
{
for (int i=0; i<projectiles.size(); i++) 
{
  projectile bullet = projectiles.get(i);
  bullet.update();
  
  for (int j=0; j<BasicEnemy.size(); j++)
  {
  BasicEnemy BasicE = BasicEnemy.get(j);
  bullet.hit(BasicE);  
  }

 for (int k=0; k<BossEnemy.size(); k++)
  {
  BossEnemy BossE = BossEnemy.get(k);
  bullet.hit(BossE);  
  }

if (!bullet.isAlive) projectiles.remove(i);
}
}



void update()
{
super.update();
checkProjectiles(); 

if (hitTimer>0) hitTimer--;


}








void drawPlayer()
{
  
if (hitTimer %3 == 0)
{
translate(pos.x, pos.y);

pushMatrix();

//Arms
pushMatrix();
fill(0, 0, 51);
translate(665 ,330);
rotate(radians(165));
ellipse(0,20,15,60);
fill(223, 191, 159);
arc(0, 35, 13, 30, 0, PI);
popMatrix();

pushMatrix();
fill(0, 0, 51);
translate(600 ,330);
rotate(radians(225));
ellipse(0,20,18,75);
fill(223, 191, 159);
arc(0, 44, 13, 30, 0, PI);
popMatrix();

//Hands
fill(223, 191, 159);

//Body
noStroke();
fill(0, 0, 51);
ellipse(630, 356, 105, 85);
fill(223, 191, 159);
ellipse(630, 350, 100, 70);

//Eyes
fill(38, 38, 38);
ellipse(610,324,12,12);
ellipse(650,324,12,12);

//Hair
fill(96, 64, 32);
arc(630, 350, 100, 70, 0, PI);
triangle(600, 350, 570, 320, 590, 390);
triangle(610, 350, 580, 345, 605, 395); 
triangle(620, 350, 590, 325, 620, 400); 
triangle(630, 350, 600, 345, 630, 400); 
triangle(640, 350, 610, 330, 640, 400); 
triangle(650, 350, 620, 345, 650, 395); 
triangle(660, 350, 630, 330, 660, 395);  
triangle(670, 350, 640, 345, 670, 390); 
triangle(680, 350, 650, 325, 680, 390); 
triangle(685, 350, 675, 315, 665, 375); 

//Gun
noStroke();
fill(255, 128, 128);
rect(645.5, 180, 4, 80);
stroke(0);
strokeWeight(2);
fill(77, 77, 77);
rect(640, 260, 15, 40, 100);
fill(51, 51, 51);
rect(642.5, 274, 10, 25, 100);


popMatrix();
}
}
  
  
  
void drawDeadPlayer()
{ 
//Legs
stroke(0, 0, 102);
fill(0, 0, 51);
rect(585,200,40,100,100);  
rect(635,210,40,90,100);  
fill(0, 0, 102); 
rect(635, 235, 40, 30, 100);
fill(0, 0, 153);  
rect(635, 243, 40, 15, 100);

//Body
stroke(0, 0, 102);
fill(0, 0, 51);
ellipse(630, 335, 105, 150);

//Gun
noStroke();
stroke(0);
strokeWeight(2);
fill(51, 51, 51);
rect(740, 270, 10, 25, 100);
fill(77, 77, 77);
rect(710, 285, 30, 10, 100);
fill(77, 77, 77);
rect(730, 260, 15, 40, 100);
  
//Arms
pushMatrix();
stroke(0, 0, 102);
fill(0, 0, 51);
translate(685 ,350);
rotate(radians(210));
ellipse(0,20,20,90);
fill(223, 191, 159);
stroke(0);
arc(0, 45, 16, 40, 0, PI);
popMatrix();

pushMatrix();
stroke(0, 0, 102);
fill(0, 0, 51);
translate(600 ,350);
rotate(radians(235));
ellipse(0,20,20,90);
fill(223, 191, 159);
stroke(0);
arc(0, 45, 16, 40, 0, PI);
popMatrix();

//Face
noStroke();
fill(223, 191, 159);
ellipse(630, 385, 100, 80);

//Hair
pushMatrix();
translate(0,40);
fill(96, 64, 32);
arc(630, 350, 100, 70, radians(0), radians(180));

triangle(600, 350, 570, 320, 590, 370);
triangle(610, 350, 580, 345, 605, 370); 
triangle(620, 350, 590, 325, 620, 380); 
triangle(630, 350, 600, 345, 630, 380); 
triangle(640, 350, 610, 330, 640, 380); 
triangle(650, 350, 620, 345, 650, 375); 
triangle(660, 350, 630, 330, 660, 375);  
triangle(670, 350, 640, 345, 670, 370); 
triangle(680, 350, 650, 325, 660, 360); 
triangle(680, 350, 675, 315, 665, 355); 
popMatrix();

//Mouth
fill(255);
arc(630, 355, 22, 18, radians(0), radians(180));
stroke(0);
strokeWeight(1.5);
line(622, 355, 622, 361);
line(627, 355, 627, 363);
line(632, 355, 632, 363);
line(637, 355, 637, 361);
line(620, 358, 639, 358);
}
  


//Constructor
player(PVector pos, PVector vel, float HP, float width, float height)
{
super(pos, vel, HP, width, height);
}
  
  
}
