
float alfac, colorr;
int posX ;
class Paleta {
  PImage imagen;
  Paleta( ) {
    imagen = loadImage("paleta de color.jpg");
  
  }

  color darUnColor1(float alfa ) {
     posX = 120;
 
    int posY = int( random(250, 350));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa );
  }
  color darUnColor2(float alfa) {
  posX = 120;
    int posY = int( random( 80, 170));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa );
  }
  color darUnColor3(float alfa) {
posX = 120;
    int posY = int( random( 0, 20 ));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa );
  }
    color darUnColor4(float alfa ) {
    posX = 120;

    int posY = int( random(170, 250));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa );
  }
  color darUnColor5(float alfa) {
 posX = 120;
    int posY = int( random( 350, 425));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa );
  }
  color darUnColor6(float alfa) {
      posX = 120;
    int posY = int( random( 425, 500 ));
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
