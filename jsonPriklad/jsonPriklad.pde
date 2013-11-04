// CAS dataviz blok 2013


JSONObject json;
  JSONArray values;

void setup() {
  size(320,240);

  textFont(createFont("Tahoma",9,false));

  json = loadJSONObject("colors.json");
  values = json.getJSONArray("colors");

}

void draw(){

  noStroke();

  for (int i = 0 ; i < values.size() ; i++) {

    JSONObject animal = values.getJSONObject(i); 

    String barva = animal.getString("color");
    String hodnota = animal.getString("value");

    float w = (width/(values.size()+0.0f));
    float W = (width/(values.size()+0.0f))*i;

    fill(unhex(hodnota));
    rect(W,0,w,height);
    fill(127);
    text(barva,W+2,10);
  }
}
