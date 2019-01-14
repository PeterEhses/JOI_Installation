import gab.opencv.*; import processing.video.*; import java.awt.Rectangle;

import controlP5.*;
import javax.media.jai.*;
import jto.processing.sketch.mapper.*;


// --- RECOG THREAD ---
int faceframe;
int frame;
int img_x;
int img_y;
Capture cam; 
OpenCV opencv; 
Rectangle[] faces;
 PGraphics emask;
 PImage d;
 PImage c;
 PGraphics e;
boolean recogdone;
boolean recogsucc;
boolean umapdone;



 
void setup() {  //<>//
  size(2000, displayHeight, P3D);
  String[] fontList = PFont.list();
//printArray(fontList);
  cam = new Capture( this, 1280, 720 , 30); 
  cam.start(); 
  //opencv = new OpenCV(this, cam.width, cam.height); 
  opencv = new OpenCV(this, 128, 72); 
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  ellipseMode(CORNER);
 emask = createGraphics(1280,720);
 e = new PGraphics();
 frame = 40;
 faceframe = 0;
 recogdone = true;
 recogsucc = false;
 umapdone = false;
 c = cam.get();
 frameRate(240);
 
 
 println("setup 0");
 
}
 
int firstTime = 0;

void technicallyNotASetup(){
  firstTime = 1;
  setupAnimation();
  setupStyle();
  setupJson();
  setupParticles();
  setupTimer();  
  println("1st subsetup");
} 

void technicallyNotAnotherSetup(){
  firstTime = 2;
   setupTitle();
   setupIdle();
 println("2nd subsetup");
}

void technicallyNotAThirdSetup(){
  firstTime = 3;
  setupTop();
  setupRecog();
  setupSketchMapper();
  println("3rd subsetup");
}
 
void draw() {  //<>//
  if(firstTime == 0){
    technicallyNotASetup();
  } else if (firstTime == 1){
    technicallyNotAnotherSetup();
  } else if (firstTime == 2){
    technicallyNotAThirdSetup();
    
  }else{

    
    animationDraw();

    
    

    drawJson();
    drawTimer();
    animationEnd();

    drawTitle();

    drawTop();

    

    drawSketchMapper();

    //println(frameRate);
    //debugInfo(); //<>//
  }
}
 

 
 
void captureEvent(Capture cam) { 
  cam.read();
}

void debugInfo(){
  noStroke();
    textAlign(CENTER); 
    textSize(50); 
    //println("no faces");
    fill(0, 0, 0); 
    rect(25,50,470,60);
    fill(255, 0, 0); 
    text(faceframe, 400, 100);
    text(frameRate, 100, 100);
  noFill();
  stroke(255,0,0);
}
