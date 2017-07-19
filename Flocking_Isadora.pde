
//
// Ashley James Brown
//
// Client: Bill Cottman
// Title:  Flocking_Isadora
// Date:   July 2017 
//
// tested on 10.12.5 corei5 processing 3.2.1 java 8 hd3000 gfx and geforce gt750m


// Rules: Cohesion, Separation, Alignment


//boid speed and force
float gmaxForce=0.05; //default 0.05
float gmaxSpeed=8; //default 3

//comntrols for S,A,C
float gSep =25.0; //default 25 . lower number closer togther, higher number furtehr apart
float gAli=50; //default is 50. neighbour distance for alignment
float gCoh=50; //default is 50. neighbour distance for cohesion 

//weighting for S,A,C
float wSep=1.5; //default 1.5
float wAli=1.0; //default 1
float wCoh=1.0; //default 1



Flock flock; //global arraylist 

float r=255;
float g=255;
float b=255;

boolean texturing=true;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void settings() {
  size(1200, 800, P3D);
}

void setup() {  
  background(255);
  setupControls();
  flock = new Flock();

  // Add an initial set of 100 boids into the system
  for (int i = 0; i < 100; i++) {
    Boid b = new Boid(width/2, height/2);
    flock.addBoid(b);
  }

  loadRenderEngine();
  setupOSC();
}


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
void draw() {

  if (bkg) {
    color currentColor = lerpColor(fromColor, toColor, currentLerpValue);

    currentLerpValue += lerpStep;
    if (currentLerpValue >= 1) {
      fromColor = currentColor;
      toColor= getRandomColor();
      currentLerpValue = 0;
    }

    background(currentColor);
  } else {
    background(r, g, b);
  }
  
  
  flock.run(); //apply all forces in realtime - osc is already threading and listening and will update global variables in real time

  if (texturing) {
    renderBoids(); //texture render onto teh boids
  } else {
    textureMode(NORMAL);
  }

  //syphon out
}






// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX, mouseY));
}


void keyPressed() {
  switch (key) {
  case 's' :
    saveFrame("./images/flockingIsadora-###.tiff");
    break;
  case 't' :
    texturing=!texturing;
    break;
  }
}