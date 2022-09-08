class Molino {
  FBox baseRemolino;
  FBox remolino1;
  FBox remolino2;
Molino(float molinoUbiX_, float molinoUbiY_){
  float molinoUbiX=molinoUbiX_;
  float molinoUbiY=molinoUbiY_;
    asta1 = loadImage("asta2.png");
      asta2 = loadImage("asta-molino.png");
      
  baseRemolino= new FBox(20,20);
  remolino1= new FBox(120,10);
   remolino2= new FBox(10,120);
   baseRemolino.setPosition(molinoUbiX, molinoUbiY);
baseRemolino.setFriction(0);

baseRemolino.setStatic(true);
mundo.add(baseRemolino);

remolino1.setPosition(molinoUbiX, molinoUbiY);
remolino1.setFriction(0);
remolino1.setAngularVelocity(5.9);
remolino1.attachImage(asta1);

mundo.add(remolino1);

remolino2.setPosition(molinoUbiX, molinoUbiY);

remolino2.setFriction(0);
remolino2.setAngularVelocity(2.9);
remolino2.attachImage(asta2);

mundo.add(remolino2);
FRevoluteJoint baseeremolino = new FRevoluteJoint(baseRemolino,remolino1,molinoUbiX, molinoUbiY);
mundo.add(baseeremolino);
FRevoluteJoint remolino = new FRevoluteJoint(remolino1,remolino2,molinoUbiX, molinoUbiY);
//molino.setAnchor(width/2, height/2);

remolino.setEnableLimit(true);


//remolino.setEnableMotor(true);
mundo.add(remolino);
//molino

}
void rotar(float vel_){
  float vel=vel_;
  remolino2.addTorque(vel);
remolino1.addTorque(vel);
}
}
