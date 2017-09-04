class food {
  int x;
  int y;
  
  
  public food(int x, int y) {
     this.x = x;
    this.y = y;
  }
  
  void render() {
    fill(0,255,0);
    ellipse(x,y,10,10);
  }
}