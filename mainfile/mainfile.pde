Population test;
Goal goal;
void setup(){
  size(800,800);
  goal = new Goal(400,100);
  test = new Population(400);
}

void draw(){
  background(255);
  
  if(test.allDotsDead())
  {
    test.calculateFitness(goal);
    test.naturalSelection();
    test.mutatePop();
  }
 // rect(100,200,555,25);
test.update();
  test.show();
  goal.show();
  test.popGoalUpdate(goal);
}
