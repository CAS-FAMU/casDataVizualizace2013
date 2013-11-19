// CAS data vizualizace 2013
// 

//////////////////////////////////////////

String query = "Europe";
int start = 2000;
int end = 2010;

int pocet = 1000;

ArrayList clanky;
Parser parser;

String baseURL = "http://api.nytimes.com/svc/search/v2/articlesearch.json";
String apiKey = "563bad88e7b33f61d603c14824dfa508:1:68227020";

///////////////////////////////////////////

PFont text1, text2;

void setup() {
  size(1024, 768);

  text1 = loadFont("Calluna-Regular-48.vlw");
  text2 = loadFont("04b03-8.vlw");

  parser = new Parser(query, start, end);
  parser.start();
}

///////////////////////////////////////////

void draw() {
  background(255);

  textAlign(CENTER);
  textFont(text1,24);
  text(query, width/2, height/2);

  pushMatrix();

  translate(width/2,height/2);


  for (int i = 0 ; i < clanky.size();i++) {
    pushMatrix();
    rotate(map(i,0,clanky.size(),-PI,PI));

    Clanek tmp = (Clanek)clanky.get(i);
    tmp.kresli();   
    popMatrix();
  }
  popMatrix();
}

