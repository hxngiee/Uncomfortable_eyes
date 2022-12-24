import KinectPV2.KJoint;
import KinectPV2.*;
import netP5.*;
import oscP5.*;
int x, y;
KinectPV2 kinect;

OscP5 meosc;
NetAddress psdraw;

void setup() {
  size(1920, 1080, P3D);

  kinect = new KinectPV2(this);

  kinect.enableDepthImg(true);
  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);
  kinect.enableSkeletonDepthMap(true);

  kinect.init();

  meosc = new OscP5(this, 8000);
  psdraw = new NetAddress("127.0.0.1", 12000);
}

void draw() {
  background(0);

  image(kinect.getColorImage(), 0, 0, width, height);

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();
      //println(skeleton.JointType_Head);
      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);

      if (skeleton.isTracked()) {   
        drawBody(joints);
      }
    } 
  }
  if(skeletonArray.size()==0) {
      OscMessage msg2 = new OscMessage("/relps");
      meosc.send(msg2, psdraw);
    }



  fill(255, 0, 0);
  text(frameRate, 50, 50);
}

//DRAW BODY
void drawBody(KJoint[] joints) {
  //drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);
  //drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  drawJoint(joints, KinectPV2.JointType_Head); //array : 3
  //println(KinectPV2.JointType_Head);
}

void drawJoint(KJoint[] joints, int jointType) {
  x = (int)map(joints[jointType].getX(), 0, kinect.getColorImage().width, 0, 1920);
  y = (int)map(joints[jointType].getY(), 0, kinect.getColorImage().height, 0, 1080);
  // check
  int _x = (int)map(joints[jointType].getX(), 0, kinect.getColorImage().width, 0, 512);
  int _y = (int)map(joints[jointType].getY(), 0, kinect.getColorImage().height, 0, 424);

  int [] rawData = kinect.getRawDepthData();
  int loc = _x + _y * 512;
  println(loc);
  /*if ((loc<=80000) ) {    //이걸로 거리조절해야하고 //키넥트 거리 범주 밖으로 튕길때 머리가 없어지면 -값으로 튐 그때는 무시
    OscMessage msg = new OscMessage("/drwps");
    msg.add(1920-x);
    msg.add(y-300);//1080-y
    meosc.send(msg, psdraw);
    //int depthCal = rawData[loc]; 
    //println("depthCal : " + depthCal);
  }*/

   if (loc >= 100000) {    //이걸로 거리조절해야하고 //키넥트 거리 범주 밖으로 튕길때 머리가 없어지면 -값으로 튐 그때는 무시
    OscMessage msg = new OscMessage("/drwps");
    msg.add(1920-x);
    msg.add(1080-y);//1080-y
    meosc.send(msg, psdraw);
    //int depthCal = rawData[loc]; 
    //println("depthCal : " + depthCal);
  }
  
   else {    //이걸로 거리조절해야하고 //키넥트 거리 범주 밖으로 튕길때 머리가 없어지면 -값으로 튐 그때는 무시
    OscMessage msg = new OscMessage("/drwps");
    msg.add(-x);
    msg.add(-y);//1080-y
    meosc.send(msg, psdraw);
    //int depthCal = rawData[loc]; 
    //println("depthCal : " + depthCal);
  }
   
  //*
  //OscMessage msg = new OscMessage("/drwps");
  //msg.add(x);
  //msg.add(y);
  //meosc.send(msg, psdraw);
  //  println(" %d %d", x, y);
  //println("X : " + joints[jointType].getX());

  //println("Z : " + joints[jointType].getZ());


  pushMatrix();
  translate(joints[jointType].getX(), joints[jointType].getY());
  ellipse(0, 0, 25, 25);
  popMatrix();
}
//JointType_Head, JointType_SpineBase, JointType_SpineMid
//joints[JointType_Head].getX(), joints[JointType_Head].getY()