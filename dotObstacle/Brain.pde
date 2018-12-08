class Brain{
  PVector[] directions;
  int step = 0;
  
  Brain(int size){
    directions = new PVector[size];
    randomize();
  }
  
  void randomize(){
    for(int i = 0; i < directions.length; i++)
    {
      float randomAngle = random(2*PI);
      directions[i] = PVector.fromAngle(randomAngle); // Returns new 2D unit vector from that angle
    }
  }
  Brain clone(){
    Brain b = new Brain(directions.length);
    for(int i = 0; i < directions.length; i++)
    {
      b.directions[i] = directions[i];
    }
    return b;
  }
  Brain combine(Brain a, Brain b){
     Brain c = new Brain(directions.length);
    for(int i = 0; i < directions.length; i++)
    {
      c.directions[i] = PVector.add(a.directions[i],b.directions[i]);
      c.directions[i] = PVector.div(c.directions[i],2);
    }
    return c;
  }
  
  void mutate(){
  float mutationChance = 0.01;
  for(int i = 0; i < directions.length; i++)
  {
    float rand = random(1);
    if(rand < mutationChance)
    {
      float randomAngle = random(2*PI);
      directions[i] = PVector.fromAngle(randomAngle); 
      //Probably can make it mutate a litte bit as opposed to overwrite but idk
    }
  }
  }
}
