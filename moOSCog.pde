import oscP5.*;
import netP5.*;
OscP5 mocoge, cogome;
NetAddress monomeIn, cogeIn;
Monome m;

///monome app parameters
int seqrow;



///coges parameters
int step, stepstate;
int prevstep;


int[] seq1state = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

void setup() {
  //frameRate(1);
  mocoge = new OscP5(this,1234);  ///coge's OSC output port
  cogome = new OscP5(this,8000);  ///monomeserials output port
  monomeIn = new NetAddress("127.0.0.1", 8080); ///monomeserials input port
  cogeIn = new NetAddress("127.0.0.1", 1235); ///coge's OSC input port
  m = new Monome(8,16,"cogeVJ");
  step = 0;
  m.setCol(0,0);
}
  
void oscEvent(OscMessage theOscMessage) {
////COGEMESSAGES
//if(theOscMessage.checkTypetag("iii")) {
  ///we're sure the message is form coge, as it sends nothing but single floats
//print(" addrpattern: "+theOscMessage.addrPattern());
//}
  if(theOscMessage.checkAddrPattern("/cogeVJ/seqPOS")==true) {
    step = int(16 * theOscMessage.get(0).floatValue())+1;
  }
 ////SEQ1EVENTS
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos1")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    seq1state[0] = stepstate;
    println(seq1state);
    m.setLed(0,0,stepstate);
  }
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos2")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    println(stepstate);
    m.setLed(1,0,stepstate);
  }
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos3")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    println(stepstate);
    m.setLed(2,0,stepstate);
  }
//} else {
////MONOMEMESSAGES
    if(theOscMessage.checkAddrPattern("/cogeVJ/press")==true) {
      println ("buttonpress");
    int row = int(theOscMessage.get(1).intValue());
    if (row < 2) { ///this must be coming from row 1 or 2, so the sequencers!)
      int col = int(theOscMessage.get(0).intValue());
      int state = int(theOscMessage.get(2).intValue());
      if (state == 1) {
        //println(stepstate);
        setseq(row+1,col+1,state);
        seq1state[0] = state;
      }
    }
  } 
}


void draw () {
//  m.setCol(step, 255);
    if (step != prevstep) {
          //m.setCol(prevstep, 0);
          m.invertCol(prevstep);
          m.invertCol(step);
          //m.setCol(step, 1);
          prevstep = step;
    }


}
