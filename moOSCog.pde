import oscP5.*;
import netP5.*;
OscP5 mocoge, cogome;
NetAddress monomeIn, cogeIn;
Monome m;

///monome app parameters
int seqrow;

///coges parameters
int seq0step, seq1step,stepstate, seq0prevstep, seq1prevstep;

void setup() {
  //frameRate(1);
  mocoge = new OscP5(this,1234);  ///coge's OSC output port
  cogome = new OscP5(this,8000);  ///monomeserials output port
  monomeIn = new NetAddress("127.0.0.1", 8080); ///monomeserials input port
  cogeIn = new NetAddress("127.0.0.1", 1235); ///coge's OSC input port
  m = new Monome(8,16,"cogeVJ");
  seq0step = 0;
  seq1step = 0;
  //m.setCol(0,0);
}
  
void oscEvent(OscMessage theOscMessage) {
////COGEMESSAGES
//if(theOscMessage.checkTypetag("iii")) {
  ///we're sure the message is form coge, as it sends nothing but single floats
//print(" addrpattern: "+theOscMessage.addrPattern());
//}
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos")==true) {
    seq0step = int(16 * theOscMessage.get(0).floatValue());
        if (seq0step != seq0prevstep) {
          m.invertLed(seq0prevstep,0);
          m.invertLed(seq0step,0);
          seq0prevstep = seq0step;
    }
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos")==true) {
    seq1step = int(16 * theOscMessage.get(0).floatValue());
        if (seq1step != seq1prevstep) {
          m.invertLed(seq1prevstep,1);
          m.invertLed(seq1step,1);
          seq1prevstep = seq1step;
    }
  }
  
 ////SEQ0EVENTS
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos0")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(0,0,stepstate);
    m.rowStates[0].set(0,intToBoolean(stepstate));
  }
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos1")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(1,0,stepstate);
    m.rowStates[0].set(1,intToBoolean(stepstate));
  }
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos2")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(2,0,stepstate);
    m.rowStates[0].set(2,intToBoolean(stepstate));  
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos3")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(3,0,stepstate);
    m.rowStates[0].set(3,intToBoolean(stepstate));
  }  if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos4")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(4,0,stepstate);
    m.rowStates[0].set(4,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos5")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(5,0,stepstate);
    m.rowStates[0].set(5,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos6")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(6,0,stepstate);
    m.rowStates[0].set(6,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos7")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(7,0,stepstate);
    m.rowStates[0].set(7,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos8")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(8,0,stepstate);
    m.rowStates[0].set(8,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos9")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(9,0,stepstate);
    m.rowStates[0].set(9,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos10")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(10,0,stepstate);
    m.rowStates[0].set(10,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos11")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(11,0,stepstate);
    m.rowStates[0].set(11,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos12")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(12,0,stepstate);
    m.rowStates[0].set(12,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos13")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(13,0,stepstate);
    m.rowStates[0].set(13,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos14")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(14,0,stepstate);
    m.rowStates[0].set(14,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos15")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(15,0,stepstate);
    m.rowStates[0].set(15,intToBoolean(stepstate));
  }
//} else {
////MONOMEMESSAGES
    if(theOscMessage.checkAddrPattern("/cogeVJ/press")==true) {
    int row = int(theOscMessage.get(1).intValue());
    int col = int(theOscMessage.get(0).intValue());
    int state = int(theOscMessage.get(2).intValue());
    if (row < 2) { ///this must be coming from row 1 or 2, so the sequencers!)

      if (state == 1){
        if (m.rowStates[row].get(col) == true) {
          print(row +","+col+","+state);
          setSeq(col,row,0);
          m.setLed(col,row,0);
          m.rowStates[row].set(col,false);
          //m.rowStates[row].flip(col);
        }else {
          setSeq(col,row,1);
          m.setLed(col,row,1);
          m.rowStates[row].set(col,true);
          //m.rowStates[row].flip(col);
        }
      }
    } else if(row == 7 && col == 15) {
      if (state == 1) {
        tapBPM(state); 
      }
    }
  } 
}


void draw () {
//  m.setCol(step, 255);
  //setSeqs();


}
