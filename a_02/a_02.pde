// global variable
Wave waveTop, waveBottom;
Shape shape;
Clock clock;
PImage bgMask;

public void setup() {
  size(600, 600);
  
  // creating new instances
  waveTop = new Wave(0.006, 0.02, 15);     // step, noiseY, fadeSpeed
  waveBottom = new Wave(0.005, 0.03, 15);  // step, noiseY, fadeSpeed
  shape = new Shape(125, 225);             // backgroundValue, objectValue
  clock = new Clock(width/2, height/2);    // posX, posY
  
  bgMask = getBgMask();
}

public void draw() {
  // gradient background
  image(bgMask, 0, 0);
  
  // show animated background object
  shape.showBG(120, 15, 30);               // objSize, objBorder, numOfObj
  shape.showObj(25, 4, 30);                // objSize, objBorder, numOfObj
  svgObjAnimation();
  
  // show waves animation on the top and bottom
  pushMatrix();
  translate(0, -height/15);
  waveTop.show();
  translate(0, height/1.5);
  waveBottom.show();
  popMatrix();
  
  // show clock on the center
  clock.show();
}

// draw animation created with svg objs
private void svgObjAnimation() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(20));
  shape.showSvgObj(10);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(70));
  shape.showSvgObj(10);
  popMatrix();
}

// draw gradient background
private PImage getBgMask() {
  PImage image = createImage(width, height, 1);
  
  for (int y=0; y<height; y++) {
    int c = (int) map(y, 0, 300, 0, 40);
    for (int x=0; x<width; x++) {
      image.set(x, y, c);
    }
  }
  
  image.filter(GRAY);
  return image;
}
