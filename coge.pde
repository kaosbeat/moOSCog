void setSeq(int pos, int seq, int state) {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq" + seq + "pos" + pos );
      Msg.add(float(state));
      //println(Msg);
      mocoge.send(Msg, cogeIn);
}

void seqBeats(int col, int row, int state) {
     OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq" + row + "beats" + col);
     Msg.add(1.0);
     m.setLed(1,2,0);
     m.setLed(2,2,0);
     m.setLed(3,2,0);
     m.setLed(4,2,0);
     m.setLed(5,2,0);
     m.setLed(6,2,0);
     m.setLed(9,2,0);
     m.setLed(10,2,0);
     m.setLed(11,2,0);
     m.setLed(12,2,0);
     m.setLed(13,2,0);
     m.setLed(14,2,0);
     m.setLed(col,row,1);
     mocoge.send(Msg, cogeIn);
}



void tapBPM(int state) {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/tapBPM");
      Msg.add(float(state));
      mocoge.send(Msg, cogeIn);
}

void banktrigger(int col, int row) {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/bank"+row+ "slot" +col );
      Msg.add(1.0);
      mocoge.send(Msg, cogeIn);
}

void masterLayer(int layer){
  if (m.rowStates[layer].get(0) == false) { 
     OscMessage Msg = new OscMessage("/"+ m.prefix + "/masterLayer" + layer);
     Msg.add(1.0);
     mocoge.send(Msg, cogeIn);
     m.setLed(0,layer,1);
     if (layer == 4) {
       m.setLed(0,5,0);
     } else if (layer == 5){
       m.setLed(0,4,0);
     }
  }
}
     
void masterEffect(int row, int col, int[] toggle){
    if (m.rowStates[row].get(col) == false) {
      //println("this button is off");
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/master" +col+ "Effect"+row);
      Msg.add(1.0); 
      mocoge.send(Msg, cogeIn);  
      m.setLed(col,row,1);
      for (int i:toggle) {
        println (i);
        m.setLed(col,i,0);
      }
    } else if (toggle.length == 0) {
      println("this button is on, but its not a radio button");
      m.setLed(col,row,0);
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/master" +col+ "Effect"+row); 
      Msg.add(0.0);
      mocoge.send(Msg, cogeIn);
    }  
  }
  


void chainEffect(int row, int col, int state){   
  OscMessage Msg = new OscMessage("/"+ m.prefix + "/chain" +row+ "Effect"+col); 
  if (state == 1) {
    if (m.rowStates[row].get(col) == false) {
      Msg.add(1);
      mocoge.send(Msg, cogeIn);
      m.setLed(col,row,1);
    } else {
      Msg.add(0);
      mocoge.send(Msg, cogeIn);
      m.setLed(col,row,0); 
    }  
  } else if (state == 0) {
   if (effectSwitch == 0) {
        if (m.rowStates[row].get(col) == false) {
      Msg.add(1);
      mocoge.send(Msg, cogeIn);
      m.setLed(col,row,1);
    } else {
      Msg.add(0);
      mocoge.send(Msg, cogeIn);
      m.setLed(col,row,0); 
    }  
   }    
  }
} 

void seq0toggle(){
  OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq0toggle");
  if (m.rowStates[2].get(0) == false) {
    println( m.rowStates[2].get(0) );
    Msg.add(1);
    mocoge.send(Msg, cogeIn);
    m.setLed(0,2,1);
  } else {
    println( m.rowStates[2].get(0) );
    Msg.add(0);
    mocoge.send(Msg, cogeIn);
    m.setLed(0,2,0);
  }
}

void seq1toggle(){
  OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq1toggle");
  if (m.rowStates[2].get(15) == false) { 
    Msg.add(1.0);
    mocoge.send(Msg, cogeIn);
    m.setLed(15,2,1);
  } else {
    Msg.add(0.0);
    mocoge.send(Msg, cogeIn);
    m.setLed(15,2,0);
  }
}




void bank0select(int col){
  OscMessage Msg = new OscMessage("/"+ m.prefix + "/bank0select" + col);
  m.setRow(5,0);
  m.setLed(col,5,1); 
  mocoge.send(Msg, cogeIn);
  
}

void bank1select(int col,int state){
    if (col == 15 & state == 1) {
      OscMessage Msg1 = new OscMessage("/"+ m.prefix + "/threedee");
      mocoge.send(Msg1, cogeIn);
      OscMessage Msg4 = new OscMessage("/"+ m.prefix + "/bank1select" + col);
      mocoge.send(Msg4, cogeIn);
      if (m.rowStates[2].get(15) == true) {
         seq1toggle();
      }
      m.setRow(6,0);
      m.setLed(col,6,1); 
    } else if (col == 15 & state == 0) {
  
    } else {
      if (m.rowStates[6].get(15) == true){
      OscMessage Msg3 = new OscMessage("/"+ m.prefix + "/twoodee");
      Msg3.add(1.0);
      mocoge.send(Msg3, cogeIn);
      }
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/bank1select" + col);
      m.setRow(6,0);
      m.setLed(col,6,1); 
      mocoge.send(Msg, cogeIn); 
      m.setLed(14,7,0);   
    }
}

void threeDtoggle(){
  if (m.rowStates[6].get(15) == true) {
    if (m.rowStates[7].get(14) == false) { 
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/threeDtoggle");
      Msg.add(1.0);
      mocoge.send(Msg, cogeIn);
      m.setLed(14,7,1);
    } else {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/threedee");
      //Msg.add(0.0);
      mocoge.send(Msg, cogeIn);
      m.setLed(14,7,0);
    }
  }
}
  
void setSeqs() {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq1pos");
      Msg.add(0.5);
      mocoge.send(Msg, cogeIn);
}
