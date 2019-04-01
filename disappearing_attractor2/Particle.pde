class Particle extends Mover {
  PVector origin;
  
  float restLength;  
  float k = 0.1;
  
  Particle(float posX, float posY) {
    position = new PVector(posX,posY);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    origin = position;
    mass = 4;
    radius = 12;
  }
  
  void run() {
    display();
    update();
    //friction();
    checkEdges();
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
  
  //void friction () {
  //    PVector frictionPart = velocity.get();
  //    float c = 2;
  //    frictionPart.mult(-1);
  //    frictionPart.normalize();
  //    frictionPart.mult(c);
  //  }
  
  
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

void checkEdges() {

    if (position.x > width || position.x < 0) {
      velocity.x *= -1;
    }

    if (position.y > height || position.y < 0) {
      velocity.y *= -1;
    }

  }

}
