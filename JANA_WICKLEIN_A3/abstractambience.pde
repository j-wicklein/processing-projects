import processing.sound.*;

SoundFile song ;
Amplitude amp;
FFT fft;
int bands = 64;
float[] spectrum = new float[bands];
float scl, scl2, scl3;
int threshold =5;
float t= 0;
int scale = 20;

int time1 = 20000;
int time2 = 40000;
int time3 = 60000;
int time4 = 80000;
int time5 = 100000;
int time6 = 200000;
int time7 = 300000;


Circle [] circles = new Circle[0];
Circle2 [] circles2 = new Circle2[0];
Circle3 [] circles3 = new Circle3[0];
Triangle [] triangles = new Triangle[0];


void setup () {
  fullScreen();
  background(255);
  song = new SoundFile(this, "wald.aiff");
  song.play();
  amp = new Amplitude(this);
  amp.input(song);

  fft = new FFT(this, bands);
  fft.input(song);
  noStroke();
  Triangle tri1 =new Triangle(scl);
  triangles = (Triangle [])append(triangles, tri1);
  Triangle tri2 =new Triangle(scl);
  triangles = (Triangle [])append(triangles, tri2);
  Triangle tri3 =new Triangle(scl);
  triangles = (Triangle [])append(triangles, tri3);
}


void draw() {

  scl = int(map(amp.analyze(), 0, 0.1, 0, 6));
  scl2 = int(map(amp.analyze(), 0, 0.2, 0, 200));
  scl3 = int(map(amp.analyze(), 0, 0.3, 0, 180));


  int time = millis();

  if (time<time1) {
  fill(scl3/50, noise(t)*50, scl*10, 10);
  rect(0, 0, width, height); 
    drawCircles();
  }
  
  else if (time >time1 && time < time2) {
      fill(noise(t)*40, noise(t)*10, scl*15, 4);
      rect(0, 0, width, height); 
    drawCircles2();
    
  }
  
  else if (time > time2 && time < time3) {
  fill(scl2, scl3, 30+noise(t)*10, 10); //yellowish ambient colors
  //fill(scl2/50,noise(t)*50,scl3, 10);
  //fill(scl3/50,noise(t)*50,scl*10, 10);
  rect(0, 0, width, height);
  drawTriangles();
    
  }
  
    else if (time > time3 && time < time4) {
  fill(scl2, scl3, 30+noise(t)*10, 10); //yellowish ambient colors
  //fill(scl2/50,noise(t)*50,scl3, 10);
  //fill(scl3/50,noise(t)*50,scl*10, 10);
  rect(0, 0, width, height);
  drawTriangles();
  drawDawn();
    
  }
  
      else if (time > time4 && time < time5) {
  //fill(scl2, scl3, 30+noise(t)*10, 10); //yellowish ambient colors
  fill(scl2/30,noise(t)*50,scl3, 10);
  //fill(scl3/50,noise(t)*50,scl*10, 10);
  rect(0, 0, width, height);
  drawTriangles();
  drawDawn();
  drawCircles();
    
  }
  
        else if (time > time5 && time < time6) {
  //fill(scl2, scl3, 30+noise(t)*10, 10); //yellowish ambient colors
  //fill(scl2/30,noise(t)*50,scl3, 10);
  fill(scl3/50,noise(t)*50,scl*10, 10);
  rect(0, 0, width, height);
  drawTriangles();
  drawDawn();
  drawCircles();
  drawCircles2();
    
  }
  
  else if (time > time6 && time < time7) {
  //fill(scl2, scl3, 30+noise(t)*10, 10); //yellowish ambient colors
  fill(scl2/30,noise(t)*50,scl3, 10);
  //fill(scl3/50,noise(t)*50,scl*10, 10);
  rect(0, 0, width, height);
  drawDawn();
  drawCircles2();
    
  }

  else {
    fill(noise(t+1)*60,noise(t)*50,scl*10, 10);
    rect(0, 0, width, height);
    drawDawn();
    drawCircles3();
  }

  t= t+0.1;
}


void drawCircles() {
  println("Circles"+circles.length);

  
   if (scl> threshold) {
      Circle ci= new Circle(scl);
      circles = (Circle [])append(circles, ci);
    }

    if (circles.length>1000) {
      circles = new Circle[0];
    }

    for (int i = 0; i < circles.length; i++) {
      circles[i].display();

      circles[i].update();
    }
}


void drawCircles2() {
  println("Circles2 "+circles2.length);

  
   if (scl> threshold) {
      Circle2 ci2= new Circle2(scl);
      circles2 = (Circle2 [])append(circles2, ci2);
    }

    if (circles2.length>2000) {
      circles2 = new Circle2[0];
    }

    for (int i = 0; i < circles2.length; i++) {
      circles2[i].display();
      circles2[i].update();
    }
}

void drawCircles3() {
  println("Circles3 "+circles3.length);

  
   if (scl> threshold) {
      Circle3 ci3= new Circle3(scl);
      circles3 = (Circle3 [])append(circles3, ci3);
    }

    if (circles3.length>2000) {
      circles3 = new Circle3[0];
    }

    for (int i = 0; i < circles3.length; i++) {
      circles3[i].display();
      circles3[i].update();
    }
}


void drawTriangles() {
    println("Triangles");

    for (int i=0; i< triangles.length; i++) {
    triangles[i].display();
      triangles[i].update(i, scl2);
    }
}


void drawDawn() {
    println("Dawn");
    noStroke();
      fft.analyze(spectrum);
      for (int i = 0; i< bands; i++) {
        float y= map(spectrum[i], 0, 0.1, height, 0);
        //fill(i*50,i*2,255-i*5);
        fill(i*8, 8);
        //rect( i*30, y, 80, height-y );
        rect( i*30, y, width, height-y/3 );
      }
    }
