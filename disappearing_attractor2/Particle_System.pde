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

  int wideCount = width / unit;
  int heightCount = height / unit;
  count = wideCount * heightCount;
  p = new Particle[count]; 
  int index = 0;
    for(int x = 0; x < wideCount; x++) {
      for(int y = 0; y < heightCount; y++) {   
        particles.add(new Particle(wideCount*x + random(-width/32,width/32), 
                                        heightCount*y + random(-height/32,height/32)));
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
    }
  }
  
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
    }
  }
}
