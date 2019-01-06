PGraphics anim;
PGraphics textimg;

PGraphics maskthing;
PGraphics top;

PImage logo;

float bgChangeVal = +1;
float currentValue = 255;


void setupAnimation(){
  logo = loadImage("./data/logo.png");
  anim = createGraphics(width, height, P3D);
  textimg = createGraphics(width, height, P3D);
  top = createGraphics(height, height, P3D);
  maskthing = createGraphics(height, height, P3D);
  
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
  image(anim,0,0);;           
}

void BGtoPoint(){
  if( 0 <= currentValue && currentValue <= 255){
  currentValue += bgChangeVal;
  }
}
