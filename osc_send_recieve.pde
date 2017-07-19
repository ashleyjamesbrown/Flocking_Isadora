import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setupOSC() {
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000); //make sure to ammend isadora to send on port 12000
  myRemoteLocation = new NetAddress("127.0.0.1", 1234); //set isadora to listen to this port 1234 which it does buyd efault i think

  //all osc plugs coming from isadora
  oscP5.plug(this, "gmf", "/force");
  oscP5.plug(this, "gms", "/maxspeed");
}



public void gmf(float theA) {
  println("### plug event method. received a message");
  println("value is: "+theA);
}

public void gms(float theA) {
  println("### plug event method. received a message");
  println("value is: "+theA);
}







/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.isPlugged()==false) {
    /* print the address pattern and the typetag of the received OscMessage */
    println("### received an osc message.");
    println("### addrpattern\t"+theOscMessage.addrPattern());
    println("### typetag\t"+theOscMessage.typetag());
  }
}