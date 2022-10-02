import processing.video.*;

Capture myVideo;

//global variable
float newR, newG, newB;

void setup() {
  size(640, 480);
  myVideo = new Capture(this, width, height, "pipeline:autovideosrc");
  myVideo.start();
}

void draw() {
  if (myVideo.available() == true   )myVideo.read();

  for (int y = 0; y<height; y++) {
    for (int x = 0; x<width; x++) {
      color myColor = myVideo.get(x, y);
      float myRed = red( myColor);
      float myGreen = green( myColor);
      float myBlue = blue( myColor);
      float myGray = (myRed + myGreen + myBlue)/3;

      float a = map(mouseX, 0, width, 0, 125);
      if (myGray >a) {
        newR=0.423*myRed+0.789*myGreen+0.189*myBlue;
        newG=0.389*myRed+0.786*myGreen+0.168*myBlue;
        newB=0.322*myRed+0.534*myGreen+0.131*myBlue;
      } else {
        newR=myRed*110/(myGreen+myBlue+1);
        newG=myGreen*70/(myRed+myBlue+1);
        newB=myBlue*190/(myGreen+myRed+1);
      }

      ////Overflow protection
      if (newB<0)newB=0;
      if (newB>255)newB=255;
      if (newG<0)newG=0;
      if (newG>255)newG=255;
      if (newR<0)newR=0;
      if (newR>255)newR=255;

      set(x, y, color(newR, newG, newB));
    }
  }
}
