////////////////////////////////////////////////
class Parser extends Thread {
  int start, end;
  String query;

  Parser(String _query, int _start, int _end) {
    query = _query;
    start = _start;
    end = _end;

  }

  void run(){
    nactiClanky(); 
  }

  void kresli() {
    for (int i = 0 ; i < clanky.size();i++) {
      Clanek tmp = (Clanek)clanky.get(i);
      tmp.kresli();
    }
  }

  void nactiClanky() {

    clanky = new ArrayList(); 

    for(int ii = 0 ; ii < pocet;ii++){
    String request = baseURL + "?query=" + query + "&page=" + ii +"&begin_date=" + start + "0101&end_date=" + end + "0101&api-key=" + apiKey;

//    println(request);
    JSONObject nytData = loadJSONObject(request);
    JSONObject response = nytData.getJSONObject("response");
    JSONArray docs = response.getJSONArray("docs");

    for (int i = 0 ; i < docs.size(); i++) {
      try{
      JSONObject temp = docs.getJSONObject(i); 

      String telo = temp.getString("snippet");
      String datum = temp.getString("pub_date");
      String titulek = temp.getJSONObject("headline").getString("main");
      String link = temp.getString("web_url");

      clanky.add(new Clanek(telo, titulek, datum, link));
      }catch(Exception e){;}
    }
    }
  }
}

