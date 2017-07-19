import controlP5.*;

ControlFrame cf;

void setupControls(){
  cf = new ControlFrame(this, 400, 800, "Controls");
  surface.setLocation(420, 10); 
}

class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
  
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);
    
    cp5.addToggle("Texture")
       .plugTo(parent, "texturing")
       .setPosition(10, 10)
       .setSize(30, 30)
       .setValue(true);
       
        cp5.addToggle("Background Colour Change")
       .plugTo(parent, "bkg")
       .setPosition(70, 10)
       .setSize(30, 30)
       .setValue(true);
       
    cp5.addSlider("Seperation_Amount")
       .plugTo(parent, "gSep")
       .setRange(2, 100)
       .setValue(25)
       .setPosition(10, 100)
       .setSize(200, 30);
       
       cp5.addSlider("Alignment_Amount")
       .plugTo(parent, "gAli")
       .setRange(2, 100)
       .setValue(50)
       .setPosition(10, 150)
       .setSize(200, 30);
       
        cp5.addSlider("Cohesion_Amount")
       .plugTo(parent, "gCoh")
       .setRange(2, 100)
       .setValue(50)
       .setPosition(10, 200)
       .setSize(200, 30);
       
       
       cp5.addSlider("Seperation_Weight")
       .plugTo(parent, "wSep")
       .setRange(0.1, 2.0)
       .setValue(1.5)
       .setPosition(10, 300)
       .setSize(200, 30);
       
       cp5.addSlider("Alignment_Weight")
       .plugTo(parent, "wAli")
       .setRange(0.1, 2.0)
       .setValue(1.0)
       .setPosition(10, 350)
       .setSize(200, 30);
       
        cp5.addSlider("Cohesion_Weight")
       .plugTo(parent, "wCoh")
       .setRange(0.1, 2.0)
       .setValue(1.0)
       .setPosition(10, 400)
       .setSize(200, 30);
       
       cp5.addSlider("Max_Speed")
       .plugTo(parent, "gmaxSpeed")
       .setRange(1, 10)
       .setValue(3)
       .setPosition(10, 500)
       .setSize(200, 30);
       
         cp5.addSlider("Max_Force")
       .plugTo(parent, "gmaxForce")
       .setRange(0.01, 1)
       .setValue(0.05)
       .setPosition(10, 550)
       .setSize(200, 30);
       
  }

  void draw() {
    background(0);
    
  }
}