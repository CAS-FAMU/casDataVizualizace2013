// CAS data vizualizace 2013
// 

//////////////////////////////////////////

String query = "NSA";
int start = 2003;
int end = 2010;

int pocet = 10;

ArrayList clanky;
Parser parser;

String baseURL = "http://api.nytimes.com/svc/search/v1/article";
String apiKey = "563bad88e7b33f61d603c14824dfa508:1:68227020";

///////////////////////////////////////////

PFont text1, text2;

void setup() {
  size(1024, 768, P2D);

  text1 = loadFont("CharterBT-Bold-16.vlw");
  text2 = loadFont("04b03-8.vlw");

  parser = new Parser(query, start, end);
}

///////////////////////////////////////////

void draw() {
  background(255);

  textAlign(CENTER);

  text(query, width/2, height/2);


  for (int i = 0 ; i < clanky.size();i++) {

    pushMatrix();
    translate(width/2,height/2);
    
    pushMatrix();
    rotate(map(i,0,clanky.size(), -PI , PI ));
    
    Clanek tmp = (Clanek)clanky.get(i);
    tmp.kresli();   
    
    popMatrix();
    
    popMatrix();
  }
}

