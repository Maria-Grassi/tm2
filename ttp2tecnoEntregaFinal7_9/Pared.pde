class Pared {
  int cant = 6;
  FBox [] pared = new FBox [cant];
  FPoly [] triangulos= new FPoly[cant];
  Pared() {
   float ancho=15;
   float alto= 110;
    pared [0] = new FBox(700, ancho);
    pared [1] = new FBox(820, ancho);
    pared [2] = new FBox(ancho, alto);
    pared [3] = new FBox(ancho, alto);
    pared [4] = new FBox(ancho, alto);
    pared [5] = new FBox(155, alto);
    
 
    for (int i = 0; i < cant; i++) {
     triangulos[i]= new FPoly();
      mundo.add(pared [i]);
  mundo.add(triangulos [i]);
      pared [i].setStatic(true);
      pared [i].setRestitution(0.5);
      pared [i].setGrabbable(false);
      pared[i].setNoFill();
      pared  [i].setNoStroke();
    }

triangulos[0].vertex(0,0);
triangulos[0].vertex(280,0);
triangulos[0].vertex(280,40);


triangulos[1].vertex(0,40);
triangulos[1].vertex(280,40);
triangulos[1].vertex(280,0);

triangulos[2].vertex(10,0);
triangulos[2].vertex(180,0);
triangulos[2].vertex(95,90);

triangulos[3].vertex(10,0);
triangulos[3].vertex(180,0);
triangulos[3].vertex(93,90);

triangulos[4].vertex(10,90);
triangulos[4].vertex(180,90);
triangulos[4].vertex(90,0);

triangulos[5].vertex(0,0);
triangulos[5].vertex(0,90);
triangulos[5].vertex(90,90);

 
    for (int i = 0; i < cant; i++) {
     
     
  mundo.add(triangulos [i]);
   triangulos [i].setStatic(true);
      triangulos [i].setRestitution(0.5);
      triangulos [i].setGrabbable(false);
      triangulos [i].setNoFill();
      triangulos [i].setNoStroke();
    }
triangulos[0].setPosition(5, 5);
triangulos[1].setPosition(5, height/3-70);
  
  
triangulos[2].setPosition((width/5)+2,340 );

triangulos[3].setPosition((width/5)*2.7,340 );


triangulos[4].setPosition((width/5)*3.3,410 );


triangulos[5].setPosition(0,420 );

   pared [0].setPosition((340) , (height/3)-25);
    pared [1].setPosition(500, (height/3)*2);
    pared [2].setPosition(612, 200);
    pared [3].setPosition((width/6)*1.7, 280);
    pared [4].setPosition((width/6)*3.4, 280);
    pared [5].setPosition(80, 200);
    
    
   
    

  }
}
