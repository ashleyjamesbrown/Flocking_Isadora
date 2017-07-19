




// ArrayList<Boid> boids;


PImage timg;
BoidRenderer br;

void loadRenderEngine() {
  timg = loadImage("plane.png"); //plane.png  up.png  nav.png  paint.png

  br = new BoidRenderer(); //establish new render
}



void renderBoids() {
  textureMode(IMAGE);
  br.renderBoids(flock, 2, 3);
}


class BoidRenderer {

  void renderBoids(Flock flock, int delta, int sWeight) {
    //strokeWeight(sWeight);
    //stroke(0);

    noStroke();
    noFill();
    //tint(255,190);

    //blendMode(ADD);






    for (Boid b : flock.boids) {

      beginShape(QUAD);
      textureMode(IMAGE);
      texture(timg);


      float theta = b.velocity.heading2D() + radians(90);
      //fill(175);
      //stroke(0);
      pushMatrix();
      translate(b.position.x, b.position.y);
      rotate(theta);



      vertex(0, 0, 0, 0);
      vertex(18, 0, timg.width, 0);
      vertex(18, 18, timg.width, timg.height);
      vertex(0, 18, 0, timg.height);
      //image(timg,0,0);


      endShape();
      popMatrix();
    }
  }
}