public class SvgObj { 
  private int x;
  private int y;
  private float s;
  private PShape pshape1, pshape2, pshape3, pshape4;
  private PImage img;
  
  // constructor
  public SvgObj(int x, int y) {
    this.x = x;
    this.y = y;
    this.s = 1;
    
    pshape1 = loadShape("PlayStationCircle.svg");      // svg from: https://commons.wikimedia.org/wiki/File:PlayStationCircle.svg
    pshape2 = loadShape("PlayStationCross.svg");       // svg from: https://commons.wikimedia.org/wiki/File:PlayStationCross.svg
    pshape3 = loadShape("PlayStationSquare.svg");      // svg from: https://commons.wikimedia.org/wiki/File:PlayStationSquare.svg
    pshape4 = loadShape("PlayStationTriangle.svg");    // svg from: https://en.wikipedia.org/wiki/File:PlayStationTriangle.svg
    
    int choice = floor(random(1, 5));
    switch (choice) {
      case 1:
        img = toPGraphics(pshape1);
        break;
      case 2:
        img = toPGraphics(pshape2);
        break;
      case 3:
        img = toPGraphics(pshape3);
        break;
      case 4:
        img = toPGraphics(pshape4);
        break;
    }
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public void setS(float s) {
    this.s = s;
  }
  
  public float getS() {
    return s;
  }
  
  public PImage getImg() {
    this.img.mask(this.img);
    tint(255, random(100, 150));
    return img;
  }
  
  // cast svg shapes to PGraphics
  private PGraphics toPGraphics(PShape shape) {
    PGraphics graphics;
    graphics = createGraphics(25, 25);
    graphics.beginDraw();
    graphics.shape(shape, 0, 0, 25, 25);
    graphics.endDraw();
    return graphics;
  }
}
