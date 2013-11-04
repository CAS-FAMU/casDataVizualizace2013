// CAS dataviz blok 2013


JSONObject json;

void setup() {

  json = loadJSONObject("colors.json");
  JSONArray values = json.getJSONArray("colors");

  for (int i = 0; i < values.size(); i++) {

    JSONObject animal = values.getJSONObject(i); 

    String barva = animal.getString("color");
    String hodnota = animal.getString("value");

    println(barva + ", " + hodnota);
  }
}
