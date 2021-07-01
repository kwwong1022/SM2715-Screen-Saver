public class Wave {
  private int fadeSpeed;
  private float step;       // control the soomthness of the wave
  private float noiseY;     // param for 2D noise
  private float rateY;      // increasing speed of noiseY
  private PImage prevImg, currImg;
  private PGraphics currFrame, MixedFrame;
  
  // constructor
  public Wave(float step, float rateY, int fadeSpeed) {
    this.step = step;
    this.rateY = rateY;
    this.fadeSpeed = fadeSpeed;
    
    // initialization
    this.noiseY = 0;
    prevImg = createImage(width, height, 1);
    currImg = createImage(width, height, 1);
    currFrame = createGraphics(width, height);
    MixedFrame = createGraphics(width, height);
  }
  
  // draw and show animation of waves
  public void show() {
    // use PGraphics to store the movement of waves
    currFrame.beginDraw();
    currFrame.background(0);
    currFrame.stroke(255);
    
    // draw wave by using noise(x, y); x -> horizontal y -> forward
    int lastY = (int) (noise(-1 * step, noiseY) * height/2);
    
    for (int i=0; i<width + 100; i++) {
      int currY = (int) (noise(i * step, noiseY) * height/2);
      currFrame.line(i, lastY, i+1, currY);
      lastY = currY;
    }
      
    noiseY += rateY;
    currFrame.endDraw();
    
    // make transparent background
    currImg = currFrame;
    currImg.mask(currImg);
    prevImg.mask(prevImg);
    
    MixedFrame.beginDraw();
    MixedFrame.image(prevImg, 0, 0);
    MixedFrame.fill(0, fadeSpeed);
    MixedFrame.rect(0, 0, width, height);
    
    // using layers of black rect to create fading effect (covering previous frames)
    MixedFrame.image(currImg, 0, 0);
    MixedFrame.endDraw();
    
    // make the background transparent
    prevImg = MixedFrame.copy();
    prevImg.mask(prevImg);
    
    image(prevImg, 0, 0);
  }
}
