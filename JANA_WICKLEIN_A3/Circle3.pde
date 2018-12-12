class Circle3 {
  float x= 0; // x coordintate 
  float y= 0; // y coordintate 
  float d= 0; // diameter
  float nd = 0; //new diameter
  color c; //colour
  
  
 Circle3(float s){
    x=random(0, width);
    y=10;
   d= s;
   c= color(60,0,scl*10);
 }
 
 void update(){
   //x= x+scl;
   y= 1.1*y+cos(scl*5*noise(t+4));
   x= x+sin(scl*3*noise(t));
   pushMatrix();
   rotate(PI/scl);
   popMatrix();
   c= color(255-5*scl, 255-3*scl, 255-scl);
   fill(c,10);
   d= scl*0.4;
   
 }
 
 void display(){
  fill(c);
  ellipse(x,y,d,d);
 }
}
