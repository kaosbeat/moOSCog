void setSeq(int pos, int seq, int state) {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq" + seq + "pos" + pos );
      Msg.add(float(state));
      mocoge.send(Msg, cogeIn);
}
