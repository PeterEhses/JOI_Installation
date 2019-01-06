void setupTop(){
  
  maskthing.beginDraw();
  maskthing.background(0);
  maskthing.fill(255);
  maskthing.noStroke();
  maskthing.ellipseMode(CORNER);
  maskthing.ellipse(0,0,maskthing.width,maskthing.height);
  maskthing.endDraw();
  
  // Creates a gradient of 255 colors between color1 and color2
  for (int d=0; d < 256; d++) {    
    float ratio= float(d)*0.00392156862745; // 1/255
    gradient[d]=lerpColor(red,white,ratio);
  }
  
  effigy = new PImage();
}

color gradient[] = new color[257];

PImage effigy;

void drawTop(){
  top.beginDraw();
  top.clear();
  top.background(0);
  top.ellipseMode(CORNER);
  
  top.fill(255);
  top.noStroke();
  top.ellipse(0,0,top.width,top.height);
  
  if(recogdone){
      recogdone = false;

    if(recogsucc){
     //recogsucc = false;
     effigy = c.get();
     effigy.resize(top.width,0);
     effigy.filter(GRAY);
     int dim = effigy.width*effigy.height;
     effigy.loadPixels();
     for(int i = 0; i < dim; i++){
       int br = int(brightness(effigy.pixels[i]));
       //println(gradient[br]);
       effigy.pixels[i] = gradient[br];
       
     }
     effigy.updatePixels();
     //effigy.filter(INVERT);
     thread("waitForAThing");
    }  else {
      thread("facerecog");
    }
  }
  top.imageMode(CENTER);
  if (recogsucc){
    
    top.image(effigy,top.width/2,top.height/2); //img_x,img_y
  } else {
  top.image(logo,top.width/2,top.height/2);
  }
  titlehandler.render(top);
  
  top.endDraw();
  top.mask(maskthing);
  image(top,0,0);
}
