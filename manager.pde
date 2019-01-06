class Timer{
  
  int starttime;
  int time;
  int[] eventTimes;
  boolean[] eventsDone = {};
  
  Timer(){
    starttime = millis();
    time = millis();
  
    eventTimes = new int[]{
      0,  // evt 0, 
      5000,
      6000,
      7000,
      37000
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
    if (getTime() > eventTimes[3] && !eventsDone[3]){
      //eventsDone[3] = true;
      //println(boids.size());
      if (boids.size()>0){
      boids.remove(boids.size() -1);
      //println("balls");
      }
    }
    
  
    
  }
}


class FireStarter{
  
  
  
  FireStarter(){
  
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
      bgChangeVal = -1;
      drawParticles();
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
