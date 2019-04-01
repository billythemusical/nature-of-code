// based on Daniel Shiffman's The Nature of Code example

// A class for a draggable attractive body in our world

class Attractor {
  float mass;    // Mass, tied to size
  float G;       // Gravitational Constant
  PVector position;   // position
  float radius;
  float alpha = 200;

  Attractor() {
    position = new PVector(width/2,height/2);
    mass = 20;
    G = 1;
    //radius = mass*2;
    radius = 0;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(position,m.position);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d,5.0,25.0);                          // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d);     // Calculate gravitional force magnitude
    force.mult(strength);     // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
    //float dist = PVector.dist(a.position,m.position);
    if (PVector.dist(a.position, m.position) < radius + (random(7.5, 12))) {
    //PVector pos = new PVector(m.position.x, m.position.y);
    position.x = random(mass*2 + 4, width - mass*2 + 4);
    position.y = random(mass*2 + 4, height - mass*2 + 4);
    radius = 0;
    alpha = 10;
    }
    ellipseMode(CENTER);
    strokeWeight(2);
    stroke(0);
    alpha++;
    fill(255, 0, 0, 80);
    stroke(175, 0, 0);
    //strokeWeight(constrain(alpha,0,5));
    if (alpha < 1) radius = 0;
    if (radius < mass*2) radius+=0.5;
    if (radius == mass*2) radius = mass*2;
    ellipse(position.x,position.y,radius,radius);
 }

}
