class Particle extends Mover {

  Particle(float posX, float posY) {
    position = new PVector(posX,posY);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 0.5;
    radius = 10;
  }
  
  void run() {
    display();
    update();
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }
  
  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(100, 255, 100);
    strokeWeight(1);
    fill(0, 127, 50, 80);
    ellipse(position.x, position.y, radius, radius);
  }


}
