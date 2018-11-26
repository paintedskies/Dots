class Goal{
PVector pos;
Goal(int a, int b)
{
  pos = new PVector(a,b);
}

void show(){
  fill(255,0,0);
  ellipse(pos.x, pos.y, 10, 10);
}
}
