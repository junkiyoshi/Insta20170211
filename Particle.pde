class Particle
{
  PVector location;
  float radius;
  float color_value;
  color body_color;
  
  Particle(float x, float y, float r)
  {
    location = new PVector(x, y);
    radius = r;
    
    PVector distance = PVector.sub(location, new PVector(width / 2, height / 2));
    color_value = map(distance.mag(), 0, sqrt(width * width + height * height), 255, 0);
    body_color = color(color_value, 255, 255);
  }
      void run()
  {
    update();
    display();
  }
  
  void update()
  {
    color_value = (color_value + 1.5) % 255;
    body_color = color(color_value, 255, 255);
  }
  
  void display()
  {
    fill(body_color);
    stroke(128);
    
    pushMatrix();
    translate(location.x, location.y);
        
    beginShape();
    for(int i = 0; i < 360; i += 60)
    {
      float x = radius * cos(radians(i + 90));
      float y = radius * sin(radians(i + 90));
      vertex(x, y);
    }
    endShape(CLOSE);
    
    popMatrix();
  }
}