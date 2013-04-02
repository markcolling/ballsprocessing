class Ball{
  float x;
  float y;
  PVector v;
  color c = color(0);
  
  Ball(float tempX, float tempY){
  
  x = tempX;
  y = tempY;
  }
  
void display(){
  stroke(random(255));
  strokeWeight(20);
  point(x,y);
}

void move(){
   
}
}
