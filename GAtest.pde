ArrayList<food> f = new ArrayList<food>();
ArrayList<entity> e = new ArrayList<entity>();

void setup() {
  size(600,600);
  noStroke();
  for(int i = 0; i < 50; i++) {
    f.add(new food((int)random(width), (int)random(height)));
  }
  spawn();
}

void draw() {
  background(255);
  if(e.size() == 0) {
    spawn();
  }
  if(random(1) < .05) {
    f.add(new food((int)random(width), (int)random(height)));
  }
  
  for(int i = 0; i < f.size(); i++) {
    f.get(i).render();
  }
  for(int i = 0; i < e.size(); i++) {
    if(e.get(i).health <= 0) {
      f.add(new food(e.get(i).x, e.get(i).y));
      e.remove(i);
    } else {
      e.get(i).render();
      
      for(int fi = 0; fi < f.size(); fi++) {
      if(e.get(i).x - e.get(i).r/2 < f.get(fi).x && e.get(i).x + e.get(i).r/2 > f.get(fi).x) {
        if(e.get(i).y - e.get(i).r/2 < f.get(fi).y && e.get(i).y + e.get(i).r/2 > f.get(fi).y) {
          f.remove(fi);
          e.get(i).health += 20;
        }
      }
    }
    }
  }
}

void spawn() {
  for(int i = 0; i < 20; i++) {
    e.add(new entity((int)random(width), (int)random(height), (int)random(100)));
  }
}