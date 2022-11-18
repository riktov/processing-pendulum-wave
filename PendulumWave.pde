import java.util.ArrayList ;

ArrayList<Pendulum> pendulums = new ArrayList<Pendulum>();
PVector gravity = new PVector(0.0, 1) ;

class Pendulum extends PVector {
  PVector ptOrigin ;
  float motion;  //rotation per tick

  Pendulum(float length, PVector origin) {
    this.set(0, 1);
    this.setMag(length) ;
    this.motion = 0 ;//PI / 50 ;
    this.ptOrigin = origin ;
  }
  
  void advance(PVector force) {
    float a = PVector.angleBetween(this, force) ;
    //println("Angle:" + a) ;
    if(this.x < 0) {
      a = -1 * a ;
    }
    float m = sin(a) / this.mag() ;
    this.motion = this.motion + m ;
    
    //println("Motion:" + this.motion) ;
    this.rotate(this.motion) ;
  }
}


void setup() {
  size(800, 800) ;
  frameRate(30) ;
  
  float length = 50 ;
  for(int i = 0 ; i < 15 ; i++) {
    Pendulum pend = new Pendulum(length, new PVector(400, 0)) ;
    //length = length * 1.41 ;
    length = (i+1) * 30 ;
    pend.rotate(PI / -6) ;
    pendulums.add(pend) ;
  }
}

void draw() {
  background(255, 200, 178) ;
 
  for(Pendulum pend : pendulums){
    line(pend.ptOrigin.x, pend.ptOrigin.y, pend.ptOrigin.x + pend.x, pend.ptOrigin.y + pend.y) ;
    circle(pend.ptOrigin.x + pend.x, pend.ptOrigin.y + pend.y, 20);
    pend.advance(gravity) ;    
  } ;
}
