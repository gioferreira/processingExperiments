int diam = 10;
float centX, centY;
void setup() {
  size(1920, 1080);
  //frameRate(24);
  smooth();
  background(180);
  centX = width/2;
  centY = height/2;
  stroke(0);
  strokeWeight(1);
  //noFill();
  fill(180,25);
}

void draw() {
  if (diam <= 1200) {
    //background(180);
    ellipse(centX, centY, diam, diam);
    diam += 20;
    saveFrame("output/screen-####.png");
  }
}
