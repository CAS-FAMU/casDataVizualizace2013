
class Clanek {

  String text;
  String titulek;
  String link;
  String datum;
  float x,y;
  

  Clanek(String _text, String _titulek, String _link, String _datum) {
    text =  _text;
    titulek =  _titulek;
    link = _link;
    datum =  _datum;
    
    x = 50;
    y = 0;

    println(titulek);
  }
  
  void kresli(){
    fill(0);
    
    textAlign(LEFT);
    textFont(text2,9);
    text(titulek,x,y,200,100);
    
    //textFont(text2);
    //text(text, x,y+200,100,height);
    
    
    
  }
}

