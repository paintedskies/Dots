class Population{
  Dot[] dots;
  float fitnessSum;
  float maxFitness = 0.0;
  Dot bestDot = new Dot();
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
  
  void calculateFitness(Goal goal){
    fitnessSum = 0.0;
   maxFitness = 0.0;
    for(int i = 0; i < dots.length; i++)
    {
      fitnessSum = fitnessSum + dots[i].calculateFitness(goal);
      if(dots[i].fitness > maxFitness)
      {
      
       
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
   newDots[i]= a.getChild();
   
   //Dot b = getParent();
   //We can do crossover here but okay
 }
 
 dots = newDots.clone();
 
 }
 
 void mutatePop(){
 for(int i = 0; i < dots.length; i++)
 {
   dots[i].brain.mutate();
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
