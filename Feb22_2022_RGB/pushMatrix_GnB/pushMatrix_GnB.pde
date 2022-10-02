import processing.video.*;

Capture myVideo;

void setup() {
  size(640, 480);
  myVideo = new Capture(this, width, height);
  myVideo.start();
}

void draw() {
  if (myVideo.available() == true   )myVideo.read();
  //image(myVideo,0,0);


  for (int y = 0; y<height; y+=10) {
    for (int x = 0; x<width; x+=10) {
      color myColor = myVideo.get(x, y);
      float myRed = red( myColor);
      float myGreen = green( myColor);
      float myBlue = blue( myColor);
      //float myGray = (myRed + myGreen + myBlue)/3;

      myRed = myRed*128/(myGreen+myBlue +1);
      myGreen = myGreen*108/(myRed+myBlue +1);
      myBlue = myBlue*128/(myGreen+myRed +1);

      //Overflow protection
      if (myBlue<0)myBlue=0;
      if (myBlue>255)myBlue=255;
      if (myGreen<0)myGreen=0;
      if (myGreen>255)myGreen=255;
      if (myRed<0)myRed=0;
      if (myRed>255)myRed=255;

      pushMatrix();
      translate(640-x-10, y);
      rotate(radians(myRed));
      println(myRed);
      noStroke();
      fill(myRed, myGreen, myBlue);
      rect(0, 0, 10+30, 10+30);
      popMatrix();
    }
  }
}
