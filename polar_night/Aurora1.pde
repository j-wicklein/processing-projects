public class Aurora1 {
  PVector pos; // position
  PVector vel; //velocity
  PVector acc;  //acceleration
  float maxSpeed; 
  float doff = 0; //height of lines
  color co; 
  float lifespan;
   
  Aurora1(PVector start, float maxspeed, color col) {
    maxSpeed = maxspeed;
    pos = start;
    co = col;
    lifespan = random(100.0, 600.0);
    vel = new PVector(2, 0);
    acc = new PVector(0, 0);
  }
  void run() {
    update();
    edges();
    show();
  }
  void update() {
    pos.add(vel);
    vel.limit(maxSpeed);
    vel.add(acc);
    acc.mult(0);
    lifespan -=2.0;
  }
  void applyForce(PVector force) {
    acc.add(force); 
  }
  void show() {
    stroke(co, 12); // aurora color
    strokeWeight(1);
    line(pos.x, pos.y, pos.x-5-(noise(doff))*20, pos.y+(noise(0.5*doff)*200));
    doff += 0.1;
  }
  void edges() {
    if (pos.x > width) {
      pos.x = 0;
    }
    if (pos.x < 0) {
      pos.x = width;    
    }
    if (pos.y > height-400) { //aurora should only appear on the top half of the screen
      pos.x =0;
      pos.y = random(0,height/3);
    }
    if (pos.y < 50) {
      pos.y = height/2;
    }
  }
  
  
  void follow(FlowField flowfield) {
    int x = floor(pos.x / flowfield.scl);
    int y = floor(pos.y / flowfield.scl);
    int index = x + y * flowfield.cols;
    
    PVector force = flowfield.vectors[index];
    applyForce(force);
  }

  //fade polar lights
  boolean isDead() {
    if (lifespan < 0.0){
      return true;
    }
    else {
      return false;
    }
  }
  
  
}
