int X = 100;

class Clanek {

  String text;
  String titulek;
  String link;
  String datum;
  float x,y;
  

  Clanek(String _text, String _titulek, String _datum, String _link) {
    text =  _text;
    titulek =  _titulek;
    link = _link;
    datum =  _datum;
    
    y = 0;
    x = X;

    X++;

    println(titulek);
  }
  
  void kresli(){
    fill(255,75);
    textAlign(LEFT);
    textFont(text2,8);
    text(datum+" "+titulek,x,y);
  }
}

