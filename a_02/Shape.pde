public class Shape {
  private int bgColor, objColor;
  private int seed;
  private PImage bgImg, aniImg;
  private PGraphics shape1, shape2, shape3, shape4;
  private PGraphics shapeBackground, shapeAnimation;
  private ArrayList<SvgObj> svgObjs;
  
  // constructor
  public Shape(int bgColor, int objColor) {
    this.bgColor = bgColor;
    this.objColor = objColor;
    this.seed = (int) random(10);
    
    shapeBackground = createGraphics(width, height);
    shapeAnimation = createGraphics(width, height);
    svgObjs = new ArrayList<SvgObj>();
    
    for (int i=0; i<10; i++) {
      svgObjs.add(new SvgObj((int) random(0, width), (int) random(0, height)));
    }
  }
  
  public void showSvgObj(int numOfObj) {
    randomSeed(seed*frameCount);
    
    // add svgObjs to arraylist
    if (svgObjs.size() < numOfObj) {
      svgObjs.add(new SvgObj((int) random(0, width), (int) random(0, height)));
    }
    
    // movement of svgObjs
    for (int i=0; i<numOfObj-numOfObj/2; i++) {
      SvgObj obj = svgObjs.get(i);
      pushMatrix();
      scale(obj.getS());
      image(obj.getImg(), obj.getX(), obj.getY());
      popMatrix();
      obj.setS(obj.getS() - random(0.01, 0.03));
    }
    
    // remove svgObjs
    for (int i=0; i<numOfObj-numOfObj/2; i++) {
      if (svgObjs.get(i).getS() < 0) {
        svgObjs.remove(i);
      }
    }
  }
  
  public void showObj(int objSize, int objBorder, int numOfObj) {
    randomSeed(seed);
    // initialize shapes
    shape1 = getShape1(objSize, objBorder, objColor);
    shape2 = getShape2(objSize, objBorder, objColor);
    shape3 = getShape3(objSize, objBorder, objColor);
    shape4 = getShape4(objSize, objBorder, objColor);
    
    // draw animation into PGraphics
    shapeAnimation.beginDraw();
    for (int i=0; i<numOfObj; i++) {  
      float speed = random(1,5);
      
      int x = (int) (random(0, width) + speed * frameCount) % (width + 100);
      int y = (int) (noise(i + 0.005) * height);
      
      shapeAnimation.fill(0, 20);
      shapeAnimation.rect(0, 0, width, height);

      shapeAnimation.pushMatrix();
      shapeAnimation.rotate(noise(20*i + 0.005*frameCount) - 0.5);
      
      int choice = floor(random(1, 5));
      
      switch (choice) {
        case 1:
          shapeAnimation.image(shape1, x - 100, y );
          break;
        case 2:
          shapeAnimation.image(shape2, x - 100, y );
          break;
        case 3:
          shapeAnimation.image(shape3, x - 100, y );
          break;
        case 4:
          shapeAnimation.image(shape4, x - 100, y );
          break;
      }
      shapeAnimation.popMatrix();
      
    }
    shapeAnimation.endDraw();
    
    // make the background transparent
    aniImg = shapeAnimation;
    aniImg.mask(aniImg);
    
    image(aniImg, 0, 0);
  }
  
  public void showBG(int objSize, int objBorder, int numOfObj) {
    randomSeed(seed);
    // initialize shapes
    shape1 = getShape1(objSize, objBorder, bgColor);
    shape2 = getShape2(objSize, objBorder, bgColor);
    shape3 = getShape3(objSize, objBorder, bgColor);
    shape4 = getShape4(objSize, objBorder, bgColor);
    
    // draw animation into PGraphics
    shapeBackground.beginDraw();
    for (int i=0; i<numOfObj; i++) {
      int choice = floor(random(1, 5));
      switch (choice) {
        case 1:
          shapeBackground.image(shape1, random(-objSize, width), random(-objSize, height));
          break;
        case 2:
          shapeBackground.image(shape2, random(-objSize, width), random(-objSize, height));
          break;
        case 3:
          shapeBackground.image(shape3, random(-objSize, width), random(-objSize, height));
          break;
        case 4:
          shapeBackground.image(shape4, random(-objSize, width), random(-objSize, height));
          break;
      }
      shapeBackground.fill(0, 20);
      shapeBackground.rect(0, 0, width, height);
      
    }
    shapeBackground.endDraw();
    
    // make the background transparent
    bgImg = shapeBackground;
    bgImg.mask(bgImg);
    
    image(bgImg, 0, 0);
  }
  
  // shape: <|
  private PGraphics getShape1(int s, int b, int c) {  
    int border = s/b;
    PGraphics shape = createGraphics(s + border*2, s + border*2);
    shape.beginDraw();
    shape.noFill();
    shape.stroke(c);
    shape.strokeWeight(b);
    shape.triangle(0 +border, s/1.2 +border, s/2 +border, 0 +border, s +border, s/1.2 +border);
    shape.endDraw();
    return shape;
  }
  
  // shape: O
  private PGraphics getShape2(int s, int b, int c) {
    int border = s/b;
    PGraphics shape = createGraphics(s + border*2, s + border*2);
    shape.beginDraw();
    shape.noFill();
    shape.stroke(c);
    shape.strokeWeight(b);
    shape.ellipse(s/2, s/2, s/1.15, s/1.15);
    shape.endDraw();
    return shape;
  }
  
  // shape: X
  private PGraphics getShape3(int s, int b, int c) {  
    int border = s/b;
    PGraphics shape = createGraphics(s + border*2, s + border*2);
    shape.beginDraw();
    shape.noFill();
    shape.stroke(c);
    shape.strokeWeight(b);
    shape.line(0+border, s/1.15, s/1.15, 0 +border);
    shape.line(0+border, 0 +border, s/1.15, s/1.15);
    shape.endDraw();
    return shape;
  }
  
  // shape: []
  private PGraphics getShape4(int s, int b, int c) {  
    int border = s/b;
    PGraphics shape = createGraphics(s + border*2, s + border*2);
    shape.beginDraw();
    shape.noFill();
    shape.stroke(c);
    shape.strokeWeight(b);
    shape.rect(0 +border, 0+border, s/1.15, s/1.15);
    shape.endDraw();
    return shape;
  }
}
