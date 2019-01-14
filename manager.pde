boolean prefaceDone = false;

void reset(){
  println("*-----*-----*");
  println("|   reset   |");
  println("*-----*-----*");
 faceframe = 0;
 recogdone = true;
 recogsucc = false;
 umapdone = false;
 //firstTime = 0;
 bgChangeVal = +1;
 currentValue = 255;
 tfsent = false;
 tfworking = true;
 umapsent = false;
 umapworking = true;
 donewithdata = false;
 tfClient = new Client(this, "127.0.0.1", 50008);
 umapClient = new Client(this, "127.0.0.1", 50007);
 setupTimer();
 boids = new ArrayList<Boid>();
 for (int i = 0; i < 2; i++) {
    boids.add(new Boid(new PVector(random(width),-50),random(4.0,8),random(-50,50),"",white));
  }
  
  for (int i = 0; i < 5; i++) {
    boids.add(new Boid(new PVector(random(width),-50),random(1.0,3),random(-50,50),"",white));
  }
}



class Timer{
  
  int starttime;
  int time;
  int[] eventTimes;
  boolean[] eventsDone = {};
  
  Timer(){
    starttime = millis();
    time = millis();
  
    eventTimes = new int[]{
      0,  // evt 0, //nothing happens! needs to be reserved because programming
      500, //eventTimes 1
      1000, //2
      1500, //3
      2000,//etc.
      5000, // text starts "done processing.."
      6000, // 
      7000,
      60000,
      70000
    };
    print("Number of timed events:");
    println(eventTimes.length);
    for(int i = 0; i < eventTimes.length; i++){
      eventsDone =(boolean[]) append(eventsDone, false);
    }
  }
  void updateStartTime(){
    starttime = millis();
  }
  int getTime(){
    time = millis()-starttime;
    return(time);
  }
  void functionManager () {
    if (getTime() > eventTimes[1] && !eventsDone[1]){
      
    }
    
    
    if (getTime() > eventTimes[8] && !eventsDone[8]){
      bgChangeVal = +1;
    }
    
    
    if (getTime() > eventTimes[9] && !eventsDone[9]){
      //eventsDone[3] = true;
      //println(boids.size());
      
      if (boids.size()>0){
        if (frameCount % 40 == 0){
          boids.remove(boids.size() -1);
          //println("balls");
        }
      } else{
      reset();
      }
    }
    
  }
}


class FireStarter{
  
  boolean newFace;
  int boidBlueN;
  int boidYellowN;
  int boidRoseN;
  FireStarter(){
    boidBlueN = 0;
    boidYellowN = 0;
    boidRoseN = 0;
    newFace = true;
  }

  void run(){
    idleTest();
  }
  
  void idleTest(){
  
    if(!recogsucc){
      drawIdle();
      bgChangeVal = +1;
      
    }
    else {
      
      drawParticles();
    }
    if(!umapdone){
      timer.updateStartTime();
    } else{
      if(newFace){
        //println("new Face");
        //println(boidBlueN);
        //println(boidYellowN);
        //println(boidRoseN);
        bgChangeVal = -1;
        if(boidBlueN < json.blue.length){
          if (frameCount % 380 == 0) {
            boids.add(new Boid(new PVector(random(width),-50),random(5.0,8),1,json.blue[boidBlueN],cyan));
            boidBlueN ++;
          }
        } else {
          if (boidYellowN < json.yellow.length){
            if (frameCount % 100 == 0) {
              boids.add(new Boid(new PVector(random(width),-50),random(2.5,3),1,json.yellow[boidYellowN],yellow));
              boidYellowN ++;
            }
          } else{
            if (boidRoseN < json.rose.length){
              if (frameCount % 50 == 0) {
                boids.add(new Boid(new PVector(random(width),-50),random(1,1.5),1,json.rose[boidRoseN],rose));
                boids.add(new Boid(new PVector(random(width),-50),random(1,1.5),1,json.rose[boidRoseN],rose));
                boidRoseN ++;
              }
            } else {
              newFace = false;
            }
          }
          
          
        }
      }
    }
  }

}


Timer timer;
FireStarter manage;
void setupTimer(){
  timer = new Timer();
  manage = new FireStarter();
}

void drawTimer(){
  timer.functionManager();
  manage.run();
}
