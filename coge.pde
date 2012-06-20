void setseq(int seq, int pos, int state) {
      OscMessage Msg = new OscMessage("/"+ this.prefix + "/seq" + seq + "pos" + pos );
      Msg.add(float(state));
      mocoge.send(Msg, cogeIn);
}
