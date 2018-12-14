public class Aurora3 {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxSpeed;
  float eoff = 10;
  color co = 255;
  float lifespan;

   
    Aurora3(PVector start, float maxspeed, color col) {
    maxSpeed = maxspeed;
    pos = start;
    co = col;
    lifespan = random(300.0, 600.0);
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
    //line(pos.x, pos.y, previousPos.x, previousPos.y);
    line(pos.x, pos.y, pos.x-(noise(eoff))*20, pos.y+(noise(0.5*eoff)*140));
    //point(pos.x, pos.y);
    eoff += 0.01;
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
      pos.y = random(0,height/2);
      //pos.y = random(0,100);
    }
    if (pos.y < 0) {
      pos.y = height;
    }
  }

  void follow(FlowField flowfield3) {
    int x = floor(pos.x / flowfield3.scl);
    int y = floor(pos.y / flowfield3.scl);
    int index = x + y * flowfield3.cols;
    
    PVector force = flowfield3.vectors[index];
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
