color cyan = color(0,186,252);
color rose = color(222,56,66);
color yellow = color(250,189,0);

color green = color(0,138,0);
color blue = color(0,41,66);
color red = color(219,41,0);

color dark = color(0,31,0);

color white = color(255,255,255);

color[] firstcolors = {cyan, rose, yellow};
color[] secondcolors = {green, blue, red};
color[] lightcolors = {cyan, blue, rose, red, yellow, green};


PFont sourcesans;
PFont sofiapro;
PShader blur;

void setupStyle(){
  
  blur = loadShader("blur.glsl"); 
  
  sourcesans = createFont("SourceSansPro-ExtraLight.ttf",92);
  sofiapro = createFont("sofiapro-light.otf",92);
  textFont(sourcesans);
}
