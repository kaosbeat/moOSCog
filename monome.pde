class Monome {
  
  BitSet[] rowStates; //internal bookkeeping
  int dim_x = 8;
  int dim_y = 16;
  String prefix = "cogeVJ";
  
  Monome(int dim_x, int dimy, String prefix) {
    this.dim_x = dim_x;
    this.dim_y = dim_y;
    this.prefix = prefix;
    this.rowStates = new BitSet[8];
    for(int i=0;i<rowStates.length;i++){
      rowStates[i] = new BitSet(16);
      rowStates[i].set(0,16,false);
    }
    
    
  }
  
  void setCol(int col, int state) {
      OscMessage Msg = new OscMessage("/"+ this.prefix + "/led_col" );
      Msg.add(col);
      if (state == 1) { 
        Msg.add(255);
      } else {
        Msg.add(0);
      }
      cogome.send(Msg, monomeIn);
      for(int i=0;i<rowStates.length;i++){
        rowStates[i].set(col,intToBoolean(state));
      }
      
  }
  
  void setLed(int col, int row, int state){
      OscMessage Msg = new OscMessage("/"+ this.prefix + "/led" );
      Msg.add(col);
      Msg.add(row);
      if (state == 1) { 
        Msg.add(255);
      } else {
        Msg.add(0);
      }
      cogome.send(Msg, monomeIn);
      m.rowStates[row].set(col,intToBoolean(state));
      //println (rowStates[row].get(col));

  } 
  void invertLed(int col, int row){
    OscMessage Msg = new OscMessage("/"+ this.prefix + "/led" );
      Msg.add(col);
      Msg.add(row);
      if (m.rowStates[row].get(col) == false) { 
        Msg.add(255);
        m.rowStates[row].set(col,true);
      } else {
        Msg.add(0);
        m.rowStates[row].set(col,false);
      }
      cogome.send(Msg, monomeIn);
    
  }
      
  void invertCol(int col) {
      for(int i=0;i<rowStates.length;i++){
        rowStates[i].flip(col);
        int state = rowStates[i].get(col)? 1 : 0;
        setLed(col, i, state);
      }
  }
}

