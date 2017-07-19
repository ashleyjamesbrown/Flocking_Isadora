// Taken from Nature Of Code

// Flock class
// Does very little, simply manages the ArrayList of all the boids

class Flock {
  public ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  //method to add more boids into the global arraylist
  void addBoid(Boid b) {
    boids.add(b);
  }

}