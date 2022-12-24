class Eye 
{
  int ex, ey, q;
  int size;
  color col;
  float angle = 0.0;
  float secondsRadius;
  float minutesRadius;
  float hoursRadius;
  float clockDiameter;
  int cx, cy;
  PImage [][] eye = new PImage [7][12]; 

  Eye(int x, int y, int s, int r) {

    ex = x;

    ey = y;

    size = s;

    col=color(0);

    secondsRadius = r * 0.71;
    minutesRadius = r * 0.60;
    hoursRadius = r * 0.50;
    clockDiameter = s/2.5;
    cx = s/10;
    cy = 0;

    q = 5;

    for (int k = 1; k < 7; k++)
    {
      eye[0][k] = loadImage("eye4_" + k + ".png");
    }

    for (int k = 7; k < 12; k++)
    {
      eye[0][k] = loadImage("eye4_" + q + ".png");
      q--;
    }

    q = 5;

    for (int k = 1; k < 7; k++)
    {
      eye[1][k] = loadImage("eye2_" + k + ".png");
    }

    for (int k = 7; k < 12; k++)
    {
      eye[1][k] = loadImage("eye2_" + q + ".png");
      q--;
    }

    q = 5;

    for (int k = 1; k < 7; k++)
    {
      eye[2][k] = loadImage("eye5_" + k + ".png");
    }

    for (int k = 7; k < 12; k++)
    {
      eye[2][k] = loadImage("eye5_" + q + ".png");
      q--;
    }

    q = 4;

    for (int k = 1; k < 6; k++)
    {
      eye[3][k] = loadImage("eye6_" + k + ".png");
    }

    for (int k = 6; k < 10; k++)
    {
      eye[3][k] = loadImage("eye6_" + q + ".png");
      q--;
    }
    
     q = 5;

    for (int k = 1; k < 7; k++)
    {
      eye[4][k] = loadImage("eye8_" + k + ".png");
    }

    for (int k = 7; k < 12; k++)
    {
      eye[4][k] = loadImage("eye8_" + q + ".png");
      q--;
    }
    
    q = 5;

    for (int k = 1; k < 7; k++)
    {
      eye[5][k] = loadImage("eye9_" + k + ".png");
    }

    for (int k = 7; k < 12; k++)
    {
      eye[5][k] = loadImage("eye9_" + q + ".png");
      q--;
    }
    
    q = 4;

    for (int k = 1; k < 6; k++)
    {
      eye[6][k] = loadImage("eye7_" + k + ".png");
    }

    for (int k = 6; k < 10; k++)
    {
      eye[6][k] = loadImage("eye7_" + q + ".png");
      q--;
    }
  }

  void clock_ex()
  {

    // Draw the clock background
    noStroke();
    fill(55);
    ellipse(cx, cy, clockDiameter, clockDiameter);
    // Angles for sin() and cos() start at 3 o'clock;
    // subtract HALF_PI to make them start at the top
    float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
    float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
    float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
    // Draw the hands of the clock
    stroke(255);
    strokeWeight(1);
    line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
    strokeWeight(2);
    line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
    strokeWeight(4);
    line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
    strokeWeight(2);
    beginShape(POINTS);
    for (int a = 0; a < 360; a+=6) {
      float angle = radians(a);
      float x = cx + cos(angle) * secondsRadius;
      float y = cy + sin(angle) * secondsRadius;
      vertex(x, y);
    }
    endShape();
  }

  void update(int mx, int my) 
  {
    angle = atan2(my-ey, mx-ex);
  }

  void display1() {

    pushMatrix();

    translate(ex, ey);
    rotate(angle);

    clock_ex();
    //ellipse(size/10, 0, size/2, size/2);
    popMatrix();
  }

//10sec
  void display2() {
    pushMatrix();

    scale(1.2, 1.0);

    if (frameCount % 130 >= 3 && frameCount % 130 <= 13)
    {
      display1();
      image(eye[0][1], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 13 && frameCount % 130 <= 23)
    {
      display1();
      image(eye[0][2], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 130 >= 23 && frameCount % 130 <= 33)
    {
      display1();
      image(eye[0][3], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 33 && frameCount % 130 <= 43)
    {
      display1();
      image(eye[0][4], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 130 >= 43 && frameCount % 130 <= 53)
    {
      display1();
      image(eye[0][5], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 53 && frameCount % 130 <= 63)
    {
      display1();
      image(eye[0][6], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 63 && frameCount % 130 <= 73)
    {
      display1();
      image(eye[0][7], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 73 && frameCount % 130 <= 83)
    {
      display1();
      image(eye[0][8], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 130 >= 83 && frameCount % 130 <= 93)
    {
      display1();
      image(eye[0][9], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 93 && frameCount % 130 <= 103)
    {
      display1();
      image(eye[0][10], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 103)
    {
      display1();
      image(eye[0][11], ex-size/2, ey-size/2, size, size);
    }
    popMatrix();
  }

//13sec
 void display3() {
    pushMatrix();

    scale(1.2, 1.0);

    if (frameCount % 158 >= 3 && frameCount % 158 <= 16)
    {
      display1();
      image(eye[4][1], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 158 >= 16 && frameCount % 158 <= 29)
    {
      display1();
      image(eye[4][2], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 158 >= 29 && frameCount % 158 <= 42)
    {
      display1();
      image(eye[4][3], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 158 >= 42 && frameCount % 158 <= 57)
    {
      display1();
      image(eye[4][4], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 158 >= 57 && frameCount % 158 <= 70)
    {
      display1();
      image(eye[4][5], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 158 >= 70 && frameCount % 158 <= 83)
    {
      display1();
      image(eye[4][6], ex-size/2, ey-size/2, size, size);
    }
        if (frameCount % 158 >= 83 && frameCount % 158 <= 96)
    {
      display1();
      image(eye[4][7], ex-size/2, ey-size/2, size, size);
    }
        if (frameCount % 158 >= 96 && frameCount % 158 <= 109)
    {
      display1();
      image(eye[4][8], ex-size/2, ey-size/2, size, size);
    }
        if (frameCount % 158 >= 109 && frameCount % 158 <= 122)
    {
      display1();
      image(eye[4][9], ex-size/2, ey-size/2, size, size);
    }
        if (frameCount % 158 >= 122 && frameCount % 158 <= 135)
    {
      display1();
      image(eye[4][10], ex-size/2, ey-size/2, size, size);
    }
        if (frameCount % 158 >= 135)
    {
      display1();
      image(eye[4][11], ex-size/2, ey-size/2, size, size);
    }
    popMatrix();
  }

//9sec
  void display4() {
    pushMatrix();

    scale(1.2, 1.0);
    if (frameCount % 120 >= 2 && frameCount % 120 <= 11)
    {
      display1();
      image(eye[2][1], ex-size/2, ey-size/2, size, size);
      //image(eye[1][1],ex-size/2,ey-size/2,size,size);
    }
    if (frameCount % 120 >=11 && frameCount % 120 <= 20)
    {
      display1();
      image(eye[2][2], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 120 >= 20 && frameCount % 120 <= 29)
    {
      display1();
      image(eye[2][3], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 120 >= 29 && frameCount % 120 <= 38)
    {
      display1();
      image(eye[2][4], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 120 >= 38 && frameCount % 120 <= 47)
    {
      display1();
      image(eye[2][5], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 120 >= 47 && frameCount % 120 <= 56)
    {
      display1();
      image(eye[2][6], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 120 >= 56 && frameCount % 120 <= 64)
    {
      display1();
      image(eye[2][7], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 120 >= 64 && frameCount % 120 <= 73)
    {
      display1();
      image(eye[2][8], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 120 >= 73 && frameCount % 120 <= 82)
    {
      display1();
      image(eye[2][9], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 120 >= 82 && frameCount % 120 <= 91)
    {
      display1();
      image(eye[2][10], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 120 >= 91)
    {
      display1();
      image(eye[2][11], ex-size/2, ey-size/2, size, size);
    }
    popMatrix();
  }

//15sec
  void display5() {
    pushMatrix();

    scale(1.2, 1.0);
    if (frameCount % 150 >= 2 && frameCount % 150 <= 17)
    {
      display1();
      image(eye[3][1], ex-size/2, ey-size/2, size, size);
      //image(eye[1][1],ex-size/2,ey-size/2,size,size);
    }
    if (frameCount % 150 >= 17 && frameCount % 150 <= 32)
    {
      display1();
      image(eye[3][2], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 150 >= 32 && frameCount % 150 <= 47)
    {
      display1();
      image(eye[3][3], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 150 >= 47 && frameCount % 150 <= 62)
    {
      display1();
      image(eye[3][4], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 150 >= 62 && frameCount % 150 <= 77)
    {
      display1();
      image(eye[3][5], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 150 >= 77 && frameCount % 150 <= 92)
    {
      display1();
      image(eye[3][6], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 150 >= 92 && frameCount % 150 <= 107)
    {
      display1();
      image(eye[3][7], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 150 >= 107 && frameCount % 150 <= 122)
    {
      display1();
      image(eye[3][8], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 150 >= 122)
    {
      display1();
      image(eye[3][9], ex-size/2, ey-size/2, size, size);
    }
    popMatrix();
  }
  
  //12sec
  void display6() {
    pushMatrix();

    scale(1.2, 1.0);

    if (frameCount % 145 >= 3 && frameCount % 145 <= 15)
    {
      display1();
      image(eye[5][1], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 145 >= 15 && frameCount % 145 <= 27)
    {
      display1();
      image(eye[5][2], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 145 >= 27 && frameCount % 145 <= 39)
    {
      display1();
      image(eye[5][3], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 145 >= 39 && frameCount % 145 <= 51)
    {
      display1();
      image(eye[5][4], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 145 >= 51 && frameCount % 145 <= 63)
    {
      display1();
      image(eye[5][5], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 145 >= 63 && frameCount % 145 <= 75)
    {
      display1();
      image(eye[5][6], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 145 >= 75 && frameCount % 145 <= 87)
    {
      display1();
      image(eye[5][7], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 145 >= 87 && frameCount % 145 <= 99)
    {
      display1();
      image(eye[5][8], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 145 >= 99 && frameCount % 145 <= 111)
    {
      display1();
      image(eye[5][9], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 145 >= 111 && frameCount % 145 <= 123)
    {
      display1();
      image(eye[5][10], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 145 >= 123)
    {
      display1();
      image(eye[5][11], ex-size/2, ey-size/2, size, size);
    }
    popMatrix();
  }

//10sec
 void display7() {
    pushMatrix();

    scale(1.2, 1.0);

    if (frameCount % 130 >= 3 && frameCount % 130 <= 13)
    {
      display1();
      image(eye[6][1], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 13 && frameCount % 130 <= 23)
    {
      display1();
      image(eye[6][2], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 130 >= 23 && frameCount % 130 <= 33)
    {
      display1();
      image(eye[6][3], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 33 && frameCount % 130 <= 43)
    {
      display1();
      image(eye[6][4], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 130 >= 43 && frameCount % 130 <= 53)
    {
      display1();
      image(eye[6][5], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 53 && frameCount % 130 <= 63)
    {
      display1();
      image(eye[6][6], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 63 && frameCount % 130 <= 73)
    {
      display1();
      image(eye[6][7], ex-size/2, ey-size/2, size, size);
    }
    if (frameCount % 130 >= 73 && frameCount % 130 <= 83)
    {
      display1();
      image(eye[6][8], ex-size/2, ey-size/2, size, size);
    }

    if (frameCount % 130 >= 83)
    {
      display1();
      image(eye[6][9], ex-size/2, ey-size/2, size, size);
    }
   
    popMatrix();
  }

  boolean overlaps(Eye other) {
    float d = dist(ex, ey, other.ex, other.ey);  
    if (d<(3*size)+other.size) {
      col=color(0, 180, 190, 100);
      other.col=color(255, 0, 0);
      return true;
    } else
      return false;
  }
}