// https://en.wikipedia.org/wiki/Pendulum_wave

import java.util.ArrayList ;

ArrayList<Pendulum> pendulums = new ArrayList<Pendulum>();
PVector gravity = new PVector(0.0, 2) ;

void setup() {
  size(800, 800) ;
  frameRate(30) ;
  
  float initLength = 1500000 ;
  
  //the lengths must be proportional to 1/i^2
  //just tweak initLength and the addition for j, to get it looking right.
  for(int i = 1 ; i < 13 ; i++) {
    float j = i + 50 ;
    float length = initLength / (j * j) ;
    
    Pendulum pend = new Pendulum(length, new PVector(400, 0)) ;
    //length = length * 1.41 ;
    //length = (i+1) * 30 ;
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
