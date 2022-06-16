
Paleta p;

class Caminante {

  float x, y, x0, y0, contar,x_,y_;
  float t = 20;
  float variacion=3;
  float dir, vel, avanzar, colores;
  float radio, cont, alfaf, cantidad;
  color colorear;
  color colorActual;
float ampM, pitchM ;
  PImage imagen;
  int cantidadPorciones = 360/4;
  int cualPorcion = 0;
int   contadorDePos=0;
int ReiniciarEn=0;
  float xa, ya, xd, yd, dist;
  boolean yaTengoCuatrosPuntos = false;
  String estado;
  boolean reiniciarObra =false;
  float avance;
  String nombreTrazo;
  Caminante() {
    nombreTrazo="borde"+int(random(0, 9))+".png";
    p = new Paleta();
  cantidad=int(random(3,6)); //colores
    //  imagen.mask( imagen );

    x = x_;
    y = y_;


    dist = 15; //radio del circulo

    estado = "restablecer";    
    // 1ER SONIDO DE LA OBRA Q SE ESTABLESCAN LOS 3RES VALORES
  }

  void mover() {
   // println("hola");
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
  color devolverColor() {
    colorr=int(random(1,cantidad));
    if (colorr==1) {
      colorear=   p.darUnColor1(alfaf);
    } else if (colorr==2) {
      colorear=   p.darUnColor2(alfaf);
    } else if (colorr==3) {
      colorear=   p.darUnColor3(alfaf);
    } else if (colorr==4) {
      colorear=   p.darUnColor4(alfaf);
    } else if (colorr==5) {
      colorear=   p.darUnColor5(alfaf);
    } 
    return colorear;
  }
  void PosXY(){
    if (estado.equals("restablecer")) {
  contadorDePos++;}
  println("pos "+contadorDePos%5);
  if(contadorDePos%5==1){
    
  x_=random((width/3),(width/3)*2);
 y_=random((height/3),(height/3)*2);
}
else  if(contadorDePos%5==2){
  x_=random(60,(width/3));
 y_=random(60,(height/3));
}
else  if(contadorDePos%5==3){
  x_=random((width/3)*2,width);
 y_=random((height/3)*2,height);
}
else  if(contadorDePos%5==4){
  x_=random(60,(width/3));
 y_=random((height/3)*2,height);
}
else  if(contadorDePos%5==0){
  x_=random((width/3)*2,width);
 y_=random(60,(height/3));
}
  
  }
  void dibujarTrazo() {

if (amp<minAmp+10){
    ampM = map(amp, minAmp, maxAmp, 110, 90);
    pitchM = map (pitch, minPitch, maxPitch, 3,5);

}
else{
 ampM = map(amp, minAmp, maxAmp, 50, 20);
 pitchM = map (pitch, minPitch, maxPitch, 7, 10);

}

    if (estado.equals("restablecer")) {
     println("contar"+contar);
        imagen = loadImage( nombreTrazo );
      radio = ampM;// ancho de pincel
      dist=pitchM;
      PosXY();
      x = x_;
      y = y_; 
      avanzar=1;
      cont=0;
      cualPorcion=0;
      nombreTrazo="borde"+int(random(0, 9))+".png";
      println(nombreTrazo);
      
      alfaf=185;
      colorActual = devolverColor();
      estado="dibujarCirculo";
    } else if (estado.equals("dibujarCirculo") ) {
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
    if (cont==360|| x<60 || x>width-60 || x>width-radio/2-60 || y<60 || y>height-60 ||y>height-radio/2-60) {
         if (estado.equals("reiniciando")){}
   else{
   estado="restablecer";
      yaTengoCuatrosPuntos = false;
      contar++;
      }
    }

  }
  void termino () {
    if(cont<80){}
    else{
   
   if (estado.equals("reiniciando")){}
   else{
   estado="restablecer";
  contar++;
    
    yaTengoCuatrosPuntos = false;}
  }}

  void reiniciar() {
    if (contar==int(random(30, 120))) {
// agregar con para q queda estatica la obra por unos frames
    ReiniciarEn=3;
  
   
      //  background(255);

       estado="reiniciando";
         yaTengoCuatrosPuntos = false; 
     // contar++;

  }
 
  if (ReiniciarEn>2){
    ReiniciarEn++;
    println("por reiniciar "+ ReiniciarEn);   
    if (ReiniciarEn>40){
 image(bg, 0, 0, width, height);
    //  println("reiniciand");

              cantidad=int(random(3,6)); //colores
              
                 p = new Paleta();
      contar=0;
    
    if (ReiniciarEn>60){

        estado="restablecer";
        ReiniciarEn=0;
      }  
}
      
  }
}
}
