//P O L A R   N I G H T

//by Jana Wicklein & Eileen Nasert
//for SM2715L03 Creative Coding
//City University Hong Kong
//
// using resources from:
// Daniel Shiffman
// http://codingtra.in
// www.natureofcode.com
//
// looks best on medium large displays on full brightness in a dark environment



import processing.sound.*;

FlowField flowfield;
FlowField flowfield2;
FlowField flowfield3;
FlowField flowfield4;
ArrayList<Aurora1> green;
ArrayList<Aurora2> pink;
ArrayList<Aurora3> blue;
ArrayList<Aurora4> red;
PImage img; //mountain scenery
int num = 700; //number of stars
Stars[] stars = new Stars[num];
boolean debug = false; //in case something doesn't work
SoundFile song;
Amplitude amp;
float scl;

boolean greenaurora = false;
boolean pinkaurora = false;
boolean blueaurora = false;
boolean redaurora = false;
boolean text = true;

void setup() {
  fullScreen(P2D);
  for (int i=0; i<num; i++) {
    stars[i] = new Stars(); // create cicle oject for each array element i
  }
  img = loadImage("mountain4.png"); //loads backgound picture of mountains
  img.resize(width, 0); //resizes image to fit any screen


  song = new SoundFile(this, "Adagioindminor.aiff"); //Adagio in D Minor
  song.loop(); //repeats song infinitely
  amp = new Amplitude(this); //anaylse song amplitude
  amp.input(song);
  //initialise flowfields
  flowfield = new FlowField(19);
  flowfield2 = new FlowField(15);
  flowfield3 = new FlowField(16);
  flowfield4 = new FlowField(19);
  flowfield.update();
  flowfield2.update();
  flowfield3.update();
  flowfield4.update(); 
  //create aurorae
  green = new ArrayList<Aurora1>();
  for (int i = 0; i < 1000; i++) {
    PVector start = new PVector(width, random(200, 300));
    green.add(new Aurora1(start, random(2, 10), color(0, 234, 141, 70)));
  }

  pink = new ArrayList<Aurora2>();
  for (int i = 0; i < 1000; i++) {
    PVector start = new PVector(width, random(0, 200));
    pink.add(new Aurora2(start, random(2, 6), color(141, 0, 196, 60)));
  }

  blue = new ArrayList<Aurora3>();
  for (int i = 0; i < 1000; i++) {
    PVector start = new PVector(width, random(0, 400));
    blue.add(new Aurora3(start, random(6, 8), color(64, 224, 208, 70)));
  }

  red = new ArrayList<Aurora4>();
  for (int i = 0; i < 1000; i++) {
    PVector start = new PVector(width, random(0, 300));
    red.add(new Aurora4(start, random(6, 8), color(210, 32, 52, 90)));
  }
}

void draw() {
  //first: display text, if key is pressed create aurorae, depending on keys
  scl = int(map(amp.analyze(), 0, 0.1, 0, 1000));
  if (keyPressed) {
    if (key == '1') {
      if (greenaurora) {
        greenaurora = false;
      } else {
        greenaurora = true;
      }
      text = false;
    } else if (key =='2') {
      if (pinkaurora) {
        pinkaurora = false;
      } else {
        pinkaurora = true;
      }
      text = false;
    } else if (key == '3') {
      if (blueaurora) {
        blueaurora = false;
      } else {
        blueaurora = true;
      }
      text = false;
    } else if (key == '4') {
      if (redaurora) {
        redaurora = false;
      } else {
        redaurora = true;
      }
      text = false;
    } else if (key == 'p') {
      saveFrame();
      text = false;
    }

    delay (170);
  }
  

  background(70-(millis()/400), 5-millis()/5, 200-(millis()/500)*3, 90); //gradient nightsky blue
  //twinkling stars
  for (int i=0; i<num; i++) {
    stars[i].display(255, random(40, 80));
  }
  image(img, 0, height/2); //display background image
  //update & display flowfields in case of debug scenario
  flowfield.update();
  flowfield2.update();
  flowfield3.update();
  flowfield4.update();

  if (debug) flowfield.display();
  if (debug) flowfield2.display();
  if (debug) flowfield3.display();
  if (debug) flowfield4.display();

  //display different aurorae
  if (greenaurora) {
    for (Aurora1 p : green) {
      p.follow(flowfield);
      p.run();
    }
    if (scl> 300) {
      for (int j =0; j<scl; j+=30) {
        PVector start = new PVector(width, random(200, 300));
        green.add(new Aurora1(start, random(2, 6), color(0, 234, 141, 80)));
      }
      print("green: ");
      println(green.size());
    }
    //if (green.size() > 20000) {
    //  for (int k =0; k<1000; k++) {
    //    green.remove(0);
    //  }
    //  }

    for (int i = green.size() -1; i> 0; i--) {
      Aurora1 p = green.get(i);
      if (p.isDead()) {
        green.remove(i);
      }
    }
  }

  if (pinkaurora) {
    for (Aurora2 p : pink) {
      p.follow(flowfield2);
      p.run();
    }
    if (scl> 600) {
      for (int j =0; j<scl; j+=30) {
        PVector start = new PVector(width, random(200, 300));
        pink.add(new Aurora2(start, random(2, 6), color(141, 0, 196, 70)));
      }
      print("pink: ");
      println(pink.size());
    }
    for (int i = pink.size() -1; i> 0; i--) {
      Aurora2 p = pink.get(i);
      if (p.isDead()) {
        pink.remove(i);
      }
    }
  }

  if (blueaurora) {
    for (Aurora3 p : blue) {
      p.follow(flowfield3);
      p.run();
    }
    if (scl> 850) {
      for (int j =0; j<scl; j+=30) {
        PVector start = new PVector(width, random(200, 300));
        blue.add(new Aurora3(start, random(2, 6), color(64, 224, 208, 80)));
      }
      print("blue: ");
      println(blue.size());
    }
    for (int i = blue.size() -1; i> 0; i--) {
      Aurora3 p = blue.get(i);
      if (p.isDead()) {
        blue.remove(i);
      }
    }
  }
  if (redaurora) {
    for (Aurora4 p : red) {
      p.follow(flowfield4);
      p.run();
    }
    if (scl> 200) {
      for (int j =0; j<scl; j+=30) {
        PVector start = new PVector(width, random(200, 300));
        red.add(new Aurora4(start, random(2, 6), color(210, 32, 52, 70)));
      }
      print("red: ");
      println(red.size());
    }
    for (int i = red.size() -1; i> 0; i--) {
      Aurora4 p = red.get(i);
      if (p.isDead()) {
        red.remove(i);
      }
    }
  } //display initial text
  else if (text) {
    textSize(40);
    fill(255);
    text("P  O  L  A  R      N  I  G  H  T", width/3.5, height/3.5);
    textSize(18);
    text("press 1, 2, 3 or 4 to create aurorae", width/2.7, height/2.7);
    text("press P to take a screenshot", width/2.5, height/2.5);
    text("enjoy the night!", width/2.3, height/2.3);
  }
}
