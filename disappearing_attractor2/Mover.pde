// based on Daniel Shiffman's The Nature of Code example

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float radius = 15;
  float maxSpeed = 5;

  Mover() {
    position = new PVector(400,50);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    mass = 0.5;
    //radius = 15;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    velocity.limit(maxSpeed);
    acceleration.mult(0);
  }

  void display() {
    stroke(100, 100, 255);
    strokeWeight(2);
    fill(0, 50, 127, 80);
    ellipse(position.x,position.y,radius,radius);
  }
  
   // Calculate a force to push particle away from repeller
  PVector repel(Particle p) {
    PVector dir = PVector.sub(position,p.position);      // Calculate direction of force
    float d = dir.mag();                       // Distance between objects
    dir.normalize();                           // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    d = constrain(d,5,100);                    // Keep distance within a reasonable range
    float force = -1.75 / (d * d);            // Repelling force is inversely proportional to distance
    dir.mult(force);                           // Get force vector --> magnitude * direction
    return dir;
  }  

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }

  }

}
