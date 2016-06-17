public class Camera
{
  Head head = new Head();
  
  Vector pos   = new Vector(0,0,100);
  float pitch = 0;
  float yaw = 0;

  public void update()
  {//println("ROTATION: " +  rotX + "  " + rotY);
    
    yaw    %= 2*PI;
    pitch  %= 2*PI;
    //camera(0,0,0,    0,1,0,    0,0,1);
    //camera();
    //ortho();
    float x = head.x;
    float y = -head.y;
    float z = 500+head.z; // head.z
    float distOrigin = 0; // pp // distance from origin to screen along z
    float d = (z - distOrigin );
    resetMatrix(); // make matrix identity matrix
    applyMatrix(
        1.0,  0.0,  0.0,  0.0,
        0.0,  -1.0,  0.0,  0.0,
                    - x/d ,               -y/d,     1.0,  -1/d,
        (x * distOrigin)/d, (y * distOrigin)/d,     0.0,   z/d);
    printMatrix();
    

    translate(
      -pos.value[0],
      -pos.value[1],//  + head.x,
      -pos.value[2] // + head.y
     );

     
  }
}