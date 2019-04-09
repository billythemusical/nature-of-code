// based on Daniel Shiffman's The Nature of Code example

Mover m;
Attractor a;
ParticleSystem ps;

Particle[] p;
int unit = 12;
int count;

void setup() {
  size(800,800);
  m = new Mover(); 
  a = new Attractor();
  
  ps = new ParticleSystem();
  ps.addParticle();
}

void draw() {
  pushMatrix();
  colorMode(HSB);
  background(210,20,255);
  colorMode(RGB);
  popMatrix();
  ps.run();
  
  PVector force = a.attract(m);
  PVector friction = m.velocity.get();
  float c = 0.09;
    if (a.radius < a.mass) {
      friction.mult(-1);
      friction.normalize();
      friction.mult(c);
        m.applyForce(friction);
    } else if (a.alpha > 100) {
    PVector f = PVector.div(force,m.mass);
    m.acceleration.add(f);
    }
    
  ps.repel(m);
  m.applyForce(force);
  m.update();
  
  a.display();
  m.display();
  saveFrame("line-######.png");
}
