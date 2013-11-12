
ArrayList obce;

String [] raw;

float min_lon = 12.406;
float max_lon = 18.844;

float min_lat = 48.5868;
float max_lat = 51.0515;


PFont font;



void setup() {
  size(1024, 650, P2D);
  
  font = loadFont("Planer-40.vlw");
  textFont(font);
  textAlign(CENTER);
  
  parse();
}

void parse() {
  raw = loadStrings("Seznam-obci-CR.csv");
  println("Pocet obci: "+raw.length);

  obce = new ArrayList();

  for (int i = 0 ; i < raw.length ; i++) {
    String radek[] = splitTokens(raw[i], ",");
      
    try{  
        obce.add(
        new Obec(
        parseFloat(radek[13]),
        parseFloat(radek[14]),
        parseInt(radek[10]),
        radek[0],
        radek[15]
        ));
    }catch(Exception e){;}
    
  }
}

void draw() {
  background(255);
  
  for(int i = 0 ; i < obce.size();i++){
    Obec tmp = (Obec)obce.get(i);
   tmp.kresli(); 
  }
  if (keyPressed == true) {save("screen.png");};
}


///////////////////////////

class Obec {
  float lon, lat; 
  int pocet_obyv;
  String nazev;

  String email;  
  float velikost;
  boolean over = false;
  float X, Y;

  Obec(float _lon, float _lat, int _pocet_obyv, String _nazev, String _email) {
    email  = _email;
    nazev = _nazev;
    lon = _lon;
    lat = _lat;
    pocet_obyv = _pocet_obyv;
    println(pocet_obyv);
    
    X = map(lon, min_lon, max_lon, 0, width);
    Y = map(lat, min_lat, max_lat, height, 0);
  }
  
  void kresli() {
    int f = 0;
    int g = 0;
    float hValue;
    hValue = map(pocet_obyv, 1, 1000, 1, 90);
    velikost = map(pow(pocet_obyv,0.3),0,30,3,120);
    
    velikost =  2/sqrt(dist(mouseX,mouseY,X,Y)) * 80.0;// 1080.0 / (pow ( dist(mouseX,mouseY,X,Y), 0.9) * 40.0) + 20;
    
    noStroke();
    colorMode(HSB, 100); 
    fill(hValue, 100, 100 , 50);
    
    ellipse(X, Y, velikost,velikost);
    
    over = false;
    
    //for(f = -3 ; f < 3;f++) {
    //   if (f<0) {g=-f+1;} else {g=f+1;};
    //   stroke(100,100,100, 100/g); 
    //   line(mouseX+f,0,mouseX+f,height);
    //   line(0, mouseY+f, width, mouseY+f);
    //}
    
    // float d = dist(mouseX,mouseY,X,Y);
    // if(d < 10){
    //  over = true;
      
    //  textFont(font, (18/d+1));
    //  fill(0,255 / d);
    //  text(nazev,X,Y);
    // }
  }
  

  
  void mail(){
   link("mailto:"+email); 
  }
  
  
}


void mousePressed(){
  for(int i = 0 ; i < obce.size();i++){
   Obec tmp = (Obec)obce.get(i);
   if(tmp.over){
    tmp.mail();
    break;
   } 
  }  
}



