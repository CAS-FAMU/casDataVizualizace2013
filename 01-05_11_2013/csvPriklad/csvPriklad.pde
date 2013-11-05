ArrayList list1, list2;
String data[];

float dynamickeHodnoty1[],dynamickeHodnoty2[];

////////////////////////////////////////////////////

void setup() {

  size(720, 320);

  smooth();

  parse();
  
  
  dynamickeHodnoty1 = new float[data.length];
  dynamickeHodnoty2 = new float[data.length];
  
  for(int i = 0 ; i < dynamickeHodnoty2.length;i++){
    dynamickeHodnoty1[i] = height;
    dynamickeHodnoty2[i] = height;
  }
}


void draw() {

  noStroke();
  fill(0,3);
  rect(0,0,width,height);




  display(list1, dynamickeHodnoty1, color(172, 206, 23, 22));
  display(list2, dynamickeHodnoty2, color(0, 255, 255, 22));
}

///////////////////////////////////////////////////

void display(ArrayList list, float [] dyn, color c) {
  fill(c);
  noStroke();
  
  beginShape();

  vertex(0, height);

  for (int i = 0 ; i< list.size();i++) {

    int val = ((Integer)list.get(i));
    float scaled = map(val, 0, 100, height, 0);


    float w = map(i, 0, list.size(), 0, width);
    
    dyn[i] += (scaled - dyn[i]) * 0.01;
    
    vertex(w, dyn[i]);
  }
  vertex(width, height);
  endShape(CLOSE);
}


void parse() {
  list1 = new ArrayList();
  list2 = new ArrayList();
  data = loadStrings("data.csv");

  for (int i = 0 ; i < data.length;i++) {
    String [] separate = splitTokens(data[i], ",");
    list1.add(parseInt(separate[1]));
    list2.add(parseInt(separate[2]));
  }
}

