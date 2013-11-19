// CAS data vizualizace 2013
// 

//////////////////////////////////////////

int start = 2003;
int end = 2010;
String[] words = {"Bush","Obama"};

ArrayList dotazy;

String baseURL = "http://api.nytimes.com/svc/search/v1/article";
String apiKey = "xxx";

///////////////////////////////////////////

void setup() {

  size(800,400,P2D);

  dotazy = new ArrayList();

  for(int i = 0 ; i < words.length;i++){
    dotazy.add(new Term(words[i],start,end));
  }

}

///////////////////////////////////////////

void draw() {
  background(0);

  for(int i = 0 ; i < dotazy.size();i++){
    Term tmp = (Term)dotazy.get(i);
    tmp.kresli();
  }


}

////////////////////////////////////////////////

class Term{
  int start,end;
  String query;
  ArrayList hodnoty;


  Term(String _query,int _start,int _end){
    query = _query;
    start = _start;
    end = _end;

    hodnoty = new ArrayList();
    getData();
  }

  void kresli(){

    for(int i = 0 ; i < hodnoty.size();i++){
      int tmp = (Integer)hodnoty.get(i);
      float x = map(i,0,hodnoty.size(),0,width);        

      stroke(255,10);
      line(x,tmp,x,height);
    } 

  }

  void getData(){
    for(int year = start;year < end;year++){
      for(int i = 1 ; i < 12 ; i++){
      String month1 = nf(i,2);
      String month2 = nf(i+1,2);
      int freq = getArticleKeywordCount( query, year+month1+"01", year+month2+"01");
      hodnoty.add(freq);
      //delay(100);
    }
   }
  }

  int getArticleKeywordCount(String word, String beginDate, String endDate) {
    String request = baseURL + "?query=" + word + "&begin_date=" + beginDate + "&end_date=" + endDate + "&api-key=" + apiKey;
    //println(request);
    
    String result = join( loadStrings( request ), "");

    int total = 0;

    try {
      JSONObject nytData = loadJSONObject(request);
      JSONArray results = nytData.getJSONArray("results");
      total = nytData.getInt("total");
      println ("There were " + total + " occurences of the term " + word + " between " + beginDate + " and " + endDate);
    }
    catch (Exception e) {
      println ("There was an error parsing the JSONObject.");
    };

    return(total);
  }
}
