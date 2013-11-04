ArrayList list1,list2;
String data[];

////////////////////////////////////////////////////

void setup(){

  size(1024,320);

  parse();

}


void draw(){

  background(0);

  display(list1, color(255,255,0));
  display(list2, color(0,255,255));


  
}

///////////////////////////////////////////////////

void display(ArrayList list, color c){
  noFill();
  stroke(c,200);
  beginShape();
  for(int i = 0 ; i< list.size();i++){

    int val = ((Integer)list.get(i));
    float scaled = map(val,0,100,height,0);

    float w = map(i,0,list.size(),0,width);
    vertex(w,scaled);  
  }
  endShape();
}


void parse(){
  list1 = new ArrayList();
  list2 = new ArrayList();
  data = loadStrings("data.csv");

  for(int i = 0 ; i < data.length;i++){
    String [] separate = splitTokens(data[i],",");
    list1.add(parseInt(separate[1]));
    list2.add(parseInt(separate[2]));
  }
}
