PImage img1, img2;
int [] widthCount = new int[18];

void setup() {
  size(700, 700);
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
}

void draw() {
  getWidthCount();
  int count = widthCount[(int)map(mouseX, 0, width, 0, 18)];

  loadPixels();
  for (int y = 0; y < height; y ++) {
    for (int x = 0; x  < width; x ++) {
      color img_c=img1.get(x, y);
      color img_c2=img2.get(x, y);
      int j = (x / count) % 2;
      int k = (y / count) % 2;
      if (j == k) {
        pixels[x+y*width]=img_c;
      } else {
        pixels[x+y*width]=img_c2;
      }
    }
  }
  updatePixels();
}

void getWidthCount() {
  int j = 0;
  for (int i=1; i<=700; i++) {
    if (700 % i == 0) {
      widthCount[j] = i;
      j++;
    }
  }
}
