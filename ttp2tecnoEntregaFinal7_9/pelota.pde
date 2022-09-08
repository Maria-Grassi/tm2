class Pelota {
  FCircle pelota;

   Pelota() {
     pelotaa=loadImage("Tecno_Pelota.png");
    pelota = new FCircle(40);
    mundo.add(pelota);
    pelota.setGrabbable(false);
    pelota.setPosition(50, 50);
    pelota.setStaticBody(true);
    pelota.attachImage(pelotaa);
  }

  void dibujar() {
    if(mousePressed == false && pelota.isSleeping() == true){
      pelota.setStaticBody(true);
    }
  }

  void mousePresionado() {

    pelota.setDamping(1);
    pelota.setStaticBody(false);
  
  }
}
