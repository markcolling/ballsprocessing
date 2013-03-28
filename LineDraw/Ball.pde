class Ball{
  float x;
  float y;
  
  
  Ball(float tempX, float tempY){
  
  x = tempX;
  y = tempY;
  }
  
void display(){
  stroke(random(255));
  strokeWeight(20);
  point(x,y);
}
}
