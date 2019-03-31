// based on Daniel Shiffman's The Nature of Code example

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float radius;
  float speed = 1;

  Mover() {
    position = new PVector(400,50);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    mass = 0.5;
    radius = 15;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    velocity.limit(speed);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x,position.y,radius,radius);
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
