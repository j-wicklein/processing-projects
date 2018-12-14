public class FlowField {
  PVector[] vectors;
  int cols, rows;
  float inc = 0.06;
  float zoff = 0;
  int scl;
  //flowfield consisting of rotating vectors dictating the directions of the moving particles/aurorae
  FlowField(int res) {
    scl = res;
    cols = floor(width / res) + 1;
    rows = floor(height / res) + 1;
    vectors = new PVector[cols * rows];
  }
  //update flowfield with perlin noise
  void update() {
    float xoff = 0;
    for (int y = 0; y < rows; y++) { 
      float yoff = 0;
      for (int x = 0; x < cols; x++) {
        float angle = noise(xoff, yoff, zoff) * TWO_PI *2;
        
        PVector v = PVector.fromAngle(angle);
        v.setMag(2);
        int index = x + y * cols;
        vectors[index] = v;
       
        xoff += inc;
      }
      yoff += 3*inc;
      
    }
    zoff += 0.004;
  }
  
  //display vectors, but only neccesary in case of debug
  void display() {
    for (int y = 0; y < rows; y++) { 
      for (int x = 0; x < cols; x++) {
        int index = x + y * cols;
        PVector v = vectors[index];
        
        stroke(255, 255, 255, 90);
        strokeWeight(0.2);
        pushMatrix();
        translate(x * scl, y * scl);
        rotate(v.heading());
        line(0, 0, scl, 0);
        popMatrix();
      }
    }
  }
}
