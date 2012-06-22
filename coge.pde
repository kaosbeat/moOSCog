void setSeq(int pos, int seq, int state) {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq" + seq + "pos" + pos );
      Msg.add(float(state));
      mocoge.send(Msg, cogeIn);
}


void tapBPM(int state) {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/tapBPM");
      Msg.add(float(state));
      mocoge.send(Msg, cogeIn);
}
  
void masterLayer(int layer){
  println("blah");
     OscMessage Msg = new OscMessage("/"+ m.prefix + "/masterLayer");
     Msg.add(float(layer));
   //  m.rowStates[row].set(col,true);
}
void setSeqs() {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq1pos");
      Msg.add(0.5);
      mocoge.send(Msg, cogeIn);
}
