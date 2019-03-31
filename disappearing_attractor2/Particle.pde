class Particle extends Mover {
  PVector origin;
  
  float restLength;  
  float k = 0.1;
  
  Particle(float posX, float posY) {
    position = new PVector(posX,posY);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    origin = position;
    mass = 0.5;
    radius = 12;
  }
  
  void run() {
    display();
    update();
    //spring();
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
    //PVector spring = PVector.sub(position, origin);
    //  float d = spring.mag();
    //  float stretch = d;
    //  float k = 0.1;
    //  spring.normalize();
    //  spring.mult(-1 * k * stretch);
  }
  
  //void spring() {
  //float restLength;  
  //restLength = 0;
  //float k = 0.1;
  //}
  
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
