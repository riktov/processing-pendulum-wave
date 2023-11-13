// https://en.wikipedia.org/wiki/Pendulum_wave

import java.util.ArrayList ;

ArrayList<Pendulum> pendulums = new ArrayList<Pendulum>();
PVector gravity = new PVector(0.0, 1) ;
float rot = 0 ;

void setup() {
  size(800, 800) ;
  //frameRate(30) ;

  final int CLOSENESS = 70 ; //not sure what the value actually represents
  final int MAX_LEN = 750 ;
  final int NUM_PENDULUMS = 13 ;
  
  //the lengths must be proportional to 1/i^2

  for(int i = 0 ; i < NUM_PENDULUMS ; i++) {
    float length = MAX_LEN * pow(CLOSENESS, 2) / pow(i + CLOSENESS, 2) ;
    
    Pendulum pend = new Pendulum(length, new PVector(width/2, 0)) ;

    pend.rotate(PI / -6) ;
    pendulums.add(pend) ;
  }
}


void draw() {
  translate(width / 2, 0) ;
  //rotate(rot) ;
  rot += QUARTER_PI / 32 ;
  //drawBallsAndStrings() ;
  drawConnectingSegments() ;
  //drawColorSegments() ;

}

color getColor(int idx) {
  switch(idx % 4) {
    case 0:
      return color(255, 0, 0) ;
    case 1:
      return color(0, 255, 0) ;
    case 2:
      return color(0, 0, 255) ;
    case 3:
      return color(255, 255, 0) ;
    default :
      return color(0, 0, 0) ;
  }
}

void drawBallsAndStrings() {
  background(255, 200, 78) ;
 
  int i = 0 ;
  for(Pendulum pend : pendulums){
    line(0, 0, pend.x, pend.y) ;
    
    fill(getColor(i)) ;
    circle(pend.x, pend.y, 20);
    pend.advance(gravity) ; 
    i = (i + 1) % 4 ; ;
  } ;
}

/**
draw lines connecting two consecutive pendulums
For best effect, there should be 13 pendulums, to draw 12 segments.
*/
void drawConnectingSegments() {
  background(0) ;
  //background(255, 200, 78) ;
  Pendulum pend ;
 
  for(int i = 0 ; i < pendulums.size() ; i++) {   
    pend = pendulums.get(i) ;
    color col = getColor(i);

    strokeWeight(0) ;
    stroke(col) ;
    fill(col) ;

 
    if(i > 0) {
      Pendulum prevPend = pendulums.get(i - 1) ;
  
      strokeWeight(10) ;
      //line(prevPend.x, prevPend.y, pend.x, pend.y) ;
      line(prevPend.x, pend.y, pend.x, pend.y) ;  //horizontal lines
      //line(prevPend.x, prevPend.mag(), pend.x, pend.mag()) ;

      //fix y to length
      //line(prevPend.ptOrigin.x + prevPend.x, prevPend.ptOrigin.mag() + prevPend.y,pend.ptOrigin.x + pend.x, -1 * pend.ptOrigin.mag() + pend.y) ;
      
      //triangle(prevPend.ptOrigin.x + prevPend.x, prevPend.ptOrigin.y + prevPend.y, width / 2, 0, pend.ptOrigin.x + pend.x, pend.ptOrigin.y + pend.y);
    }
    pend.advance(gravity) ; 
  }
}

/**
draw jointed segments connecting the three pendulums of each color
For best effect, there should be 13 pendulums, to draw 12 segments.
*/
void drawColorSegments() {
  background(0) ;
  //background(255, 200, 78) ;
  
  strokeWeight(10) ;
  
  stroke(255, 0, 0) ;
  line(pendulums.get(0).x, pendulums.get(0).y, pendulums.get(4).x, pendulums.get(4).y) ; 
  line(pendulums.get(4).x, pendulums.get(4).y, pendulums.get(8).x, pendulums.get(8).y) ; 

  stroke(0, 255, 0) ;
  line(pendulums.get(1).x, pendulums.get(1).y, pendulums.get(5).x, pendulums.get(5).y) ; 
  line(pendulums.get(5).x, pendulums.get(5).y, pendulums.get(9).x, pendulums.get(9).y) ; 

  stroke(0, 0, 255) ;
  line(pendulums.get(2).x, pendulums.get(2).y, pendulums.get(6).x, pendulums.get(6).y) ; 
  line(pendulums.get(6).x, pendulums.get(6).y, pendulums.get(10).x, pendulums.get(10).y) ; 

  stroke(255, 255, 0) ;
  line(pendulums.get(3).x, pendulums.get(3).y, pendulums.get(7).x, pendulums.get(7).y) ; 
  line(pendulums.get(7).x, pendulums.get(7).y, pendulums.get(11).x, pendulums.get(11).y) ; 

  for(Pendulum pend : pendulums){
    pend.advance(gravity) ; 
  }
}
