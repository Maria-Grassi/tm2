
class Salpicadura {

  float x, y;
  float t;
  int num =4;
  int sal;
  String  estado;
  boolean mostrar;
  PImage [] imagen = new PImage[num];

  Salpicadura () {
  estado ="empezar";

    for (int i=0; i<num; i++) {
      imagen[i] = loadImage("salpicadura"+i+".png");
    }
  }

  void dibujar() {

if (estado.equals("empezar") ) {
   
    x = random (width-990, width-200);
    y = random (height-800, height-200);

    push();
    int cual = int (random (0, 4));
    tint(c.devolverColor());
    image(imagen[cual], x, y, 200, 200);
    pop();

     estado = "puaj";
   }
  }
  

  
  
  void terminar () {
   estado = "empezar";
    
  }
  
}
