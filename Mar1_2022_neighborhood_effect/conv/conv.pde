import processing.video.*;

Capture ourVideo;                                 // variable to hold the video object
int cam_width = 200;
int cam_height = 200;
int w = 120;

float[][] matrix = { { -1,  0, 1 },
                     { -2,  0, 2 },
                     { -1, -0, 1 },
                     { -2, -1, 0 },
                     { -1,  1, 1 },
                     {  0,  1, 2 },
                     }; 

void setup() {
  size(960, 720);
  frameRate(30);
  ourVideo = new Capture(this, 960, 720, "pipeline:autovideosrc");    // open the capture in the size of the window
  ourVideo.start(); 
  background(255);                                    // start the video
}

void draw() {
  // We're only going to process a portion of the image
  // so let's set the whole image as the background first
  if (ourVideo.available())  ourVideo.read();           // get a fresh frame as often as we can
  // Calculate the small rectangle we will process
  loadPixels();
  updatePixels();
  int xstart = constrain(mouseX - w/2, 0, ourVideo.width);
  int ystart = constrain(mouseY - w/2, 0, ourVideo.height);
  int xend = constrain(mouseX + w/2, 0, ourVideo.width);
  int yend = constrain(mouseY + w/2, 0, ourVideo.height);
  int matrixsize = 3;
  loadPixels();
  // Begin our loop for every pixel in the smaller image
  for (int x = xstart; x < xend; x++) {
    for (int y = ystart; y < yend; y++ ) {
      color c = convolution(x, y, matrix, matrixsize, ourVideo);
      int loc = x + y*ourVideo.width;
      pixels[loc] = c;
    }
  }
  updatePixels();
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage ourVideo)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      // What pixel are we testing
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + ourVideo.width*yloc;
      // Make sure we haven't walked off our image, we could do better here
      loc = constrain(loc,0,ourVideo.pixels.length-1);
      // Calculate the convolution
      int k;
      if(mousePressed){
        k = i+3;
      }
      else{
        k = i;
      }
      rtotal += (red(ourVideo.pixels[loc]) * matrix[k][j]);
      gtotal += (green(ourVideo.pixels[loc]) * matrix[k][j]);
      btotal += (blue(ourVideo.pixels[loc]) * matrix[k][j]);
    }
  }
  // Make sure RGB is within range
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  // Return the resulting color
  return color(rtotal, gtotal, btotal);
}
