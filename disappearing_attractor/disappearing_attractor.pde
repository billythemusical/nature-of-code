// based on Daniel Shiffman's The Nature of Code example

Mover m;
Attractor a;
ParticleSystem ps;

Particle[] p;
int unit = 10;
int count;

void setup() {
  size(800,640);
  m = new Mover(); 
  a = new Attractor();
  
  ps = new ParticleSystem();
  ps.addParticle();
  //int wideCount = width / unit;
  //int heightCount = height / unit;
  //count = wideCount * heightCount;
  //p = new Particle[count]; 
  //int index = 0;
  //for(int x = 0; x < wideCount; x++) {
  //  for(int y = 0; y < heightCount; y++) {   
  //    p[index++] = new Particle(wideCount*x + random(-width/32,width/32), heightCount*y + random(-height/32,height/32));
  //  }
  //}
}

void draw() {
  background(255);
    //ps.display();
   //for (Particle part : particles) {
   //   part.display();
   //}
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
  ps.applyMover(m.position);
  m.applyForce(force);
  m.update();
  
  a.display();
  m.display();
  
}
