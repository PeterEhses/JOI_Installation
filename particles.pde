class Field{
  //adapted from shiffman: nature of code, flow field class
  PVector[][] field;
  int col;
  int row;
  int res;
  float zoff;
  float intensity;
  Field(int r){
    res = r;
    row = height/res;
    col = width/res;
    field = new PVector[col][row];
    update();
    zoff = 0;
  }
  void update(){
    noiseSeed(1);
    zoff += 0.01;
    float xoff = 0;
    for(int i = 0; i < col; i++){
      float yoff = 0;
      for(int j = 0; j < row; j++){
        float theta = map(noise(xoff,yoff,zoff),0,1,0,TWO_PI);
        field[i][j] = new PVector(cos(theta),sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }
  PVector lookup(PVector look){
    int lcol = int(constrain(look.x/res,0,col-1));
    int lrow = int(constrain(look.y/res,0,row-1));
    return field[lcol][lrow].get();
  }
  
  void display() {
    for (int i = 0; i < col; i++) {
      for (int j = 0; j < row; j++) {
        drawVector(field[i][j],i*res,j*res,res-2);
      }
    }

  }
  
  
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    // Translate to position to render vector
    translate(x,y);
    stroke(0,255,0);
    // Call vector heading function to get direction (note that pointing to the right is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0,0,len,0);
    //line(len,0,len-arrowsize,+arrowsize/2);
    //line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }
}


class Boid{
  //based on shiffman: nature of code, vehicle class
  float maxspeed;
  float maxforce;
  String textvar;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  color myColor;
  float depth;
  float r;
  float w;
  float h;
  Boid(PVector l, float m, float z, String te, color co){
    depth = z;
    textvar = te;
    location = l.get();
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    mass = m;
    w = mass*10;
    myColor = co;
    h=mass*10;
    r=(w+h)/2;
    
    maxspeed = 10/m;
    maxforce = 2;
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    f.div(mass);
  acceleration.add(f);
  }
  
  void center(){
    float centerv = -(location.y-(height/2));
    PVector centersteer = new PVector(0.0,centerv);
    centersteer.mult(maxspeed);
    centersteer.limit(maxforce/2);
    applyForce(centersteer);
  
  }
  
   void separate (ArrayList<Boid> boids) {
     float desiredseparation = r;
     PVector sum = new PVector();
     int count = 0;
     for (Boid other : boids) {
       float d = PVector.dist(location, other.location);
       if ((d > 0) && (d < desiredseparation+other.r)) {
         PVector diff = PVector.sub(location, other.location);
         diff.normalize();
         diff.div(d);
         sum.add(diff);
         count++;
       }
     }
     if (count > 0) {
        sum.div(count);
        sum.normalize();
        sum.mult(maxspeed);
        PVector steer = PVector.sub(sum, velocity);
        steer.limit(maxforce);
        applyForce(steer);
     }
   }
  
  void follow(Field flow) {
    PVector desired = flow.lookup(location);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void edges(){
    if(location.x-w > width){location.x=0-w;}
    if(location.y-h > height){location.y=0-h;}
    if(location.x+w < 0){location.x=width+w;}
    if(location.y+h < 0){
      applyForce(new PVector(0,5));
      //location.y=height+h;
    }
    if(location.y+h > 0){
      if(location.y+h < 20){
        applyForce(new PVector(0,20-location.y));
      }
    }
  }
  
  void update(){
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);
  }
  
  void render(PGraphics context){
    context.fill(myColor);
    context.ellipse(location.x,location.y,mass*10,mass*10);
  }
  void render3D(PGraphics context){
    context.colorMode(HSB);
    context.fill(mass*10,255,255,50+(mass*20));
    context.beginShape();
    context.vertex(this.location.x-mass*5,this.location.y-mass*5,this.depth);
    context.vertex(this.location.x,this.location.y-mass*7,this.depth);
    context.vertex(this.location.x+mass*5,this.location.y-mass*5,this.depth);
    context.vertex(this.location.x+mass*7,this.location.y,this.depth);
    context.vertex(this.location.x+mass*5,this.location.y+mass*5,this.depth);
    context.vertex(this.location.x,this.location.y+mass*7,this.depth);
    context.vertex(this.location.x-mass*5,this.location.y+mass*5,this.depth);
    context.vertex(this.location.x-mass*7,this.location.y,this.depth);
    context.endShape(CLOSE);
    //context.ellipse(location.x,location.y,mass*10,mass*10);
    context.colorMode(RGB);
  }
  
  void renderTris(ArrayList<Boid> boids, PGraphics context){
    float maxdist = 5*mass*mass;
    PVector[] neighbors = {};
    for (Boid other : boids) {
       float d = PVector.dist(location, other.location);
       if ((d > 0) && (d < maxdist+other.r)) {
         neighbors = (PVector[]) append(neighbors, other.location);
         context.stroke(255);
         //context.line(location.x,location.y,other.location.x,other.location.y);
         //context.noStroke();
       }
     }
    if(neighbors.length > 1){
      //context.fill(red(myColor),green(myColor),blue(myColor),50+(20*mass));
      context.fill(red(rose),green(rose),blue(rose),50+(20*mass));
      
      context.triangle(location.x,location.y,neighbors[0].x,neighbors[0].y,neighbors[1].x,neighbors[1].y);
    }
  }
  void renderTris3D(ArrayList<Boid> boids, PGraphics context){
    float maxdist = 5*mass*mass;
    PVector[] neighbors = {};
    for (Boid other : boids) {
       float d = PVector.dist(location, other.location);
       if ((d > 0) && (d < maxdist+other.r)) {
         PVector swaploc = new PVector(other.location.x,other.location.y,other.depth);
         neighbors = (PVector[]) append(neighbors, swaploc);
         context.stroke(255);
         //context.line(location.x,location.y,other.location.x,other.location.y);
         //context.noStroke();
       }
     }
    if(neighbors.length > 1){
      context.fill(222,56,66,50+(20*mass));
      context.beginShape();
      context.vertex(location.x,location.y,depth);
      context.vertex(neighbors[0].x,neighbors[0].y,neighbors[0].z);
      context.vertex(neighbors[1].x,neighbors[1].y,neighbors[1].z);
      context.endShape(CLOSE);
    }
  }
  
  void drawtext(PGraphics context){
    context.fill(255,255,255);
    context.textSize(r);
    context.textAlign(LEFT);
    context.text(textvar,location.x+r,location.y);
  }

}

Field myField;
ArrayList<Boid> boids;

void setupParticles(){
  
  myField = new Field(40);
  boids = new ArrayList<Boid>();
  for (int i = 0; i < 2; i++) {
    boids.add(new Boid(new PVector(random(width),-50),random(4.0,8),random(-50,50),"",white));
  }
  
  for (int i = 0; i < 5; i++) {
    boids.add(new Boid(new PVector(random(width),-50),random(1.0,3),random(-50,50),"",white));
  }
  
}

void drawParticles(){
  
  
  myField.update();
  //myField.display();
  //anim.blendMode(ADD);
  for (Boid b : boids){
    b.follow(myField);
    b.center();
    b.edges();
    b.separate(boids);
    b.update();
    b.render(anim);
    b.renderTris(boids,anim);
    
    
    b.drawtext(anim);
    
  }
  //filter(blur);

}
