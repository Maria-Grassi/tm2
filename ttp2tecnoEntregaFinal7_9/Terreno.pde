class Terreno {
  int posX, posY, ubicacionX, ubicacionY;
  int cantTrapecio = 4;
  FBox [] trapecio = new FBox [cantTrapecio];
  int [] posicion = new int [cantTrapecio];
  FPoly arena;

  Terreno() {
    ubicacionX = width/3-40;
    ubicacionY = height/3-50;
    posX =40;
    posY =  20;
    
agua=loadImage("Tecno_Charco.png");
arenita=loadImage("Tecno_Arena.png");

    arena = new FPoly();
    arena.vertex(50 + posX, 0 + posY);
    arena.vertex(100 + posX, 20 + posY);
    arena.vertex(60 + posX, 90 + posY);
    arena.vertex(50 + posX, 180 + posY);
    arena.vertex(10 + posX, 200 + posY);
    arena.vertex(-50 + posX, 200 + posY);
    arena.vertex(-60 + posX, 180 + posY);
    arena.vertex(-30 + posX, 120 + posY);
    arena.vertex(-20 + posX, 110 + posY);
    arena.vertex(-20 + posX, 80 + posY);
    arena.vertex(-40 + posX, 60 + posY);
    arena.vertex(-50 + posX, 30 + posY);
    arena.vertex(-20 + posX, -10 + posY);
    mundo.add(arena);

    for (int i = 0; i < cantTrapecio; i++) {
      trapecio [i] = new FBox(115, 75);
      trapecio [i].setGrabbable(false);
      trapecio [i].setSensor(true);


      mundo.add(trapecio [i]);
      trapecio [i].setNoFill();
      trapecio [i].setNoStroke();
      
    }
    trapecio [0].setPosition(100 + ubicacionX, 80 + ubicacionY);
    trapecio [2].setPosition(140 + ubicacionX, 180 + ubicacionY);
    trapecio [1].setRotation(radians(90));
    trapecio [3].setRotation(radians(90));
    trapecio [1].setPosition(70 + ubicacionX, 150 + ubicacionY);
    trapecio [3].setPosition(170 + ubicacionX, 110 + ubicacionY);




    arena.setFillColor(color(255));
    arena.setGrabbable(false);
    arena.setSensor(true);


    arena.setStaticBody(true);
    arena.setPosition(750,30);
    arena.setNoFill();
arena.setNoStroke();
  }

  boolean elevado(FBody x, int y) {
    return trapecio [y].isTouchingBody(x);
  }
  
 

  boolean depresion(FBody x) {
    return arena.isTouchingBody(x);
  }

  void dibujar() {
  }
}
