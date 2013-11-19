int X = 20,Y = 50;

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
  
    x = X;
    y = Y;
    
    X += 200;
    
    if(X > width){
     Y += 200;
     X = 20; 
    }

    println(titulek);
  }
  
  void kresli(){
    fill(255);
    
    textFont(text1);
    text(titulek,x,y-10);
    
    textFont(text2);
    text(text, x,y,100,height);
    
    
    
  }
}

