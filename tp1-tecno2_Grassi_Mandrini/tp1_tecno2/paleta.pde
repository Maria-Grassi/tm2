
float alfac, colorr;
int posX ;
class Paleta {
  PImage imagen;
  Paleta( ) {
    imagen = loadImage("paleta.png");
  posX = int(random(0,750));
  }

  color darUnColor1(float alfa ) {
     
 //azul
    int posY = int( random(20, 60));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa );
  }
  color darUnColor2(float alfa) {
    //magenta

    int posY = int( random( 140, 180));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa );
  }
  color darUnColor3(float alfa) {
//marron
    int posY = int( random( 260, 300 ));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa );
  }
    color darUnColor4(float alfa ) {
  //amarillo

    int posY = int( random(380, 440));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa );
  }
  color darUnColor5(float alfa) {
//violeta
    int posY = int( random( 500, 560));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa );
  }


  /*color variarColor( float colorr_, float alfac_ ) {
    colorr= colorr_;
    alfac= alfac_;

    if (colorr==1) {
      return  darUnColorAmarillo(alfac);
    } else if (colorr==2) {
      return darUnColorMagenta(alfac);
    } else if (colorr==3) {
      return  darUnColorAzul(alfac);
    }
  }*/
}
