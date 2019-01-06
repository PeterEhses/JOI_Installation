import processing.net.*; 
Client tfClient;
Client umapClient;


void setupRecog(){
  tfClient = new Client(this, "127.0.0.1", 50008);
  umapClient = new Client(this, "127.0.0.1", 50007);
}



void facerecog(){
  d = cam.get(320,180,640,360);
    d.resize(128,72);
    //image(d,0,0);
    opencv.loadImage(d); 
    faces = opencv.detect(); 
     //image(cam.get(),0,0);
    if (faces!=null) { 
      faceframe++;
      
      for (int i=0; i< faces.length; i++) { 
        emask.beginDraw();
        emask.ellipseMode(CORNER);
        emask.background(0);
        emask.fill(255);
        emask.ellipse((320+faces[i].x*5-int(frame/2)), (180+faces[i].y*5-int(frame*2/2)), (faces[i].width*5+frame), (faces[i].height*5+int(frame*2)));
        img_x = 320+faces[i].x*5-int(frame/2);
        img_y = (180+faces[i].y*5-int(frame*2/2));
        emask.endDraw();
        //PImage d = opencv.getInput();
      c = cam.get();
      c.mask(emask);
      c = c.get((320+faces[i].x*5-int(frame/2)), (180+faces[i].y*5-int(frame*2/2)), (faces[i].width*5+frame), (faces[i].height*5+int(frame*2)));
      if (faceframe>10){
        recogsucc = true;
        c.resize(0,200);
        c.save("test.jpg");//TODO make bg white
        faceframe=0;
        
      }
      }
    
    if (faces.length<=0) {
    faceframe=0;
  }
  
  }
  recogdone = true;
}


String datain;

String thename;

boolean tfsent = false;
boolean tfworking = true;
boolean umapsent = false;
boolean umapworking = true;

boolean donewithdata = false;

void waitForAThing(){
  println("enter socket thread");
  println("tf");
  while (tfworking){
    
    if(!tfsent){
      tfsent = true;
      tfClient.write("Paging Python!");
      
    }
    
    if (tfClient.available() > 0) { 
      
      datain = tfClient.readString();
      tfClient.stop();
      println(datain);
      tfworking = false;
    } 
  }
  println("umap");
  while(umapworking){
    if (!umapsent){
      umapsent = true;
      umapClient.write("Paging Python!");
    }
    if (umapClient.available() > 0) { 
      
      thename = umapClient.readString();
      umapClient.stop();
      println(thename);
      umapworking = false;
    } 
  }
  
  tfworking = true;
  tfsent = false;
  umapworking = true;
  umapsent = false;
  println("exit socket thread");
  println(json.fromName(thename));
  donewithdata = true;
}
