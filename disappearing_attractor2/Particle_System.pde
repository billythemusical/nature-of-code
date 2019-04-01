// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void addParticle() {

  //int wideCount = width / unit;
  int wideCount = 50;
  //int heightCount = height / unit;
  int heightCount = 50;
  count = wideCount * heightCount;
  p = new Particle[count]; 
  int index = 0;
    for(int x = 0; x < width/wideCount; x++) {
      for(int y = 0; y < height/heightCount; y++) {   
        particles.add(new Particle(wideCount*x + random(-width/32,width/32), 
                                        heightCount*y + random(-height/32,height/32)));
        //particles.add(new Particle(wideCount*x, heightCount*y));
      }
    }
  }

  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
  
  void repel(Mover mov) {
    for (Particle p: particles) {
      float d = p.position.dist(m.position);
      if (d < p.radius) {
      PVector force = mov.repel(p);        
      p.applyForce(force);
      //PVector spring = PVector.sub(p.position, p.origin);
      //float f = spring.mag();
      //float stretch = f;
      //float k = 0.1;
      //spring.normalize();
      //spring.mult(-1 * k * stretch);
      //p.applyForce(spring);
      }
      PVector friction = p.velocity.get();
      float c = 0.01;
      friction.mult(-1);
      friction.normalize();
      friction.mult(c);
      p.applyForce(friction);
    }
  }
  void friction (Particle p) {
    //for 
      //PVector frictionPart = p.velocity.get();
      //float c = 0.1;
      //frictionPart.mult(-1);
      //frictionPart.normalize();
      //frictionPart.mult(c);
      //p.applyForce(frictionPart);
    }
  
  
  
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
    }
  }
}
