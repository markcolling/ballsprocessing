class Ball{
  color c;
  PVector loc;
  PVector v;
  PVector a;
  
  Ball(float tempX, float tempY){
  
  loc = new PVector(tempX,tempY);
  c = color(random(255),random(255),random(255));
  v = new PVector(random(0,3),random(-2,2));
  a = new PVector(0,0.05);
  }
  
  void display(){
    stroke(c);
    strokeWeight(20);
    point(loc.x,loc.y);
  }
  void move(){
    v.add(a);
    loc.add(v);
  }
}
