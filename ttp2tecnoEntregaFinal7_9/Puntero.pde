class Puntero {
  FCircle puntero;
  FMouseJoint punteroMouse;

  Puntero() {
   
    puntero = new FCircle(10);
    punteroMouse = new FMouseJoint(puntero, width/2, height/2);

    mundo.add(puntero);
    mundo.add(punteroMouse);
    puntero.setPosition(width/2, height/2);
    //pelota.setDensity(13.764516129);
  }

  void dibujar() {
    if (mousePressed == true) {
     
      //puntero.setGrabbable(false);
      //puntero.setStaticBody(true);
      //punteroMouse.setTarget(puntero.getX(), puntero.getY());
    } else {
      
      puntero.setGrabbable(true);
      //puntero.setStaticBody(false);
      punteroMouse.setTarget(mouseX, mouseY);
  if (pelota.pelota.getVelocityX() < 1){
  pelota.pelota.setStaticBody(true);}
     //puntero.setSensor(true);
    }
  }

  void mousePresionado() {
     pegarpelota.play();
    puntero.setVelocity(450,450);
    punteroMouse.setTarget(mouseX, mouseY);

  }
}
