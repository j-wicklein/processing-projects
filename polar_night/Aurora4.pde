public class Aurora4 {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxSpeed;
  float foff = 10;
  color co = 255;
  float lifespan;
   
    Aurora4(PVector start, float maxspeed, color col) {
    maxSpeed = maxspeed;
    pos = start;
    co = col;
    lifespan = random(300.0, 600.0);
    vel = new PVector(3, 0);
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
    lifespan -=2.0; //reduce lifespan while running
  }
  void applyForce(PVector force) {
    acc.add(force); 
  }
  void show() {
    stroke(co, 12); // aurora color
    strokeWeight(1);
    line(pos.x, pos.y, pos.x-(noise(foff))*20, pos.y+(noise(0.5*foff)*140));
    foff += 0.02;
  }
  void edges() {
    if (pos.x > width) {
      pos.x = 0;
    }
    if (pos.x < 0) {
      pos.x = width;    
    }
    if (pos.y > height-600) { //red aurora should only appear on the top of the screen
      pos.x =0;
      pos.y = random(0,height/3);
      //pos.y = random(0,100);
    }
    if (pos.y < 0) {
      pos.y = random(50,height);
    }
  }
  //make particles follow the force of the flowfield
  void follow(FlowField flowfield4) {
    int x = floor(pos.x / flowfield4.scl);
    int y = floor(pos.y / flowfield4.scl);
    int index = x + y * flowfield4.cols;
    
    PVector force = flowfield4.vectors[index];
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
