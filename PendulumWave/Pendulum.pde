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
    float m = (sin(a) / this.mag()) * force.mag() ;
    this.motion = this.motion + m ;
    
    //println("Motion:" + this.motion) ;
    this.rotate(this.motion) ;
  }
}
