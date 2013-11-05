// CAS dataviz blok 2013

JSONObject json;
JSONArray array;
String values[];

void setup() {
  size(320,480);

  textFont(createFont("Tahoma",9,false));

  json = loadJSONObject("http://hawttrends.appspot.com/api/terms/");
  array = json.getJSONArray("3");
  values = array.getStringArray();

}

void draw(){

  background(0);

  text("Google top trends\n----------------------------",10,30);
  for (int i = 0 ; i < values.length ; i++) {
    text((i+1)+": "+values[i],10,i*12+100);
  }
}
