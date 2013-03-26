float lineX1 = 200;
float lineY1 = 200;
float lineX2 = 250;
float lineY2 = 250;
int NumOfLines = 25; //Max number of lines
int currentline = 0; //current line being drawn

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
  //Increment the array counter
  currentline = currentline+1;
  //Add a new line object to the array
  lines[currentline] = new Line(103,mouseX,mouseY,mouseX,mouseY);
}

void mouseDragged() {
  //Update the second point of the line
   lines[currentline].lineX2 = mouseX;
   lines[currentline].lineY2 = mouseY;
  }

class Line {
  public color c; 
  public float lineX1;
  public float lineY1;
  public float lineX2;
  public float lineY2;
 
    Line(color tempc, float templineX1, float templineY1, float templineX2, float templineY2) {
    
    c = tempc;
    lineX1 = templineX1;
    lineY1 = templineY1;
    lineX2 = templineX2;
    lineY2 = templineY2;
   
    }
    
  //Draw the current line to the screen
  void display() {
      //draw
      stroke(200);
      strokeWeight(4);
      line(lineX1,lineY1,lineX2,lineY2);
  }
}

