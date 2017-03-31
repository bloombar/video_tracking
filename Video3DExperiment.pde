/**
 * Video3DExperiment using Processing
 * based on Processing 3D example code code by Simon Greenwold.
 * 
 * a 3D cube with a webcam feed textured onto all sides
 */

//import video lib
import processing.video.*;

//Declare a capture object
Capture video;

PImage img;

//Read from the camera when a new image is available!
void captureEvent(Capture video) {
  video.read();
  
}

void setup() {
  scale(0.5);
  size(1280, 720, P3D);
  fill(204);
  
  //set the capture of video from default camera
  video = new Capture(this, 160, 120); //create capture object
  video.start(); //start capturing
}

void draw() {
  lights();
  background(0);

  // Change height of the camera with mouseY
  camera(mouseX-320, mouseY-180, 220.0, // eyeX, eyeY, eyeZ
//         mouseX-320, mouseY-180, 0.0, // centerX, centerY, centerZ
         (mouseX-320)/1.5, (mouseY-180)/2, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  
  TexturedCube();
  stroke(255);
  line(-100, 0, 0, 100, 0, 0);
  line(0, -100, 0, 0, 100, 0);
  line(0, 0, -100, 0, 0, 100);

}

void TexturedCube() {
  noStroke();
  fill(255);
  //box(90);
  
  beginShape(QUADS);
  textureMode(NORMAL);
  texture(video);

  //half the length of the cube sides
  int x = (int) 100/2;
  int y = (int) 75/2;
  int z = (int) 75/2;

  // +Z "front" face
  vertex(-x, -y,  z, 0, 0);
  vertex( x, -y,  z, 1, 0);
  vertex( x,  y,  z, 1, 1);
  vertex(-x,  y,  z, 0, 1);

  // -Z "back" face
  vertex( x, -y, -z, 0, 0);
  vertex(-x, -y, -z, 1, 0);
  vertex(-x,  y, -z, 1, 1);
  vertex( x,  y, -z, 0, 1);

  // +Y "bottom" face
  vertex(-x,  y,  z, 0, 0);
  vertex( x,  y,  z, 1, 0);
  vertex( x,  y, -z, 1, 1);
  vertex(-x,  y, -z, 0, 1);

  // -Y "top" face
  vertex(-x, -y, -z, 0, 0);
  vertex( x, -y, -z, 1, 0);
  vertex( x, -y,  z, 1, 1);
  vertex(-x, -y,  z, 0, 1);

  // +X "right" face
  vertex( x, -y,  z, 0, 0);
  vertex( x, -y, -z, 1, 0);
  vertex( x,  y, -z, 1, 1);
  vertex( x,  y,  z, 0, 1);

  // -X "left" face
  vertex(-x, -y, -z, 0, 0);
  vertex(-x, -y,  z, 1, 0);
  vertex(-x,  y,  z, 1, 1);
  vertex(-x,  y, -z, 0, 1);  
  
  endShape(); 
}