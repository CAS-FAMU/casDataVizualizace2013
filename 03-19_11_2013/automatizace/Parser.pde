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
    String request = baseURL + "?query=" + query + "&page=0-" + pocet +"&begin_date=" + start + "0101&end_date=" + end + "0101&api-key=" + apiKey;

    println(request);
    JSONObject nytData = loadJSONObject(request);
    JSONArray results = nytData.getJSONArray("results");

    for (int i = 0 ; i < results.size(); i++) {
      JSONObject temp = results.getJSONObject(i); 

      String telo = temp.getString("body");
      String titulek = temp.getString("title");
      String datum = temp.getString("date");
      String link = temp.getString("url");

      clanky.add(new Clanek(telo, titulek, datum, link));
    }
  }
}

