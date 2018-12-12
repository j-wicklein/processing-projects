// two animations that work with noise combined into one program
// user can chose by pressing either 1 or another key which one should appear
// both animation work with rotations and circles, so they fit together visually
//
//Jana Wicklein

// angle of rotation
float angle = 0;
float t = 0;

int count =20; //number of objects


float[] ox = new float[count]; // x coordinate of the objects
float[] oy = new float[count]; // y coordinate of the objects
float[] os = new float[count]; //size
float[] or = new float[count];
float[] r_noise = new float[count];
float[] theta = new float[count];

void setup() {
  fullScreen();
  background(0);

  for (int i = 0; i< count; i++) {
    ox[i] = random(0, width);
    oy[i] = random(0, height);
    os[i] = random (2, 8);
    or[i] = random(3,12);
    r_noise[i] = or[i] + noise(t +44);
    //r_noise[i] = random(2,5);
    theta[i] = random(0, i);
   //theta[i] = 1;
    
  } 
}

void draw() {
  textSize(9);
  fill(255);
  text("move mouse left or right, press 1 or 2", 12, 12); 
  float d= map(mouseX, 0, width, 0, 28);
  fill(0,d);
  rect(0,0, width, height);
  stroke(0,99);
  
  if (key == '1'){
  

  float x = noise(t) *width;
  float y = noise(t +10) *height;

  // First centerobject, level 1
  translate(x, y);
  fill(noise(t+10)*255-100, noise(t+20)*255, noise(t+20)*255);
  ellipse(0, 0, 10+noise(t)*70, 10+noise(t)*70);

  // Second object, rotating around the first one, level 2
  //pushMatrix and popMatrix to make sure each object is rotating around the correct object
  pushMatrix();
  rotate(angle);
  translate(100, 0);
  fill(noise(t+10)*255-100, noise(t+20)*255-100, noise(t+20)*255);;
  ellipse(0, 0, 7+noise(t+5)*40, 7+noise(t+6)*40);

  // Third Object rotating around the second one, level 3

  pushMatrix(); 
  rotate(-angle*5);
  translate(40, 0);
  fill(noise(t*3)*50, noise(t*2)*255, 200);
  ellipse(0, 0, 12, 12);
  popMatrix();

  // Forth Object, also rotating around the second one, level 3
  pushMatrix();
  rotate(angle*4);
  translate(23, 4);
  fill(noise(t*10)*255, noise(t*10)*255+200, noise(t*20)*200);
  ellipse(0, 0, 6, 6);
  popMatrix();
  popMatrix();
  
  //level 2 object
  pushMatrix();
  rotate(-angle);
  translate(0, 100);
  fill(noise(t+100)*255-100, noise(t+200)*255-100, noise(t+200)*255);;
  ellipse(0, 0, 20, 20);
  
  // level 3
  pushMatrix(); 
  rotate(-angle*2);
  translate(50, 0);
  fill(noise(t+12)*50, noise(t*2+40)*100, noise(t+4)*255);
  ellipse(0, 0, 28, 28);
  popMatrix();
  
    // level 3
  pushMatrix(); 
  rotate(-angle*0.7);
  translate(100, 100);
  fill(noise(t*9)*255, noise(t*2)*50, noise(t+4)*200);
  
  ellipse(0, 0, 10, 10);
  popMatrix();
  
    //level 4, object revolving around the level 3 one
  pushMatrix(); 
  rotate(angle);
  translate(40, 0);
  //fill(noise(t+70)*20, noise(t*2+40)*255, noise(t+4)*255);
  fill(250-(1+noise(t+10)*30), 255-(1+noise(t+20)*40), 255-(1+noise(t+30)*5));
  ellipse(0, 0, 10, 10);
  popMatrix();
  popMatrix();

  
  angle += 0.03;
  t = t+ 0.006;
  
  }
  if (key == '2'){
 
      float x = noise(t*2) *width;
  float y = noise(t*2 +10) *height;
  float s = noise(t *2)*50;

  
  
  // little circles
//  pushMatrix();
  for (int i = 0; i < count; i++){
    pushMatrix();
    translate(x,y);
    
    ox[i]= 0 + (r_noise[i] *cos(or[i])*14);
    oy[i]= 0 + (r_noise[i] *sin(or[i])*14);
    //ox[i] = lerp(x, ox[i], .95); //creates a location near x, maybe replace with radius of target
    //oy[i] = lerp(y, oy[i], .95); // creates y value near y of target
    noStroke();
    fill(noise(3*i*t+10)*150, noise(3*i*t+20)*255, 200);
    
    rotate(theta[i]);
    
    
    //ellipse(ox[i]+i*random(-1,1)*2, oy[i]+i*random(-1,1)*2, os[i], os[i]);
    ellipse(ox[i]+i, oy[i]+i, os[i], os[i]);
    theta[i]= theta[i]+1;
    popMatrix();
  }
  //  popMatrix();
  //target

  fill(noise(t)*255, 50, 100+noise(t*2)*250);
  ellipse(x,y,s,s);

  t = t+ random(0.0002, 0.002);

}
}
