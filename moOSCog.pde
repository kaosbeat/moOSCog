import oscP5.*;
import netP5.*;
OscP5 mocoge, cogome;
NetAddress monomeIn, cogeIn;
Monome m;
PImage moOSCog;


///monome app parameters
int seqrow;

///coges parameters
int seq0step, seq1step,stepstate, seq0prevstep, seq1prevstep;

void setup() {
  //frameRate(1);
  background(255);
  size(400,400);
  mocoge = new OscP5(this,1234);  ///coge's OSC output port
  cogome = new OscP5(this,8000);  ///monomeserials output port
  monomeIn = new NetAddress("127.0.0.1", 8080); ///monomeserials input port
  cogeIn = new NetAddress("127.0.0.1", 1235); ///coge's OSC input port
  m = new Monome(8,16,"cogeVJ");
  seq0step = 0;
  seq1step = 0;
  //m.setCol(0,0);
  moOSCog = loadImage("data.png");
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
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq0toggle")==true) {
    int seq0 = int(theOscMessage.get(0).floatValue());
    //if (m.rowStates[2].get(0) == true) {
    m.setLed(0,2,seq0);
    //}
  }
  
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq1toggle")==true) {
    int seq1 = int(theOscMessage.get(0).floatValue());
    //if (m.rowStates[2].get(0) == true) {
    m.setLed(15,2,seq1);
    //}
  }
  
  
  

 ////SEQ0EVENTS
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos0")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(0,0,stepstate);
    //println("cogemessage");
    //m.rowStates[0].set(0,intToBoolean(stepstate));
  }
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos1")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(1,0,stepstate);
   // m.rowStates[0].set(1,intToBoolean(stepstate));
  }
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos2")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(2,0,stepstate);
    //m.rowStates[0].set(2,intToBoolean(stepstate));  
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos3")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(3,0,stepstate);
   // m.rowStates[0].set(3,intToBoolean(stepstate));
  }  if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos4")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(4,0,stepstate);
    //m.rowStates[0].set(4,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos5")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(5,0,stepstate);
    //m.rowStates[0].set(5,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos6")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(6,0,stepstate);
   // m.rowStates[0].set(6,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos7")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(7,0,stepstate);
    //m.rowStates[0].set(7,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos8")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(8,0,stepstate);
    //println("just ran setLed " +stepstate);
   // m.rowStates[0].set(8,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos9")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(9,0,stepstate);
    //println("just ran setLed " +stepstate);
  //  m.rowStates[0].set(9,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos10")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(10,0,stepstate);
  //  m.rowStates[0].set(10,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos11")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(11,0,stepstate);
    //m.rowStates[0].set(11,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos12")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(12,0,stepstate);
    //m.rowStates[0].set(12,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos13")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(13,0,stepstate);
    //m.rowStates[0].set(13,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos14")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(14,0,stepstate);
   // m.rowStates[0].set(14,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq0pos15")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(15,0,stepstate);
    //m.rowStates[0].set(15,intToBoolean(stepstate));
  }
  
  
  
   ////seq1EVENTS
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos0")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(0,1,stepstate);
    println("cogemessage");
    //m.rowStates[0].set(0,intToBoolean(stepstate));
  }
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos1")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(1,1,stepstate);
   // m.rowStates[0].set(1,intToBoolean(stepstate));
  }
  if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos2")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(2,1,stepstate);
    //m.rowStates[0].set(2,intToBoolean(stepstate));  
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos3")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(3,1,stepstate);
   // m.rowStates[0].set(3,intToBoolean(stepstate));
  }  if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos4")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(4,1,stepstate);
    //m.rowStates[0].set(4,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos5")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(5,1,stepstate);
    //m.rowStates[0].set(5,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos6")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(6,1,stepstate);
   // m.rowStates[0].set(6,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos7")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(7,1,stepstate);
    //m.rowStates[0].set(7,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos8")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(8,1,stepstate);
    //println("just ran setLed " +stepstate);
   // m.rowStates[0].set(8,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos9")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(9,1,stepstate);
    //println("just ran setLed " +stepstate);
  //  m.rowStates[0].set(9,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos10")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(10,1,stepstate);
  //  m.rowStates[0].set(10,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos11")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(11,1,stepstate);
    //m.rowStates[0].set(11,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos12")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(12,1,stepstate);
    //m.rowStates[0].set(12,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos13")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(13,1,stepstate);
    //m.rowStates[0].set(13,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos14")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(14,1,stepstate);
   // m.rowStates[0].set(14,intToBoolean(stepstate));
  }
    if(theOscMessage.checkAddrPattern("/cogeVJ/seq1pos15")==true) {
    stepstate = int(theOscMessage.get(0).floatValue());
    m.setLed(15,1,stepstate);
    //m.rowStates[0].set(15,intToBoolean(stepstate));
  }


//} else {
////MONOMEMESSAGES
    if(theOscMessage.checkAddrPattern("/cogeVJ/press")==true) {
    int row = int(theOscMessage.get(1).intValue());
    int col = int(theOscMessage.get(0).intValue());
    int state = int(theOscMessage.get(2).intValue());
    if (row < 2) { ///this must be coming from row 1 or 2, so the sequencers!)
      if (state == 1 && m.rowStates[2].get(0) == true){
        if (m.rowStates[row].get(col) == true) {
          print(row +","+col+","+state);
          setSeq(col,row,0);
          m.setLed(col,row,0);
          //m.rowStates[row].set(col,false);
          //m.rowStates[row].flip(col);
        }else {
          setSeq(col,row,1);
          m.setLed(col,row,1);
         // m.rowStates[row].set(col,true);
          //m.rowStates[row].flip(col);
        }
      }
      if (state == 1 && row == 0 && m.rowStates[2].get(0) == false){
         banktrigger(col,row);
      }
      if (state == 1 && row == 1 && m.rowStates[2].get(15) == false){
         banktrigger(col,row);
      }
    } else if(col == 0 && row > 3 && row < 6 ) {
      if (state == 1) {
        masterLayer(row); 
      }
    } else if(col > 0 && col < 4 && row > 2 && row < 8 && state == 1) {
      if (col == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {5});}
        if (row == 5) { masterEffect(row, col,new int[] {4});}
        if (row == 6) { masterEffect(row, col,new int[] {7});}
        if (row == 7) { masterEffect(row, col,new int[] {6});}
      } else if (col == 2) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {5});}
        if (row == 5) { masterEffect(row, col,new int[] {4});}
        if (row == 6) { masterEffect(row, col,new int[] {});}
      } else if (col == 3) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {5});}
        if (row == 5) { masterEffect(row, col,new int[] {4});}
        if (row == 6) { masterEffect(row, col,new int[] {});}
        if (row == 7) { masterEffect(row, col,new int[] {});}
      }
   /////FXCHAIN 1
   } else if(col == 5 && row > 2 && row < 8 ) { //city lights
      if (state == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {});}
        if (row == 5) { masterEffect(row, col,new int[] {});}
      }
    } else if(col == 6 && row > 2 && row < 8 ) { //Frames and shapes
      if (state == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {});}
        if (row == 5) { masterEffect(row, col,new int[] {});}
        if (row == 6) { masterEffect(row, col,new int[] {});}
        if (row == 7) { masterEffect(row, col,new int[] {});}
      } 
    } else if(col == 7 && row > 2 && row < 8 ) { //dot screen
      if (state == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {});}
        if (row == 5) { masterEffect(row, col,new int[] {});}
      }
    } else if(col == 8 && row > 2 && row < 8 ) { ///target crosshair
      if (state == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {});}
        if (row == 5) { masterEffect(row, col,new int[] {});}
        if (row == 6) { masterEffect(row, col,new int[] {});}
        if (row == 7) { masterEffect(row, col,new int[] {});}
      }
    } else if(col == 9 && row > 2 && row < 8 ) { ///blazed trail
      if (state == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {});}
        if (row == 5) { masterEffect(row, col,new int[] {});}
        if (row == 6) { masterEffect(row, col,new int[] {});}
        if (row == 7) { masterEffect(row, col,new int[] {});}
      }
   /////FXCHAIN 2
    } else if(col == 10 && row > 2 && row < 8 ) { /// M8 trace
      if (state == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {});}
        if (row == 5) { masterEffect(row, col,new int[] {});}
        if (row == 6) { masterEffect(row, col,new int[] {});}
      }
    } else if(col == 11 && row > 2 && row < 8 ) { ///BAD TV
      if (state == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {});}
        if (row == 5) { masterEffect(row, col,new int[] {});}
        if (row == 6) { masterEffect(row, col,new int[] {});}
        if (row == 7) { masterEffect(row, col,new int[] {});}
      }
    } else if(col == 12 && row > 2 && row < 8 ) { ///RGB shift
      if (state == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {});}
        if (row == 5) { masterEffect(row, col,new int[] {});}
      }   
    } else if(col == 13 && row > 2 && row < 8 ) { ///PUSH XY
      if (state == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {});}
        if (row == 5) { masterEffect(row, col,new int[] {});}
      }
    } else if(col == 14 && row > 2 && row < 8 ) { ///Konstructivist
      if (state == 1) {
        if (row == 3) { masterEffect(row, col,new int[] {});}
        if (row == 4) { masterEffect(row, col,new int[] {});}
        if (row == 5) { masterEffect(row, col,new int[] {});}
        if (row == 6) { masterEffect(row, col,new int[] {});}
        if (row == 7) { masterEffect(row, col,new int[] {});}
      }
    } else if(row == 2) {  ////alll the sequencer controls
      if (state ==1) {
         if (col == 0) {seq0toggle();}
         if (col == 15) {seq1toggle();}
      }
      
    } else if(col == 15 && row == 7) {
      if (state == 1) {
        tapBPM(state); 
      }
    }
  } 
}


void draw () {
//  m.setCol(step, 255);
  //setSeqs();
  //println(m.rowStates[0].toString() );
  image(moOSCog, 0, 0);
  

}
