//creates beautiful animations straight from space
//Jana Wicklein
//Oct. 2018

PImage img;
int k= 0;
char e ='1';
float xo;
float yo;


void setup() {
  fullScreen();
  background(0);

  xo = width/2;
  yo = height/2;

  frameRate(30);
}



void draw() {
//depending on which key is pressed, another image is shown
  if ( key >= '0' && key <= '9') {
    e = key;
  }

  String imagename =(e+".jpg");
  img = loadImage(imagename);
  //translate to the center
  translate(xo, yo);
  //load pixels of image

  loadPixels();
  img.loadPixels();



  //go through the pixels, every 10th in this case
  for (int x = 0; x < img.width; x+=10 ) {
    for (int y = 0; y < img.height; y+=10 ) {

      // Calculate location pf pixels and get the color values of pixels in image
      int loc = x + y*img.width;

      float r = red  (img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue (img.pixels[loc]);

      //make it interactive with mouse distance that changes the brightness
      float d= dist(mouseX, mouseY, x, y);
      float adjustBrightness = map(d, 0, 250, 6, 1); 

      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      //color values have to stay between 0 & 255
      r = constrain(r, 0, 255); 
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Make new color and set pixel
      color c = color(r, g, b, 50);
      fill(c);

      noStroke();  //no outline

      //different rotations to get a space effect
      rotate(PI/k);

      //create triangles from the pixels

      triangle(x, y-10, x-10, y+10, x+10, y+10);
    }
  }
}

void keyPressed() {
  if (key==' ') {
    if (k==200) {
      k =0;
    } else {
      k++;
    }
  }
}



void mousePressed() {
  background(0);
  loop();
}
