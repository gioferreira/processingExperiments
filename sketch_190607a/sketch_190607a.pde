float diam = 0;
boolean grow = true;
void setup() { 
  colorMode(HSB, 360, 100, 100);
  size(540, 960); 
  frameRate(480); 
  smooth();
  stroke(0,0,0,0); 
  strokeWeight(0); 
  background(0);
}

void draw_ellipse(float diam, float X, float Y, float maxSize) {
  float hue = X/width * 360;
  float saturation = Y/height * 100;
  float brightness = diam/maxSize * 100;
  //float bgHue = (hue)/(100) * (0-100) + 100;
  //float bgSat = (saturation)/(100) * (0-100) + 100;
  //float bgB = (brightness)/(100-0) * (0-100) + 100;
  //background(bgHue, bgSat, bgB);
  background(0);
  
  fill(hue, saturation, brightness, 255);
  ellipse(X, Y, diam, diam);
  
}

void breath(float X, float Y, float maxSize, float minSize, float speed) {
  if (grow == true) {
    if (diam < maxSize) {
     draw_ellipse(diam, X, Y, maxSize); 
     diam += speed;
    } else if (diam >= maxSize) {
      draw_ellipse(diam, X, Y, maxSize);
      diam += speed;
      grow = false;
    }
  } else if (grow == false) {
    if (diam > minSize) {
      draw_ellipse(diam, X, Y, maxSize);
      diam += -1 * speed;
    } else if (diam <= minSize) {
      draw_ellipse(diam, X, Y, maxSize);
      diam += -1 * speed;
      grow = true;
    }
  }
}

 
void draw() {
  float maxSize = width/3;
  float minSize = 0;
  float speed = 0.4;
  breath(mouseX, mouseY, maxSize, minSize, speed);

}
 
