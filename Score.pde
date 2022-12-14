class Score
{
//fields
int basicEnemyScore;
int bossEnemyScore;
int totalScore;
  
  
//Methods 
void scoreBoard()
{
 pushMatrix();
 stroke(0);
 fill(255, 255, 204);
 rect(930, 15, 340, 50);
 fill(0, 34, 102);
 rect(815, 65, 455, 50);
 fill(0, 0, 51);
 rect(975, 115, 295, 50);
 popMatrix();
 

 
}


void drawHPBar()
{
int max = 200;


pushMatrix();
fill(255);
rect(910, 165, 360,50);
fill(255,0,0);
float playerHealthPercentage = (float)player.HP/(float)MaxHP;
rect(1070, 165, max*playerHealthPercentage, 50);



popMatrix();

pushMatrix();
fill(153, 0, 0);
text ("Health:  ", 930, 205);  
popMatrix();


}




void basicEnemyScoreUpdate(int point)
{
basicEnemyScore += point;
}

void bossEnemyScoreUpdate(int point)
{
bossEnemyScore += point;
}  

void totalScoreUpdate(int point)
{
totalScore += point;
}  
  
  
void drawBasicEnemyScore()
{
fill(255, 128, 0);
text ("Ninja kill count:  " + basicEnemyScore, 945, 55);  
}

void drawBossEnemyScore()
{
fill(0, 204, 0);
text ("Juggernaut kill count:  " + bossEnemyScore, 830, 105);  
}

void drawTotalPointsScore()
{
fill(223, 191, 159);
text ("Total Points:  " + totalScore, 994, 155);    
}


  
  
  
}
