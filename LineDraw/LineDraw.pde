int NumOfLines = 24; //Max number of lines
int nextLineInst = 0; //Next empty slot for a new line in the Line Array
float grabAccuracy = 10; //Accuracy of the click when grabbing the end of a line
int activeLine = 0; //Current line being moved
int activeHandle = 2; //Handle being moved on current line
boolean existHandle = false; //Flag stating whether an existing handle is being moved or a new line needs to be made

int NumOfBalls = 24; //Max number of Balls
int nextBallInst = 0; //Next empty slot for a new Ball in the Ball Array
int ballInterval = 2; //Interval between ball production in secs

int intFrameRate = 30; //Input frame rate to be removed

//Create the array of "Line" objects
Line[] lines = new Line[NumOfLines];
//Create the array of "Ball" objects
Ball[] balls = new Ball[NumOfBalls];

void setup() 
{
  size(640, 360);
  frameRate(intFrameRate);
}

void draw() 
{ 
  background(103);
  //Loop through the array and draw the lines (calling the display method)
  for(int i = 1; i <lines.length; i++){
    if(lines[i]!=null) {
    lines[i].display();
    }
  }
    //Loop through the array and draw the Balls (calling the display method)
  for(int i = 1; i <balls.length; i++){
    if(balls[i]!=null) {
    balls[i].move();
    balls[i].display();
    }
  }
  if(frameCount % (ballInterval * intFrameRate) == 0) {
    newBall();
  }
}

void mousePressed() 
{
  checkHandle();   
  
  if(existHandle == false) {
   newLine();
  }
}
  
void mouseDragged() {
  //Update the second point of the line
  if(activeHandle == 1){
   lines[activeLine].X1 = mouseX;
   lines[activeLine].Y1 = mouseY;
  }
  else{
   lines[activeLine].X2 = mouseX;
   lines[activeLine].Y2 = mouseY;
  }
}

void checkHandle(){
  int i = 1;
    existHandle = false;
    while (i <= NumOfLines - 1  && lines [i] != null ) {
        if(dist(mouseX,mouseY,lines[i].X1,lines[i].Y1) <= grabAccuracy) {
              activeLine = i;
              activeHandle = 1;
              existHandle = true;
        }
        else if(dist(mouseX,mouseY,lines[i].X2,lines[i].Y2) <= grabAccuracy) {
              activeLine = i;
              activeHandle = 2;
              existHandle = true;
        }
      i += 1;
      }
      
  }


void newLine(){
              //If the Maximum Number of lines is reached, start at beginning of array
          if(nextLineInst == NumOfLines -1) {
              nextLineInst = 1;
            }
          //If not, increment the current array slot by 1
          else {nextLineInst += 1;}
          
          lines[nextLineInst] = new Line(103,mouseX,mouseY,mouseX,mouseY);
          activeLine = nextLineInst;
          activeHandle = 2;
}

void newBall(){
              //If the Maximum Number of Balls is reached, start at beginning of array
          if(nextBallInst == NumOfBalls -1) {
              nextBallInst = 1;
            }
          //If not, increment the current array slot by 1
          else {nextBallInst += 1;}
          
          balls[nextBallInst] = new Ball(50,50);
}

