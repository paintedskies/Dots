class Population{
  Dot[] dots;
  float fitnessSum;
  float maxFitness = 0.0;
  int bestDot = 0;
  Population(int size)
  {
    dots = new Dot[size];
    for(int i = 0; i < dots.length; i++)
    {
      dots[i] = new Dot();
    }
  }
  
  void show(){
    
    for(int i = 0; i < dots.length; i++)
    {
      dots[i].show();
      
    }
    dots[bestDot].bestshow();
    textSize(32);
    text(bestDot, 10, 30); 
  }
  
  void update(){
    for(int i = 0; i < dots.length; i++)
    {
      dots[i].update();
    }
  }
  void popGoalUpdate(Goal goal){
    for(int i = 0; i < dots.length; i++)
    {
      if(dist(dots[i].pos.x, dots[i].pos.y, goal.pos.x, goal.pos.y) < 5)
      {
        dots[i].reachedGoal = true;
        dots[i].dead = true;
      }
    }
  }
  
  void calculateFitness(){
    fitnessSum = 0.0;
   maxFitness = 0.0;
    for(int i = 0; i < dots.length; i++)
    {
      fitnessSum = fitnessSum + dots[i].calculateFitness();
      if(dots[i].fitness > maxFitness)
      {
      maxFitness=dots[i].fitness;
       bestDot = i;
      }
    }

  }
  boolean allDotsDead()
  {
    for(int i = 0; i < dots.length; i++)
    {
      if(!dots[i].dead)
      {
        return false;
      }
    }
    return true;
  }
 void naturalSelection(){
 Dot[] newDots = new Dot[dots.length];
 
 for(int i = 0; i < newDots.length; i++)
 {
   Dot a = getParent();
   Dot b = getParent();
   newDots[i]= a.getChild(a,b);
   
   //Dot b = getParent();
   //We can do crossover here but okay
 }
 newDots[bestDot]=dots[bestDot].copyBrain();
 /*for(int i = 0; i < newDots.length; i++)
 {
   newDots[i] = dots[i].copyBrain();
 }
 //newDots[bestDot].brain=dots[bestDot].brain.clone();
 */
 dots = newDots.clone();
 
 }
 
 void mutatePop(){
 for(int i = 0; i < dots.length; i++)
 {
   if(i!=bestDot)
   {dots[i].brain.mutate();
   }
 }
 }

   
 Dot getParent(){
  //Find sum of all fitnesses
   float rand = random(fitnessSum);
   float runningSum = 0.0;
   for(int i = 0; i < dots.length; i++)
   {
     runningSum +=dots[i].fitness;
     if(runningSum > rand)
     {
       return dots[i];
     }
   }
   return null;
   
  }
}
