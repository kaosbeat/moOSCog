class Monome {

  int dim_x = 8;
  int dim_y = 16;
  String prefix = "cogeVJ";
  
  Monome(int dim_x, int dimy, String prefix) {
    this.dim_x = dim_x;
    this.dim_y = dim_y;
    this.prefix = prefix;
  }
  
  void setCol(int col, int state) {
      OscMessage Msg = new OscMessage("/"+ this.prefix + "/led_col" );
      Msg.add(col);
      if (state == 1) { 
        Msg.add(255);
        println("turning on col" +col);
      } else {
        Msg.add(0);
      }
     // println(stepMsg);
      cogome.send(Msg, monomeIn);
  }
  
  void setLed(int col, int row, int state){
      OscMessage Msg = new OscMessage("/"+ this.prefix + "/led" );
      Msg.add(col);
      Msg.add(row);
      Msg.add(state);
      cogome.send(Msg, monomeIn);
  }
}

