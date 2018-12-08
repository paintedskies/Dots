Population test;
Goal goal;
void setup(){
  size(800,800);
  //goal = new Goal(400,100);
  test = new Population(400);
}

void draw(){
  background(255);
  
  if(test.allDotsDead())
  {
    test.calculateFitness();
    test.naturalSelection();
    test.mutatePop();
  }
  fill(255,0,0);
rect(300,200,655,25);
rect(0,500,555,25);
test.update();
  test.show();
  //goal.show();
  //test.popGoalUpdate(goal);
}
