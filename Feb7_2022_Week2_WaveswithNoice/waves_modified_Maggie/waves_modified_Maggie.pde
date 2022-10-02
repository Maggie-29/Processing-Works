//Maggie Ma Chinese Landscape
//Reference: waves by X_lippy_XX, https://openprocessing.org/sketch/1317444

int ranges = 100;

void setup() {
  size(1200,700);
  background(255);
}

void draw() {
  background(255, 0.5);
  strokeWeight(2);
  
  fill(0,180,200, 0.9);
  int color_rgb1[] = {0,77,129};
  
  waveShape(color_rgb1, 0.001, 0.009, mouseX*0.0001, 77, 1000);  //sea
  
  int color_rgb2[] = {0,30,40};
  waveShape(color_rgb2, 0.007, 0.021, 0.004, mouseY*0.02, 500); //mountain at the front
  
  int color_rgb3[] = {0,50,80};
  waveShape(color_rgb3, 0.0068, 0.018, 0.005, 0, 400); //mountain at the back

}

/*
int color_rgb[]                stroke color
float noise_x                  x-coordinate in noise space
float noise_i                  y-coordinate in noise space
float frameCount_coefficient   the speed of the wave randomly moving
float wave_height              
float range
*/

void waveShape(int color_rgb[], float noise_x, float noise_i, float frameCount_coefficient, float wave_height, float wave_range) {

  for (int i = 0; i < ranges; i++) {
    float paint = map(i, 0, ranges, 0, wave_range/5);
    stroke(color_rgb[0],color_rgb[1],color_rgb[2],paint);

    beginShape();
    for (int x = -10; x < width + 11; x += 5) {
      float n = noise(x * noise_x, i * noise_i, frameCount * frameCount_coefficient);
      float y = map(n, 0, 1, wave_height, wave_height+wave_range);
      vertex(x, y);
    }
    endShape();
  }
}
