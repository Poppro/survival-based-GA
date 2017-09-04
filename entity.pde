class entity {
  int x;
  int y;
  int r;
  PVector vel;
  PVector acc;
  float run = (int)random(5000);
  double health;
  
  public entity(int x, int y, int r) {
    this.x = x;
    this.y = y;
    this.r = r;
    vel = new PVector(0,0);
    health = 100;
  }
  
  void render() {
    health -= .3;
    run += 1;
    acc = new PVector(random(-5,5), random(-5,5));
    vel.x += random(-5,5);
    vel.y += random(-5,5);
    x += vel.x/(r/2);
    y += vel.y/(r/2);
    
    if(y > height) {
      y = 1;
    }
    if(x > width) {
      x = 1;
    }
    if(x < 0) {
      x = width - 1;
    }
    if(y<0) {
      y = height - 1;
    }
    
    if(random(1) < .001) {
      e.add(new entity(x,y,r + (int)random(-5,5)));
    }
    
    fill(0, (float)(health/100*255));
    ellipse(x,y, r, r);
  }
}