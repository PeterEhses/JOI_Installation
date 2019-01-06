class TitleHandler{
  String title;
  String[] texts;
  int currentText;
  PVector location;
  float r;
  float g;
  float b;
  float a;
  float amax;
  TitleHandler(String[] tl){
    texts = tl;
    title = texts[5];
    location = new PVector(100,100);
    a=0;
    amax = 255;
    r=0;
    g=0;
    b=0;
    currentText = 0;
  }
  
  void setColor(float n1, float n2, float n3, float n4){
    
    r = n1;
    g = n2;
    b = n3;
    amax = n4;
  }
  
  void setLocation(float xl, float yl){
    location= new PVector(xl,yl);
  }
  
  Boolean fadeIn(){
    if(a<amax){
      a+=0.5;
      return(false);
    } else {
      return(true);
    }
  }
  Boolean fadeOut(){
    if(a>0){
      a-=1;
      return(false);
    } else{
      return(true);
    }
  }
  
  void setTitle(String t){
    title = t;  
  }
  
  void render(PGraphics context){
    context.textAlign(CENTER,CENTER);
    context.textSize(50);
    context.fill(r,g,b,a);
    context.text(title,location.x,location.y);
  }
}
TitleHandler titlehandler;
void setupTitle(){
  
  String[] titles = {
    "Willkommen bei „JOI“",
    "Wenn du im Internet surfst,\n"+
    "dann sammle ich deine Daten\n"+
    "- ohne dass du es bemerkst.",
    "Zum Beispiel wird gespeichert,\n"+
    "wann und mit wem du chattest.\n"+
    "Außerdem wird dein Standort \n"+
    "und jeder deiner Wege vermerkt.",
    "Auch über jeden Begriff\n"+
    "welchen du in eine Suchma- \n"+
    "schine eingegeben hast \n"+
    "weiß ich bescheid.",
    "Bei jedem Click war ich dabei.",
    "Ich kenne die Verhältnisse zu \n"+
    "allen deiner Mitmenschen,\n"+
    "deinen Kontostand \n"+
    "und den Status deines \n"+
    "gesellschaftlichen Ansehens.",
    "Ich habe alle deine Fotos \n"+
    "und Videos gesehen.\n"+
    "Kenne die Inhalte deiner \n"+
    "Festplatten.",
    "Über deine Kamera und über \n"+
    "dein Mikrofon kann ich dich \n"+
    "sehen was du machst und \n"+
    "hören was du sagst.",
    "Ich kann wegen deines\n"+
    "GPSs der Polizei genau\n"+
    "sagen wann du wo zu \n"+
    "schnell gefahren bist.",
    "Deinem Arbeitgeber \n"+
    "verraten wo du dich während \n"+
    "deiner Krankschreibung \n"+
    "aufgehalten hast.",
    "Oder deiner Versicherung \n"+
    "melden was du ungesundes \n"+
    "gegessen hast damit sie \n"+
    "deine Beiträge erhöht...",
    "Es gibt kein Geheimnis \n"+
    "welches du mir nicht schon \n"+
    "erzählt hast.",
    "Ich erinnere mich an Ereignisse an welche du schon wieder vergessen hast. Und ich vergesse nie!",
    "Aus einem gewissen Blickwinkel kenne ich dich besser als du dich selbst!",
    "Jeden Tag fütterst du mich mit tausenden von privaten Inforationen. Jeden Tag wächst dein digitaler Fußabdruck weiter...",
    "Und das war nur ein kleiner Einblick.",
    "Analyse wird gestartet...",
    "Alle diese Daten habe ich über ein einziges Foto von dir gewonnen, welches ich eben von dir aufgenommen habe",
    "Stell dir vor welchen Schaden ich mit allen jemals von dir angesammelten Masse Daten anrichten könnte.",
    "Für Firmen sind diese Daten aus wirtschaftlichen Gründen sehr wertvoll. Für Cyberkriminelle sind sie ein gefundenes Fressen",
    "Aber ich möchte dich warnen. Ich möchte dir bewusst machen wie wichtig es ist achtsam mit deinen Daten umzugehen.",
    "Denn sobald du einen kostenfreien Dienst nutzt,...bist du das Produkt!"
  };
  
  titlehandler = new TitleHandler(titles);
  //titlehandler.setTitle("Wenn du im Internet surfst, dann sammle ich deine Daten \n- ohne dass du es bemerkst.");
  titlehandler.setLocation(top.width/2,top.height/2);
}

void drawTitle(){
  //textimg.beginDraw();
  //textimg.clear();
  titlehandler.fadeIn();
  //titlehandler.render(textimg);
  //textimg.endDraw();
  //image(textimg,0,0);
}
