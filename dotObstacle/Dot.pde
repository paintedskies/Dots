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
    pos = new PVector(width/2, 700);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }


void show(){
  fill(0);
  ellipse(pos.x, pos.y, 4,4);
}
void bestshow(){
  fill(0,255,0);
  ellipse(pos.x, pos.y, 20,20);
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
    if((pos.x > 300 && pos.y > 200)&&(pos.x<855&&pos.y<225))
    {
      dead = true;
    }
    
    if((pos.x > 0 && pos.y > 500)&&(pos.x<555&&pos.y<525))
    {
      dead = true;
    }
    
    if(!dead&!reachedGoal)
    {
      move();
    }
   
  }
  
  float calculateFitness(){
  if(pos.y<0.00001)
  {
    fitness = (1.0/brain.step*brain.step*brain.step*brain.step)+100.0;
  }
  else{
//float distanceToGoal = dist(pos.x, pos.y, goal.pos.x, goal.pos.y);
  fitness = 1.0/((pos.y+1)*(pos.y+1));
  
  }
  return fitness;
  }
  
  Dot getChild(Dot a, Dot b){
    Dot x = new Dot();
   // x.brain =  brain.clone();
   x.brain = brain.combine(a.brain,b.brain);
    return x;
  //We need to put children here after crossover
  }
  
  Dot copyBrain(){
    Dot x = new Dot();
    x.brain =  brain.clone();
   //x.brain = brain.combine(a.brain,b.brain);
    return x;
  
  }
  
  
}
