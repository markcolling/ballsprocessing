int NumOfBalls = 24; //Max number of Balls
int nextBallInst = 0; //Next empty slot for a new Ball in the Ball Array
float grabAccuracy = 10; //Accuracy of the click when grabbing the end of a Ball
int activeBall = 0; //Current Ball being moved
int activeHandle = 2; //Handle being moved on current Ball

//Create the array of "Ball" objects
Ball[] Balls = new Ball[NumOfBalls];

void setup() 
{
  size(640, 360);
}

void draw() 
{ 
  background(103);
  //Loop through the array and draw the Balls (calling the display method)
  for(int i = 1; i <Balls.length; i++){
    if(Balls[i]!=null) {
    Balls[i].display();
    }
  }
}

void mousePressed() 
{
   newBall();
  }
 
void newBall(){
              //If the Maximum Number of Balls is reached, start at beginning of array
          if(nextBallInst == NumOfBalls -1) {
              nextBallInst = 1;
            }
          //If not, increment the current array slot by 1
          else {nextBallInst += 1;}
          
          Balls[nextBallInst] = new Ball(mouseX,mouseY);
}

class Ball{
  float x;
  float y;
  
  Ball(float tempX, float tempY){
  
  x = tempX;
  y = tempY;
  }
  
void display(){
  stroke(255);
  strokeWeight(20);
  point(x,y);
}
}

