// IMPORT THE SPOUT LIBRARY
import spout.*;

// DECLARE A SPOUT OBJECT
Spout spout;
String sendername;

// CONTROL ARRAYS
String[] controlName;
int[] controlType;
float[] controlValue;
String[] controlText;

// CONTROL VARIABLES
boolean bRotate = true;
float RotationSpeed = 1.0;
float RotX = 0;
float RotY = 0;
String UserText = "";

void setupSketchMapper(){
  spout = new Spout(this);
  // CREATE A SPOUT SENDER
  // Must use the same name as the sketch
  sendername = "sketch_181227b";
  spout.createSender(sendername, width, height); // must be sketch name && sketch dimensions
  
    // OPEN THE CONTROLS FOR THE CONTROLLER
  // Must use the same name as the sketch and sender
  spout.openSpoutControls(sendername);
}

void drawSketchMapper(){
  spout.sendTexture();
}


/*----this sucks because Framerate----

private SketchMapper sketchMapper;

public class TopSketch extends AbstractSketch {
  
  public TopSketch(final PApplet parent, final int width, final int height) {
    super(parent, width, height);
  }
  
  @Override
  public void draw() {
    graphics.beginDraw();
    graphics.background(255);
    graphics.fill(0);
    for (int i = 0; i < 100; i++) {
      graphics.image(top,0,0);
    }
    graphics.endDraw();
  }
  @Override
    public void keyEvent(KeyEvent event) {

    }
    @Override
    public void mouseEvent(MouseEvent event) {

    }
    @Override
    public void setup() {

    }
  
}




void setupSketchMapper (){
  sketchMapper = new SketchMapper(this);
  
  sketchMapper.addSketch(new TopSketch(this, top.width, top.height));
}

void drawSketchMapper(){
  sketchMapper.draw();
}

*/
