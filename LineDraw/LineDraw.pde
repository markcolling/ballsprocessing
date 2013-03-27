int NumOfLines = 24; //Max number of lines
int nextLineInst = 0; //Next empty slot for a new line in the Line Array
float grabAccuracy = 10; //Accuracy of the click when grabbing the end of a line
int activeLine = 0; //Current line being moved
int activeHandle = 2; //Handle being moved on current line
boolean existHandle = false; //Flag stating whether an existing handle is being moved or a new line needs to be made

//Create the array of "Line" objects
Line[] lines = new Line[NumOfLines];

void setup() 
{
  size(640, 360);
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

boolean checkHandle(){
  int i = 1;
    while (i <= NumOfLines - 1  && lines [i] != null ) {
        if(dist(mouseX,mouseY,lines[i].X1,lines[i].Y1) <= grabAccuracy) {
              activeLine = i;
              activeHandle = 1;
              checkHandle = true
        }
        else if(dist(mouseX,mouseY,lines[i].X2,lines[i].Y2) <= grabAccuracy) {
              activeLine = i;
              activeHandle = 2;
              checkHandle = true;
        }
      i += 1;
      }
  return checkHandles
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


