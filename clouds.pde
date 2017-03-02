PFont font;

String[] lines;
PGraphics pg;


void setup()
{
  font = loadFont("AgencyFB-Reg-25.vlw");
  textFont(font, 25);
  size(600, 600);  
  String str = ""+"clouds.pde";
  lines = loadStrings(str);
background(25);
  //frameRate(20);
//applyGradient(0,0,width,height,0,255);
    
}

int i=0, j=0;
int x=10, y=15;
int ht = 0;
String message;
int k = 0;

void draw() {
  
  translate(0, 20);
  fill(255);
  
   
writeText();  
loadPixels();
 
pixelDrift();
updatePixels();

}


void writeText(){
  if (i<lines.length) {
    message = lines[i];
  }

            if (j < message.length()) {
              if (y*(i-ht) < height-10){
              text(message.charAt(j), x*j+10, y*(i-ht));
              j++;
              }
              else{            
                ht = ht + i;
              }
            }
  else { 
    j=0;
    i++;  
  }
  
  if(i>lines.length){
    i=0;
  }
}

void pixelDrift(){
  
for (int i = 0; i < (width*height); i++) {
 // if(int(random(0,200))==1){pixels[i]=pixels[int(random(0,(width*height)))];}
    //if(int(random(0,200))==1&&i>2){pixels[i]=pixels[i-1];}
    if(int(random(0,20))==1&&i > 2){pixels[i-1]=pixels[i];}
    if(int(random(0,20))==1&& i+width < (width*height)-1){pixels[i+width]=pixels[i];}

}
}
public void applyGradient(int x, int y, float w, float h, color from, color to) {
  float deltaR = red(to) - red(from);
  float deltaG = green(to) - green(from);
  float deltaB = blue(to) - blue(from);

  for (int i = x; i <= (x+w); i++) {
    for (int j = y; j <= (y+h); j++) {

      color c = color(
        (red(from)+(j-y)*(deltaR/h)),
        (green(from)+(j-y)*(deltaG/h)),
        (blue(from)+(j-y)*(deltaB/h)) 
      );

      set(i, j, c);
    }
  }
}