class Circle2 {
  float x= 0; // x coordintate 
  float y= 0; // y coordintate 
  float d= 0; // diameter
  float nd = 0; //new diameter
  color c; //colour
  
  
 Circle2(float s){
    x=random(0, width);
    y=10;
   d= s;
   c= color(60,0,scl*10);
 }
 
 void update(){
   //x= x+scl;
   y= 1.1*y+cos(scl*5*noise(t+4));
   x= x+sin(scl*3*noise(t));
   c= color(100, 2, scl*10);
   fill(c);
   d= scl*0.7;
   
 }
 
 void display(){
  fill(c);
  ellipse(x,y,d,d);
 }
}
