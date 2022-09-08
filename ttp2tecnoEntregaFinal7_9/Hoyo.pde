class Hoyo {
  FCircle hoyo;

  Hoyo() {
    hoyo = new FCircle(45);
    mundo.add(hoyo);


    hoyo.setPosition(width - 70, height-70);
    hoyo.setFillColor(color(0));
    hoyo.setGrabbable(false);
    hoyo.setSensor(true);
    hoyo.isSensor();
    
    hoyo.setStaticBody(true);
  }


     boolean gano(FBody x){
    
    return hoyo.isTouchingBody(x);
  
  }

}
