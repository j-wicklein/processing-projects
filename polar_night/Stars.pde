public class Stars {
  float x, y, s, d;
  
  Stars(){
    x = random(width);
    y = random(height/1.2);
    s = random (0.09,2);
    d= random (0,100);
}

void display(float c, float d){
  noStroke();
  ellipse(x,y,s,s);
  fill(c,d);
}
}
