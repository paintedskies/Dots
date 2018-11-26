class Dot{
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  boolean dead = false;
  boolean reachedGoal = false;
  float fitness;
  
  Dot(){
    brain = new Brain(400);
    pos = new PVector(width/2, height/2);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }


void show(){
  fill(0);
  ellipse(pos.x, pos.y, 4,4);
}

void move(){
   if(brain.directions.length > brain.step)
   {
     acc = brain.directions[brain.step];
     brain.step++;
   }
     
  pos.add(vel);
  
  vel.add(acc);
  vel.limit(5);
  }
  
  void update(){
  
   if(pos.x < 2 || pos.y < 2 || pos.x > width-2 || pos.y > height-2)
    {
      dead = true;
    }
/*    if((pos.x > 100 && pos.y > 200)&&(pos.x<655&&pos.y<225))
    {
      dead = true;
    }
  */  
    if(!dead&!reachedGoal)
    {
      move();
    }
   
  }
  
  float calculateFitness(Goal goal){
  if(reachedGoal)
  {
    fitness = (1.0/brain.step*brain.step)+100.0;
  }
  else{
  float distanceToGoal = dist(pos.x, pos.y, goal.pos.x, goal.pos.y);
  fitness = 1.0/(distanceToGoal*distanceToGoal);
  
  }
  return fitness;
  }
  
  Dot getChild(){
    Dot x = new Dot();
    x.brain =  brain.clone();
    return x;
  //We need to put children here after crossover
  }
  
  
}
