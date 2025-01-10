import com.jogamp.newt.opengl.GLWindow;


CameraControl cam;
Arm myArm;


void setup() {
  size(640,360,P3D);
  cam = new CameraControl(this);
  myArm = new Arm();
  myArm.action(1, PI/7);
  myArm.action(2, PI/10);
  myArm.action(0, PI/10);
}

void draw() {
  background(0);
  perspective();
  stroke(255);
  for (int x=-500; x<=500; x+=50) {
    line( x, 100, -500, x, 100, 500 );
  }
  for (int z=-500; z<=500; z+=50) {
    line( -500, 100, z, 500, 100, z );
  }
  for (int y=-500; y<=500; y+=50){
    line(-500, y, 0, 500, y, 0);
  }
  noStroke();
  
  stroke(255, 100, 100);
  line(-500, 0, 0, 500, 0, 0);
  noStroke();
  stroke(255, 200, 200);
  myArm.drawArm();
  //camera(60, height/2.5, (height/8), 0, height/2, 0, 0, 1, 0);
  // hud
  pushMatrix();
  ortho();
  resetMatrix();
  translate(-width/2.0, -height/2.0);
  hint(DISABLE_DEPTH_TEST);
  text("[UP],[DOWN] : Tilt up/down", 10, 20);
  text("[LEFT],[RIGHT] : Pan left/right", 10, 35);
  text("[w],[s] : Move forward/backward", 10, 50);
  text("[a],[d] : Move left/right", 10, 65 );
  text("[e],[c] : Move up/down", 10, 80 );
  hint(ENABLE_DEPTH_TEST);
  popMatrix();
}
