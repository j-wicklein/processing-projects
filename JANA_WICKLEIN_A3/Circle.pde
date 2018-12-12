class Circle {
  float x= 0; // x coordintate 
  float y= 0; // y coordintate 
  float d= 0; // diameter
  float nd = 0; //new diameter
  color c; //colour
  
  
 Circle(float s){
    x= map(noise(t),0,1,0,30);
    y= map(noise(t+2),0,1,height/1.5 -50, height/1.5 + 50);
    
   d= s;
   c= color(60,0,scl*10);
 }
 
 void update(){
   //x= x+scl;
   //y= y+scl;
   
   //y=y+scl*4*noise(2*t*scl);
   x=x+scl*4*noise(2*t*scl);
   c= color(100, 2, scl*10);
   stroke(1,13);
   fill(c);
   d= scl*4;
   
 }
 
 void display(){
  fill(c);
  ellipse(x,y,d,d);
 }
}
