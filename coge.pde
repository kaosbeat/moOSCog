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
      println("this button is off");
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
  
  
void chain1Effect(int row, int col, int[] toggle){
  
  
}
  
void setSeqs() {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq1pos");
      Msg.add(0.5);
      mocoge.send(Msg, cogeIn);
}
