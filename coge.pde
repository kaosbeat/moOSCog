void setseq(int seq, int pos, int state) {
      OscMessage Msg = new OscMessage("/"+ m.prefix + "/seq" + seq + "pos" + pos );
      Msg.add(float(state));
      println(Msg);
      mocoge.send(Msg, cogeIn);
}
