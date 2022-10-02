import processing.video.*;

Capture myVideo;

void setup(){
    size(640,480);
    myVideo = new Capture(this, width, height);
    myVideo.start();
    
}

void draw(){
    if (myVideo.available() == true   )myVideo.read();
    //image(myVideo,0,0);
    for (int y = 0; y<height; y+=10){
        for (int x = 0; x<width; x+=10){
            color myColor = myVideo.get(x,y);
            float myRed = red( myColor);
            float myGreen = green( myColor);
            float myBlue = blue( myColor);
            float myOpacity = (myRed + myGreen + myBlue)/3;
            
            //putting several colors in a single rectangle
            //applying larger and rotating pixels
            pushMatrix();
            translate(640-x-10, y);
            rotate(radians(myRed));
            noStroke();
            fill(myRed,myGreen,myBlue,myOpacity);
            rect(0,0,10+30,10+30);
            popMatrix();
            

            //noStroke();
            //fill(myRed,myGreen,myBlue,myOpacity);
            //rect(x,y,10+30,10+30);


        }
    }
}
