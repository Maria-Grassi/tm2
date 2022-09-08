/*
TP2 comision Matias
Tecnología Multimedia 2 | Cátedra Causa 
Facultad de Artes UNLP 2022 | Trabajo Práctico #2.
Comisión Matías
Integrantes 
Comisión Matías
Máximo Grisotto(88247/0),
 Elea Carrillo(88116/9), 
Maria Grassi (88237/7)
link video: https://youtu.be/xte--jtbzLo*/

import fisica.*;

import processing.sound.*;
import ddf.minim.*;

Minim minim;
AudioPlayer  caerhoyo, ganar;
SoundFile   pegarpelota;

FWorld mundo;
Pared paredes;
Pelota pelota;
Puntero puntero;
Terreno terreno;
//estados estados;
Molino molino1, molino2, molino3;
Hoyo hoyo;
float alfa, beta, angleSin, angleCos,distancia, a,  contador = 10;
PVector v1, v2;
PImage bg, bgP, bgG, boton;
PImage asta1, asta2, pelotaa, agua, arenita;
int golpes;
void setup() {
 
 minim=new Minim(this);
  caerhoyo = minim.loadFile( "PelotaEnHoyo.mp3");
  pegarpelota = new SoundFile(this,"PelotaGolpe.mp3");
  bg = loadImage("TEcno_MapaGolf1.png");
bgP = loadImage("P.png");
bgG = loadImage("G.png");
boton = loadImage("boton.png");
  size(900,506);
  Fisica.init(this);

  mundo = new FWorld();
  mundo.setEdges();
  mundo.setGravity(0, 0);
    paredes = new Pared();
      pelota = new Pelota();
  puntero = new Puntero();
  hoyo = new Hoyo();
  terreno = new Terreno();
  molino1 =new Molino(350,70);
  molino2 =new Molino(600,70);
  molino3 =new Molino(150,420);
   golpes=25;
//estados = new estados();
}
void draw(){
 background(bg);
  
  jugar();
}

void mousePressed() {
  pelota.mousePresionado();
  puntero.mousePresionado();
 // hoyo.mousePresionado();
golpes--;
}

void jugar(){
  
 mundo.step();
    image(agua, 740,20,  150,292);
  image(arenita, 280,140,  210,212);
      textSize(40);
      fill(255);
    String golpess = golpes + " tiros";
text(golpess,20,150, 200,100); 
 
  mundo.draw();
  pelota.dibujar();
    terreno.dibujar();
  puntero.dibujar();
 //  hoyo.dibujar();
 molino1.rotar(11);
 molino2.rotar(11);
 molino3.rotar(11);
ganar();
perder();
    for (int i=0; i<4; i++) {
    if ( terreno.elevado(pelota.pelota, i) == true) {
      if (i==0) {
        pelota.pelota.addForce( contador * cos(radians(-90)), contador * sin(radians(-90)));
      } else if (i==1) {
        pelota.pelota.addForce( contador * cos(radians(180)), contador * sin(radians(180)));
      } else if (i==2) {
        pelota.pelota.addForce( contador * cos(radians(90)), contador * sin(radians(90)));
      } else if (i==3) {
        pelota.pelota.addForce( contador * cos(radians(0)), contador * sin(radians(0)));
      }

      contador = contador >= 500 ? contador = 50 : contador;
      contador++;
      println(contador);
    }
  }

  if ( terreno.depresion(pelota.pelota) == true) {
    pelota.pelota.setDamping(3);
  }

}
void perder() {
if ( golpes ==0){
 background(bgP);
  println("perdiste");
              mundo.remove(pelota.pelota);
mundo.remove(puntero.puntero);
mundo.remove(puntero.punteroMouse);
     image(boton,width/3,height/3,150,150);
    float distB=dist(mouseX,mouseY,width/3+75,height/3+75);
      println(distB);
    if (distB<75) {
      golpes=25;
      mundo.add(pelota.pelota);
mundo.add(puntero.puntero);
mundo.add(puntero.punteroMouse);     
      if (mousePressed) {
        frameCount=0;


      }
    
    }
}
}
void ganar() {
   distancia=  dist(pelota.pelota.getX(),pelota.pelota.getY(),width - 70, height-70);
if (distancia<20 ){
 
  background(bgG);
   caerhoyo.play();
  println("ganaste");
pelota.pelota.setStaticBody(true);

  // println("ganaste");

    image(boton,width/3,height/3,150,150);
    float distB=dist(mouseX,mouseY,width/3+75,height/3+75);
     println("dist "+ distB);
    if (distB<75) {
      golpes=25;
  caerhoyo.pause();
      if (mousePressed) {
          
   setup();
   
     
      
      }
    }
  }
}
      
