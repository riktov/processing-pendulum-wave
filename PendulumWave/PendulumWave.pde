// https://en.wikipedia.org/wiki/Pendulum_wave

import java.util.ArrayList ;

ArrayList<Pendulum> pendulums = new ArrayList<Pendulum>();
PVector gravity = new PVector(0.0, 2) ;

void setup() {
  size(800, 800) ;
  //frameRate(30) ;

  final int CLOSENESS = 100 ; //not sure what the value actually represents
  final int MAX_LEN = 550 ;
   
  //the lengths must be proportional to 1/i^2

  for(int i = 1 ; i < 13 ; i++) {
    float j = i + CLOSENESS ;
    float length = MAX_LEN * pow(CLOSENESS, 2) / pow(j, 2) ;
    
    println(i + ": " + length) ;
    
    Pendulum pend = new Pendulum(length, new PVector(400, 0)) ;

    pend.rotate(PI / -6) ;
    pendulums.add(pend) ;
  }
}


void draw() {
  background(255, 200, 78) ;
 
  int i = 0 ;
  for(Pendulum pend : pendulums){
    line(pend.ptOrigin.x, pend.ptOrigin.y, pend.ptOrigin.x + pend.x, pend.ptOrigin.y + pend.y) ;
    
    switch(i % 4) {
      case 0:
        fill(255, 0, 0) ;
        break ;
      case 1:
        fill(0, 255, 0) ;
        break ;
      case 2:
        fill(0, 0, 255) ;
        break ;
      case 3:
        fill(255, 255, 0) ;
        break ;
      default :
        fill(100, 100, 0) ;
    }
    circle(pend.ptOrigin.x + pend.x, pend.ptOrigin.y + pend.y, 20);
    pend.advance(gravity) ; 
    i = (i + 1) % 4 ; ;
  } ;
}
