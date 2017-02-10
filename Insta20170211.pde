ArrayList<Particle> particles;

void setup()
{
  size(512, 512);
  frameRate(30);
  colorMode(HSB);
  blendMode(ADD);

  particles = new ArrayList<Particle>();

  float size = 15;
  boolean flg = false;

  for(int y = height / -5; y < height * 1.2; y += size + (size * sqrt(2) / 2))
  {
    for(int x = width / -5; x < width * 1.2; x += size * sqrt(3))
    {
      if(flg)
      {
        particles.add(new Particle(x, y, size));
      }
      else
      {
        particles.add(new Particle(x + (size * sqrt(3) / 2), y, size));
      }
    }
    flg = !flg;
  }
  
}

void draw()
{
  background(0);
  for(Particle p : particles)
  {
    p.run();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 900)
  {
     exit();
  }
  */
}