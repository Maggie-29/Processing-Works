import peasy.PeasyCam;
//3D interation lib
PeasyCam cam;

float r;                       //mobius radius
float x;
float y;
float z;


void setup(){
  size(800, 600, P3D);   
  smooth();
  cam = new PeasyCam(this, 400);
  noFill();
  colorMode(HSB);                  //set color mode to HSB
}

void draw(){
  background(0);
  lights();
  for(int i = 0; i < 360; i++){
    
    float r = map(i,0,360,-60,60);
    x=cos(radians(i))*(120+r*cos(radians(i/2)));
    y=sin(radians(i))*(120+r*cos(radians(i/2)));
    z=r*sin(radians(i/2));
    
    pushMatrix();
    translate(x,y,z);
    rotateX(radians(i));
    stroke(i, 150, 255);
    ellipse(0, 0, 60, 60);
    popMatrix();
  }
  
}
