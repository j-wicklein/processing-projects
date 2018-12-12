class Triangle {
  float x1;
  float y1;
  float x2;
  float y2;
  float x3;
  float y3;

  float angle = 0;
  color c2;

  Triangle(float r) {
    x1=200*noise(t)+(width/2-160);
    y1=200*noise(t+2)+(height/2+160);
    x2=200*noise(t+3)+(width/2);
    y2=200*noise(t+4)+(height/2-160);
    x3=200*noise(t+5)+(width/2+160);
    y3=200*noise(t+6)+(height/2+160);

    c2= color(200, 200, r*20, 10);
  }

  void display() {
    fill(c2);
    //stroke(6);
    triangle(x1, y1, x2, y2, x3, y3);
  }

  void update(int i,float scl2) {  
    pushMatrix();
        rotate(PI/i*10);
        popMatrix();
    x1=(1+i)*60*noise(i+t)+(width/2-160);
    y1=(1+i)*60*noise(i+t+2)+(height/2+160);
    x2=(1+i)*60*noise(i+t+3)+(width/2);
    y2=(1+i)*60*noise(i+t+4)+(height/2-160);
    x3=(1+i)*60*noise(i+t+5)+(width/2+160);
    y3=(1+i)*60*noise(i+t+6)+(height/2+160);
    c2= color(100*noise(i*t), 10*noise(i*t), scl2,10);
    noStroke();
    fill(c2);
    
  }
}
//triangle(x1, y1, x2, y2, x3, y3)
