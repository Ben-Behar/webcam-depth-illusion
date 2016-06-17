
public Particle ball()
{
  Particle p1 = new Particle();
  particles.add(p1);
  p1.pos = new Vector(0,100,0);
  p1.vel = new Vector(.05,1,0);
  p1.acc = gravity; // just for gravity
  
  p1.fill = color(155,155,155);
  p1.bounce   = .6;
  p1.friction = .99;
  p1.radius = 10;
  
  return p1;
}




public Spawner spout()
{
   Spawner s = new Spawner();
   s.sVel = new Vector(10,10,10);
   
   
   return s;

}

public Spawner fire()
{
  return new FireSpawner();

}

public Particle firework()
{
    Particle p = new FireWork();
    p.pos = new Vector(random(-10,10),1,random(-10,10));
    p.vel = new Vector(random(-.5,.5),1,random(-.5,.5));
    p.acc = gravity.multiply(.05);
    p.life = 100;
    p.radius = 1;
    return p;

}







void drawCoordSys(float size) // RED = x ; GREEN = y ; BLUE = z 
{
  strokeWeight(1);
  stroke(255, 0, 0);
  line(0,0,0,size,0,0);
  stroke(0, 255, 0);
  line(0,0,0,0,size,0);
  stroke(0, 0, 255);
  line(0,0,0,0,0,size);
}


void drawGrid(float size, int x, int y)
{
  strokeWeight(0);
  stroke(255,255,255);
  fill(255,255,255);
  int count = 0;
  for(float i = -x; i < x ; i += 1)
  for(float j = -y; j < y ; j += 1 )
  {
    if ((i + count++) % 2 == 0) fill(100,100,100);
    else                  fill(200,200,200);
    rect(i*size, j*size, size, size, 0);
  }
}

void drawGround()
{
  strokeWeight(1);
  stroke(255,255,255);
  fill(255,255,255);
  //rect(0, 0, 1000, 1000, 1); 
  rect(-1000, -1000, 1000, 1000, 1);
  stroke(100,100,100);
  fill(100,100,100);
  rect(0, 0, 10, 20, 1);
  //rect(0, -1000, 1000, 1000, 1);

}