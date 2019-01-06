

class IdleLine{
  PVector location;
  PVector direction;
  color n;
  float mult;
  float maxlen;
  float speed;
  IdleLine(PVector l, int dir){
    location = l.get();
    setAngle(dir);
    setColor(dir);
    speed = random(0.5,1);
    mult = 0;
    maxlen = (int(random(-3,3))*100);
    if(maxlen == 0){
      maxlen = 50;
    }
  }
  
  void setAngle(int dir){
    float angle = dir*60;
    float theta = radians(angle);
    direction = new PVector(cos(theta),sin(theta));
  }
  
  void setColor(int dir){
    switch(dir){
    case 0:
     n = cyan;
    
    break;
    
    case 1:
     n = yellow;
    
    break;
    
    case 2:
     n = rose;
    
    break;
    }
  }
  
  void math(){
    if (abs((mult*speed))>=maxlen){
    speed = -speed;
    }
    mult += speed;
  }
  
  void render(PGraphics context){
    context.blendMode(MULTIPLY);
    context.noFill();
    context.stroke(n);
    context.strokeWeight(10);
    context.line(location.x,location.y,(location.x+direction.x*mult),(location.y+direction.y*mult));
  }
}


ArrayList<IdleLine> lines;

void setupIdle(){
    lines = new ArrayList<IdleLine>();
    for (int i = 0; i < 200; i++) {
      lines.add(new IdleLine( new PVector(int(random(width/100))*100,int(random(height/86))*86) , int(random(2.99))) );
    }
    
}

void drawIdle(){
  anim.background(255,0);
  for (IdleLine l : lines){
    l.math();
  l.render(anim);
  }
}
