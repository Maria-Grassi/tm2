//tp1 preubas estados

import oscP5.*;

//============variables de calibración==========

float minAmp = 25;
float maxAmp = 80;


float minPitch = 63;
float maxPitch = 96;

float minRuido = 100;
float maxRuido = 276;

float f = 0.9;

boolean monitor = false;

float maximoPico;

float UmbralRuido = 220;


float reiniciar = 8000;

//=======================================

OscP5 osc; // declaracion del objeto osc

int ruido = 0;
float amp, pitch = 0.0;
boolean antesHabiaSonido = false;
boolean antesHabiaRuido = false;
boolean haySonido;
long marcaDeTiempo;

GestorSenial gestorPitch;
GestorSenial gestorAmp;
GestorSenial gestorRuido;

Caminante c;
Salpicadura a;


void setup() {

  size(1200, 740, P3D );
  background(255);
  //colorMode(HSB, 360, 100, 100);
  c = new Caminante();

  //por defecto el rango es 0-100

  gestorAmp = new GestorSenial( minAmp, maxAmp, f );
  gestorPitch = new GestorSenial( minPitch, maxPitch, f );
   gestorRuido = new GestorSenial (minRuido, maxRuido, f);

  osc = new OscP5(this, 12345);
  a = new Salpicadura ();
}

void draw() {

  //en cada fotograma hay que actualizar
  gestorAmp.actualizar( amp );
  gestorPitch.actualizar( pitch );
  gestorRuido.actualizar( ruido );
  
  boolean haySonido = gestorAmp.filtradoNorm() > 0.5; //regular la cantidad de ruido
  boolean hayRuido = gestorRuido.filtradoNorm() > 0.5;
  //eventos de inicio y fin del sonido

  // boolean empezoElSonido = haySonido && !antesHabiaSonido;
  boolean terminoElSonido = !haySonido && antesHabiaSonido;
  boolean terminoElRuido = !hayRuido && antesHabiaRuido; 
  
  if (monitor) { // ver como está funcionando el gestor
    gestorAmp.imprimir( 150, 150 );
    gestorPitch.imprimir( 150, 350 );
  }


  if (haySonido ) { //!= ruido > UmbralRuido
    marcaDeTiempo = millis();
    maximoPico = 0;
c.mover();
    c.dibujarTrazo();
    maximoPico = max( maximoPico, gestorAmp.filtradoNorm() );
  }


  if ( terminoElSonido ) {
    c.termino();
  }

  antesHabiaSonido = haySonido;
    antesHabiaRuido = hayRuido;

  if (hayRuido) {
    a.dibujar ();
    haySonido = false;
    terminoElSonido = false;
  }
  
  if ( terminoElRuido ) {
    a.terminar();
  }
 c.reiniciar();
}




void oscEvent( OscMessage m) {

  if (m.addrPattern().equals("/amp")) {
    amp = m.get(0).floatValue();
    //println("amp: " + amp);
  }

  if (m.addrPattern().equals("/pitch")) {
    pitch = m.get(0).floatValue();
    // println("pitch: " + pitch);
  }


  if (m.addrPattern().equals("/ruido")) {
    ruido = m.get(0).intValue();
    println("ruido: " + ruido);
  }
}
