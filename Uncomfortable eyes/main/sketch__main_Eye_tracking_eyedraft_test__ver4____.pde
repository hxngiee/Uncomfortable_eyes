import netP5.*;
import oscP5.*;

OscP5 meosc;

int x=0;
int y=0;
boolean drwgate = false;
int initnumlines=2;
int numlines;
int initnumarcs=2;
int numarcs;
int initnumcrvs=2;
int numcrvs;
Eye[] e = new Eye [44];

void setup() 
{
  //size(1920, 1080);
  fullScreen(P2D);
  smooth();

  noStroke();

  e[0] = new Eye( 0, 0, 10, 30);

  e[1] = new Eye( 200, 200, 120, 30);  

  e[2] = new Eye(170, 440, 120, 30);

  e[3] = new Eye(400, 144, 120, 30);  //5번 왼쪽

  e[4] = new Eye(300, 300, 120, 30);  //4번 오른쪽

  e[5] = new Eye(550, 600, 120, 30);  //2번왼쪽

  e[6] = new Eye(700, 850, 120, 30);  

  e[7] = new Eye(650, 730, 120, 30);

  e[8] = new Eye(1000, 900, 120, 30);

  e[9] = new Eye(1200, 350, 120, 30);

  e[10] = new Eye(1500, 250, 120, 30);

  e[11] = new Eye(570, 460, 120, 30);

  e[12] = new Eye(200, 650, 120, 30);

  e[13] = new Eye(140, 820, 120, 30);

  e[14] = new Eye(350, 540, 120, 30);

  e[15] = new Eye(420, 410, 120, 30);

  e[16] = new Eye(420, 700, 120, 30);

  e[17] = new Eye(340, 810, 120, 30);

  e[18] = new Eye(520, 860, 120, 30);

  e[19] = new Eye(560, 267, 120, 30);

  e[20] = new Eye(650, 137, 120, 30);

  e[21] = new Eye(880, 127, 100, 30);

  e[22] = new Eye(1050, 137, 120, 30);

  e[23] = new Eye(1250, 177, 120, 30);

  e[24] = new Eye(1450, 117, 120, 30);

  e[25] = new Eye(1370, 327, 120, 30);

  e[26] = new Eye(940, 257, 120, 30);
  e[27] = new Eye(780, 240, 120, 30);
  e[28] = new Eye(710, 370, 120, 30);
  e[29] = new Eye(690, 570, 120, 30);
  e[30] = new Eye(830, 460, 120, 30);

  e[31] = new Eye(850, 750, 120, 30);
  e[32] = new Eye(830, 930, 120, 30);

  e[33] = new Eye(960, 600, 120, 30);
  e[34] = new Eye(1030, 400, 120, 30);
  e[35] = new Eye(1120, 510, 120, 30);
  e[36] = new Eye(1110, 680, 120, 30);
  e[37] = new Eye(1250, 600, 120, 30);
  e[38] = new Eye(1290, 470, 120, 30); 

  e[39] = new Eye(1460, 450, 120, 30);
  e[40] = new Eye(1430, 580, 120, 30);

  e[41] = new Eye(1370, 720, 120, 30);

  e[42] = new Eye(1460, 850, 120, 30);
  e[43] = new Eye(1190, 840, 120, 30);   
  stroke(255);
  numlines=initnumlines;
  numarcs = initnumarcs;
  numcrvs = initnumcrvs;
  meosc = new OscP5(this, 12000);
  meosc.plug(this, "drwps", "/drwps");
  meosc.plug(this, "relps", "/relps");
}

void draw() 
{  

  fill(255, 30);

  rect(0, 0, width, height);

  fill(255);
  if (!drwgate) {  
    fill(255);
    rect(0, 0, width, height);
  } else {
    e[0].ex=x;
    e[0].ey=y;

    for (int l = 0; l < 44; l++)  //이거 업데이트 갯수 꼭 맞춰줘야됨 눈탱이만큼
    {
      e[l].update(x, y);
    }

    if (e[1].overlaps(e[0])) {
      e[1].display2();
    }
    if (e[2].overlaps(e[0])) {
      e[2].display4();
    }
    if (e[3].overlaps(e[0])) {
      e[3].display4();
    }
    if (e[4].overlaps(e[0])) {
      e[4].display5();
    }
    if (e[5].overlaps(e[0])) {
      e[5].display2();
    }
    if (e[6].overlaps(e[0])) {
      e[6].display2();
    }
    if (e[7].overlaps(e[0])) {
      e[7].display4();
    }
    if (e[8].overlaps(e[0])) {
      e[8].display5();
    }
    if (e[9].overlaps(e[0])) {
      e[9].display2();
    }
    if (e[10].overlaps(e[0])) {
      e[10].display4();
    }
    if (e[11].overlaps(e[0])) {
      e[11].display4();  //display4는 5왼 //display 2는 2왼  //display 5는 4번의 오른쪽
    }
    if (e[12].overlaps(e[0])) {
      e[12].display2();  //display 3 : 5번의 오른쪽, display6 : 2번 오른쪽 display 7 : 4번의 왼쪽
    }
    if (e[13].overlaps(e[0])) {
      e[13].display3();
    }
    if (e[14].overlaps(e[0])) {
      e[14].display3();
    }
    if (e[15].overlaps(e[0])) {
      e[15].display6();
    }
    if (e[16].overlaps(e[0])) {
      e[16].display6();
    }
    if (e[17].overlaps(e[0])) {
      e[17].display7();
    }
    if (e[18].overlaps(e[0])) {
      e[18].display6();
    }
    if (e[19].overlaps(e[0])) {
      e[19].display7();
    }
    if (e[20].overlaps(e[0])) {
      e[20].display3();
    }
    if (e[21].overlaps(e[0])) {
      e[21].display4();
    }
    if (e[22].overlaps(e[0])) {
      e[22].display3();
    }
    if (e[23].overlaps(e[0])) {
      e[23].display6();
    }
    if (e[24].overlaps(e[0])) {
      e[24].display3();
    }
    if (e[25].overlaps(e[0])) {
      e[25].display7();
    }  
    if (e[26].overlaps(e[0])) {
      e[26].display7();
    }  

    if (e[27].overlaps(e[0])) {
      e[27].display2();
    }   
    if (e[28].overlaps(e[0])) {
      e[28].display5();
    }  
    if (e[29].overlaps(e[0])) {
      e[29].display6();
    }    
    if (e[30].overlaps(e[0])) {
      e[30].display2();
    }   
    if (e[31].overlaps(e[0])) {
      e[31].display3();
    }   
    if (e[32].overlaps(e[0])) {
      e[32].display7();
    }    
    if (e[33].overlaps(e[0])) {
      e[33].display7();
    }   
    if (e[34].overlaps(e[0])) {
      e[34].display6();
    }  
    if (e[35].overlaps(e[0])) {
      e[35].display4();
    }  
    if (e[36].overlaps(e[0])) {
      e[36].display5();
    }   
    if (e[37].overlaps(e[0])) {
      e[37].display3();
    }   
    if (e[38].overlaps(e[0])) {
      e[38].display5();
    }   
    if (e[39].overlaps(e[0])) {
      e[39].display6();
    }  
    if (e[40].overlaps(e[0])) {
      e[40].display7();
    }    
    if (e[40].overlaps(e[0])) {
      e[40].display7();
    }  
    if (e[41].overlaps(e[0])) {
      e[41].display2();
    }  
    if (e[42].overlaps(e[0])) {
      e[42].display4();
    }   
    if (e[43].overlaps(e[0])) {
      e[43].display6();
    }
  }
}
void drwps(int mx, int my) {
  drwgate=true;
  x=mx;
  y=my;
}

void relps() {
  drwgate=false;
  numlines=initnumlines;
  numarcs=initnumarcs;
  numcrvs=initnumcrvs;
}
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("12312313123123");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}