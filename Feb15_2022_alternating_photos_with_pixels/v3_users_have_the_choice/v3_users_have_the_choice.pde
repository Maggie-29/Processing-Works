PImage img1, img2;
int [] widthCount = new int[18];

void setup() {
  size(700, 700);
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
}

void draw() {
  loadPixels();
  for (int y = 0; y < height; y ++) {
    for (int x = 0; x  < width; x ++) {
      color img_c=img1.get(x, y);
      color img_c2=img2.get(x, y);
      int pixel_loc = x+y*width;
      int j, k;
if (keyPressed) {
        j = (x / (mouseX+mouseY+1)) % 2;
        k = (y / (mouseX+mouseY+1)) % 2;
      } else {
        j = (x / (mouseX+1)) % 2;
        k = (y / (mouseY+1)) % 2;
      }
      if (j == k) {
        pixels[pixel_loc]=img_c;
      } else {
        pixels[pixel_loc]=img_c2;
      }
    }
  }
  copy();
  updatePixels();
}
