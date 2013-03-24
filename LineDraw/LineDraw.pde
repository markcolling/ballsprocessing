float lastmousedownX = 200;
float lastmousedownY = 200;
float lastmouseupX = 250;
float lastmouseupY = 250;
float bx;
float by;
int lineGrabOffset = 10;
boolean OverLineGrab = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup() 
{
  size(640, 360);
  bx = 250;
  by = 250;
}

void draw() 
{ 
  background(0);

    fill(153);
    stroke(153);
    strokeWeight(4);
    line(lastmousedownX,lastmousedownY,lastmouseupX,lastmouseupY);

}

void mousePressed() 
{
  locked = false;
  lastmousedownX = mouseX; 
  lastmousedownY = mouseY; 
  lastmouseupX = mouseX; 
  lastmouseupY = mouseY; 

}

void mouseDragged() {
   locked = false;
   lastmouseupX = mouseX; 
   lastmouseupY = mouseY; 
  }


void mouseReleased() {
  locked = true;
    lastmouseupX = mouseX;
    lastmouseupY = mouseY;
}


