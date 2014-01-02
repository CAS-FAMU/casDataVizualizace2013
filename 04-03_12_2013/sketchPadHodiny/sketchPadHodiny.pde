int barWidth = 5;

int[] hue;


void setup(){
  size(720,320,P2D);


  colorMode(HSB, 360, height, height);  

  hue = new int[width/barWidth];

  noStroke();

  // nastaveni parametru pro noise
  noiseSeed(3);
}


void draw() 

{
  fill(0,50);
  rect(width/2,height/2,width,height);

  //background(255);    

  int j = 0;

  for (int i = 0; i <= (width-barWidth); i += barWidth) {


    hue[j] = (noise(frameCount + i * 10.0) * width + frameCount) % 255;



    fill(hue[j], height/1.2, height/1.2,12);

    rect(i, height/2, barWidth, height);  

    j++;

  }

  // tady
  triangle( sin(frameCount / 100.0) * 100.0 + width/2, cos(frameCount / 100.0) * 100.0 + height/2.0, 195, 200, 160, 200);

  triangle(random(10)+50, 10, 195, 200, 160, 200);
  triangle(1200, 10, 195, 200, 160, 200);

  //http://mrl.nyu.edu/~perlin/

  rectMode(CENTER);
  fill(255,255,255,50);






  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;

  stroke(255,255,255);

  strokeWeight(1);


  fill(255,120);

  pushMatrix();
  translate(width/2,height/2);
  triangle(mouseX-10, mouseY, mouseX+10, mouseY, cos(s) * 125, sin(s) * 125);
  triangle(mouseX-10, mouseY, mouseX+10, mouseY, cos(m) * 100 , sin(m) * 100);
  triangle(mouseX-10, mouseY, mouseX+10, mouseY, cos(h) *  75, sin(h) * 75);
  popMatrix();


  ///////////////////////////////////////////////////
  ///////////////////////////////////////////////////
  noStroke();


  pushMatrix();
  translate(mouseX, mouseY);

  for(int i = 0 ; i < 1000;i++){

    fill( noise(i / 100.0) * 255 +i, 255 / i *100, 255, 80);
    rect(
        cos(i+noise(10)/3+frameCount*9/i-901.045245) * sin(s+i+1/1107.0+frameCount/1000.0) * 419.3874545,
        sin(i+noise(9)/2-noise(9)+frameCount/104.365434354) * sin(s+i/1459.0+frameCount/i-584.5124545) * 197.0897,
        3,
        3
        );
  }
  popMatrix();


  noStroke();
}

