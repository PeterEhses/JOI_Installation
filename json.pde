

class jsonHandler{
  JSONObject json;
  JSONObject jsonpart;
  jsonHandler(String path){
    json = loadJSONObject(path);
  }
  
  boolean fromName(String name){
    try{
      jsonpart = json.getJSONObject(name);
      return(true);
    } catch (Exception e) {
      println(e);
      return(false);
    }
  }
  
  String getValue(String part, String value){
    if (jsonpart != null){
      String val = null;
      
      JSONObject valpart = jsonpart.getJSONObject(part);
      Object content = valpart.get(value);
      val = content.toString();
      return(val);
    } else {
    return(null);
    }
  } 
}


jsonHandler json;
void setupJson(){
   json = new jsonHandler("../data.json");
   json.fromName("Google_1_Steve Goldsmith_1_oval.jpg");
   
}

void drawJson(){
  //print(json.getValue("demographic","Friendlyness"));
}
