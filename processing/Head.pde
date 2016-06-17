import java.util.*;
import java.net.*;


public class Head
{
  float x;
  float y;
  float z;
  float [] lastData = {0,0,0, 0,0,0,0};
  Thread updater = new Thread()
  {
    public void run()
    {
      try
      {
        //Runtime rt = Runtime.getRuntime();
        //ltr_pipe = rt.exec("ltr_pipe --output-net-udp --dst-port 3333");
        DatagramSocket ds = new DatagramSocket(4444);
        byte[] buf = new byte[256];
        while(true) { 
          DatagramPacket packet = new DatagramPacket(buf, buf.length);
          ds.receive(packet);
          updateHead(new String(packet.getData(), 0, packet.getLength()));
        }
      }
      catch(Exception e)
      {
        System.out.println(e);
      }
    }
  };
  
  
  float[] updateHead(String arg)
  {
    float [] array = new float[7];
    Scanner s = new Scanner(arg);
    for(int i = 0 ; i < 7 ; i ++)
      array[i] = s.nextFloat();
    s.close();
    this.lastData = array;
    this.x = this.lastData[0];
    this.y = this.lastData[1];
    this.z = this.lastData[2];
    return lastData;
  }

}