//Reference: waves by X_lippy_XX, https://openprocessing.org/sketch/1317444

int ranges = 100;

void setup() {
  fullScreen();
  background(0);
}

void draw() {
  background(0);
  noFill();
  strokeWeight(2);

  for (int i = 0; i < ranges; i++) {
    float paint = map(i, 0, ranges, 0, 100);
    stroke(paint);
    
    beginShape();
    for (int x = -10; x < width + 11; x += 5) {
      float n = noise(x * 0.001, i * 0.009, frameCount * 0.003);
      float y = map(n, 0,1, 0, height);
      vertex(x, y);
    }
    endShape();
  }
}
