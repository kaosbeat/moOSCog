void setSeq(int pos, int seq, int state) {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq" + seq + "pos" + pos );
      Msg.add(float(state));
      println(Msg);
      mocoge.send(Msg, cogeIn);
}


void tapBPM(int state) {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/tapBPM");
      Msg.add(float(state));
      mocoge.send(Msg, cogeIn);
}
  
void masterLayer(int layer){
  //println("blah" + layer);
  if (m.rowStates[layer].get(0) == false) { 
     //m.rowStates[row].set(col,true);
     OscMessage Msg = new OscMessage("/"+ m.prefix + "/masterLayer" + layer);
     Msg.add(1.0);
     mocoge.send(Msg, cogeIn);
     m.setLed(0,layer,1);
     if (layer == 4) {
       //OscMessage Msg = new OscMessage("/"+ m.prefix + "/masterLayer" + layer);
       //Msg.add(0.0);
       //mocoge.send(Msg, cogeIn);
       m.setLed(0,5,0);
     } else if (layer == 5){
       //OscMessage Msg = new OscMessage("/"+ m.prefix + "/masterLayer" + layer);
       //Msg.add(0.0);
       //mocoge.send(Msg, cogeIn);
       m.setLed(0,4,0);
     }
  }
}
     
void masterEffect(int row, int col, int[] toggle){
     
    if (m.rowStates[row].get(col) == false) { 
      m.setLed(col,row,1);
      for (int i:toggle) {
        println (i);
        m.setLed(col,i,0);
      }
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/masterEffect"+row);
      Msg.add(1.0); 
      mocoge.send(Msg, cogeIn);
      
    } else if (toggle.length == 0) {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/masterEffect"+row); 
      Msg.add(0.0);
      mocoge.send(Msg, cogeIn);
    }  
  }
  
void setSeqs() {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq1pos");
      Msg.add(0.5);
      mocoge.send(Msg, cogeIn);
}
