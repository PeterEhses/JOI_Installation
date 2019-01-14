PGraphics anim;
PGraphics textimg;

PGraphics maskthing;
PGraphics top;

PImage logo;

float bgChangeVal = +1;
float currentValue = 0;


void setupAnimation(){
  logo = loadImage("./data/logo.png");
  anim = createGraphics(width, height, P3D);
  textimg = createGraphics(width, height, P3D);
  top = createGraphics(height/3*2, height/3*2, P3D);
  maskthing = createGraphics(top.height, top.height, P3D);
  
}
void animationDraw(){
  textimg.textFont(sofiapro);
  anim.beginDraw();
  anim.clear();
  anim.blendMode(BLEND);
  anim.strokeWeight(1);
  anim.textFont(sofiapro);;}
void animationEnd(){
  
  
  anim.endDraw();
  //fill(0,10);
  //rect(0,0,width,height);
  BGtoPoint();
  background(currentValue);
  image(anim,0,0);           
}

void BGtoPoint(){
  if( 0 <= currentValue+bgChangeVal && currentValue+bgChangeVal <= 255){
  currentValue += bgChangeVal;
  }
}
