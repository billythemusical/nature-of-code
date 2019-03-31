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
    //particles.add(new Particle(origin));
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
  
  void applyMover(Mover r) {
    for (Particle p: particles) {
      PVector force = r.move(p);        
      p.applyForce(force);
    }
  }
  
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
    }
  }

  //void applyRepeller(Repeller r) {
  //  for (Particle p: particles) {
  //    PVector force = r.repel(p);        
  //    p.applyForce(force);
  //  }
  //}

}
