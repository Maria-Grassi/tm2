
Paleta p;

class Caminante {

  float x, y, x0, y0, contar;
  float t = 20;
float variacion=3;
  float dir, vel, avanzar, colores;
   float radio, cont,alfaf;
color colorear;
color colorActual;

  PImage imagen;
  int cantidadPorciones = 360/4;
  int cualPorcion = 0;

  float xa, ya, xd, yd, dist;
  boolean yaTengoCuatrosPuntos = false;
  String estado;
boolean reiniciarObra =false;
  float avance;
String nombreTrazo;
  Caminante() {
nombreTrazo="borde"+int(random(0,3))+".png";
     p = new Paleta();
    imagen = loadImage( nombreTrazo );
  //  imagen.mask( imagen );

    x = random(150, width-150 );
    y = random(150, height-150 );

   
    dist = 15; //radio del circulo

    estado = "restablecer";    
   // 1ER SONIDO DE LA OBRA Q SE ESTABLESCAN LOS 3RES VALORES
  }

  void mover() {
        println("hola");
avanzar=4;
    dir += radians(avanzar); //radians(random(-10, 10));
cont += avanzar;
    float dx = dist * cos( dir ); 
    float dy = dist * sin( dir );

    x = x + dx;
    y = y + dy;

    if ( x>width || x<0 || y>height || y<0 ) {
      yaTengoCuatrosPuntos = false;
    }

    //espacio toroidal
    x = ( x>width ? x-width : x );
    x = ( x<0 ? x+width : x );
    y = ( y>height ? y-height : y );
    y = ( y<0 ? y+height : y );

  }
color devolverColor(){
   colorr=int(random(1,6));
      if (colorr==1) {
     colorear=   p.darUnColor1(alfaf);
      } else if (colorr==2) {
     colorear=   p.darUnColor2(alfaf);
      } else if (colorr==3) {
     colorear=   p.darUnColor3(alfaf);
      }else if (colorr==4) {
     colorear=   p.darUnColor1(alfaf);
      } else if (colorr==5) {
     colorear=   p.darUnColor2(alfaf);
      } else if (colorr==6) {
     colorear=   p.darUnColor3(alfaf);
      }
    return colorear;}
  void dibujarTrazo() {
  
    
    float ampM = map(amp, minAmp, maxAmp, 10, 60);
    float pitchM = map (pitch, minPitch, maxPitch, 4, 10);
  
   

     if(estado.equals("restablecer")){
          radio = ampM;// ancho de pincel
   dist=pitchM;
   x = random(150, width-150 );
    y = random(150, height-150 ); 
    avanzar=1;
    cont=0;
   cualPorcion=0;
nombreTrazo="borde"+int(random(0,3))+".png";

     alfaf=185;
 colorActual = devolverColor();
    estado="dibujarCirculo";

    } else if(estado.equals("dibujarCirculo") ){
    cualPorcion = (cualPorcion+1) % cantidadPorciones;
    float anchoNorm = 1.0/cantidadPorciones;

    float u1 = map(cualPorcion, 0, cantidadPorciones, 0, 1);    
    float v1 = 0;

    float u2 = u1+anchoNorm;    
    float v2 = 0;

    float u3 = u2;    
    float v3 = 1;

    float u4 = u1;    
    float v4 = 1;

  
    float angulo = radians(-90)+dir;
    float xb = radio * cos( angulo ) + x;
    float yb = radio * sin( angulo ) + y;

    angulo = radians(90)+dir;
    float xc = radio * cos( angulo ) + x;
    float yc = radio * sin( angulo ) + y;

    //texturizar
    if ( yaTengoCuatrosPuntos ) {

      pushStyle();
    // colorMode( HSB );
      
      tint( colorActual );
      noStroke();
//stroke(255);
      beginShape();
      textureMode(NORMAL);
      texture(imagen);
      vertex(xa, ya, u1, v1);
      vertex(xb, yb, u2, v2);
      vertex(xc, yc, u3, v3);
      vertex(xd, yd, u4, v4);
      endShape();

      popStyle();
    }

    xa = xb;
    ya = yb;
    xd = xc;
    yd = yc;
    yaTengoCuatrosPuntos = true;
  }
      if(cont==360|| x<60 || x>width-60  || y<60 || y>height-60){
   estado="restablecer";
   yaTengoCuatrosPuntos = false;
   contar++;
}

  }
void termino (){
 contar++;
      yaTengoCuatrosPuntos = false;
    estado="restablecer";}
  
void reiniciar(){
if(contar==int(random(50,70))){
contar=0;
 colores= int(random(3,6));
 background(255);}

  
}}
