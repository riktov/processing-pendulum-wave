// https://en.wikipedia.org/wiki/Pendulum_wave

import java.util.ArrayList ;

ArrayList<Pendulum> pendulums = new ArrayList<Pendulum>();
PVector gravity = new PVector(0.0, 2) ;

void setup() {
  size(800, 800) ;
  frameRate(30) ;
  
  float initLength = 300000 ;
  
  //the lengths must be proportional to 1/i^2
  //just tweak initLength and the addition for j, to get it looking right.
  for(int i = 1 ; i < 15 ; i++) {
    float j = i + 20 ;
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
 
  for(Pendulum pend : pendulums){
    line(pend.ptOrigin.x, pend.ptOrigin.y, pend.ptOrigin.x + pend.x, pend.ptOrigin.y + pend.y) ;
    circle(pend.ptOrigin.x + pend.x, pend.ptOrigin.y + pend.y, 20);
    pend.advance(gravity) ;    
  } ;
}
