

class jsonHandler{
  JSONObject json;
  JSONObject jsonpart;
  String[] blue = {};
  String[] yellow = {};
  String[] rose = {};
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
  
  void prepareForBoids(){
    
    blue = new String[] { 
      "Face Direction" + ": " + getValue("demographic", "Face Direction"),
      "Eye Direction" + ": " + getValue("demographic", "Eye Direction"),
      "Gender" + ": " + getValue("demographic", "Gender"),
      "Race" + ": " + getValue("demographic", "Race"),
      "Age" + ": " + getValue("demographic", "Age"),
      "Facial Hair Amount" + ": " + getValue("demographic", "Facial Hair"),
      "Makeup Amount" + ": " + getValue("demographic", "Makeup Amount"),
      "Famous? (1=YES)" + ": " + getValue("demographic", "Famousness"),
      "Commonness" + ": " + getValue("demographic", "Commonness"),
      "Ammount of Teeth Showing" + ": " + getValue("demographic", "Teeth-ness"),
      "Emotion" + ": " + getValue("demographic", "Emotion"),
      "Expression Speed" + ": " + getValue("demographic", "Expression Speed"),
      "Trustworthyness" + ": " + getValue("psychologic", "trustworthy"),
      "Memorability" + ": " + getValue("demographic", "Memorability")
    };
    
    yellow = new String[] {
      "Friendlyness" + ": " + getValue("demographic", "Friendlyness"),
      "Attractivity" + ": " + getValue("demographic", "Attractive"),
      "Forgettableness" + ": " + getValue("psychologic", "forgettable"),
      "Unintelligent" + ": " + getValue("psychologic", "unintelligent"),
      "Egoistic" + ": " + getValue("psychologic", "egotistic"),
      "Boring" + ": " + getValue("psychologic", "boring"),
      "Emotional" + ": " + getValue("psychologic", "emotional"),
      "Mean" + ": " + getValue("psychologic", "mean"),
      "Aggressive" + ": " + getValue("psychologic", "aggressive"),
      "Unattractive" + ": " + getValue("psychologic", "unattractive"),
      "Cold" + ": " + getValue("psychologic", "cold"),
      "Emotionally Unstable" + ": " + getValue("psychologic", "emotUnstable"),
      "Humble" + ": " + getValue("psychologic", "humble"),
      "Sociable" + ": " + getValue("psychologic", "sociable"),
      "Unfriendly" + ": " + getValue("psychologic", "unfriendly"),
      "Unhappy" + ": " + getValue("psychologic", "unhappy"),
      "Weird" + ": " + getValue("psychologic", "weird"),
      "Interesting" + ": " + getValue("psychologic", "interesting"),
      "Emotionally Stable" + ": " + getValue("psychologic", "emotStable"),
      "Confident" + ": " + getValue("psychologic", "confident"),
      "Irresponsible" + ": " + getValue("psychologic", "irresponsible"),
      "Happy" + ": " + getValue("psychologic", "happy"),
      "Uncertain" + ": " + getValue("psychologic", "uncertain"),
      "Normal" + ": " + getValue("psychologic", "normal"),
      "Calm" + ": " + getValue("psychologic", "calm"),
      "Attractive" + ": " + getValue("psychologic", "attractive")
    };
    
     rose = new String[] {
       "Memorable" + ": " + getValue("psychologic", "memorable"),
       "Uncommon" + ": " + getValue("psychologic", "uncommon"),
       "Friendly" + ": " + getValue("psychologic", "friendly"),
       "Untrustworthy" + ": " + getValue("psychologic", "untrustworthy"),
       "Responsible" + ": " + getValue("psychologic", "responsible"),
       "Introverted" + ": " + getValue("psychologic", "introverted"),
       "Kind" + ": " + getValue("psychologic", "kind"),
       "Precision of Emotion" + ": " + getValue("demographic", "Emotion Precision"),
       "Familiar" + ": " + getValue("psychologic", "familiar"),
       "Common" + ": " + getValue("psychologic", "common"),
       "Precision of Age" + ": " + getValue("demographic", "Age Precision"),
       "Intelligent" + ": " + getValue("psychologic", "intelligent"),
       "Ammount of Emotion" + ": " + getValue("demographic", "Emotion Ammount"),
       "Profile Picture Potential" + ": " + getValue("demographic", "Profile Picture-Ability"),
       "Caring" + ": " + getValue("psychologic", "caring"),
       "Atypical" + ": " + getValue("psychologic", "atypical"),
       "Precision of Gender" + ": " + getValue("demographic", "Gender Precision"),
       "Unemotional" + ": " + getValue("psychologic", "unemotional"),
       "Image Quality" + ": " + getValue("demographic", "Image Quality"),
       "Typical" + ": " + getValue("psychologic", "typical"),
       "Precision of Race" + ": " + getValue("demographic", "Race Precision"),
       "Unfamiliar" + ": " + getValue("psychologic", "unfamiliar"),
       "Precision of Face Direction" + ": " + getValue("demographic", "Face Precision"),
       "Movie Castability" + ": " + getValue("demographic", "Movie Castability"),
       "Precision of Eye Direction" + ": " + getValue("demographic", "Eye Precision")
     };
  }
  
  String getValue(String part, String value){
    if (jsonpart != null){
      String val = null;
      
      JSONObject valpart = jsonpart.getJSONObject(part);
      Object content = valpart.get(value);
      val = content.toString();
      //println(value);
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
   json.prepareForBoids();
   //println(json.jsonpart);
}

void drawJson(){
  //print(json.getValue("demographic","Friendlyness"));
}
