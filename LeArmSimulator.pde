// sizes of each arm piece
float[] size_seg6_5 = {10, 10, 10};
float[] size_seg5_4 = {2, 5, 10};
float[] size_seg4_3 = {2, 5, 9};
float[] size_seg3_2 = {2, 5, 5};
float[] size_seg2_1 = {3, 5, 3};

//initial position values for each arm piece
float[] pos_seg6_5 = {320, 200, 250};
float[] pos_seg5_4 = {320, pos_seg6_5[1] - size_seg5_4[2] - .5, 250};
float[] pos_seg4_3 = {320, pos_seg5_4[1] - size_seg4_3[2] - .5, 250};
float[] pos_seg3_2 = {320, pos_seg4_3[1] - size_seg3_2[2] - 2, 250};
float[] pos_seg2_1 = {320, pos_seg3_2[1] - size_seg2_1[2] - 1, 250};


public class ArmPiece{
  float x = 0;
  float y = 0;
  float z = 0;
  float[] size = {10, 10, 10};
  float[] rotation = {0, 0, 0};
  float[] rotation_range = {500, 2500};
  
  public ArmPiece(float x, float y, float z, float[] size, float[] rotation){
    this.x = x;
    this.y = y;
    this.z = z;
    this.size = size;
    this.rotation = rotation;
  }
  
  public void drawPiece(){
    pushMatrix();
    translate(this.x, this.y, this.z);
    rotateX(rotation[0]);
    rotateY(rotation[1]);
    rotateZ(rotation[2]);
    fill(100);
    box(this.size[1], this.size[2], this.size[0]);
    popMatrix();
  }
}


public class Arm{
  float[] start_rotation = {0, PI/4, 0};
  // create pieces of arm
  ArmPiece base = new ArmPiece(pos_seg6_5[0], pos_seg6_5[1], pos_seg6_5[2], size_seg6_5, start_rotation);
  ArmPiece s5_4 = new ArmPiece(pos_seg5_4[0], pos_seg5_4[1], pos_seg5_4[2], size_seg5_4, start_rotation);
  ArmPiece s4_3 = new ArmPiece(pos_seg4_3[0], pos_seg4_3[1], pos_seg4_3[2], size_seg4_3, start_rotation);
  ArmPiece s3_2 = new ArmPiece(pos_seg3_2[0], pos_seg3_2[1], pos_seg3_2[2], size_seg3_2, start_rotation);
  ArmPiece s2_1 = new ArmPiece(pos_seg2_1[0], pos_seg2_1[1], pos_seg2_1[2], size_seg2_1, start_rotation);
  
  ArmPiece[] pieces = {base, s5_4, s4_3, s3_2, s2_1};
  
  public void drawArm(){
    for (ArmPiece piece : pieces){
      piece.drawPiece();
    }
    
  }
  
}



float x,y,z;
Arm myArm = new Arm();

void setup() {
  size(640,360,P3D);
}

void draw() {
  myArm.drawArm();
  pushMatrix();
  rotateX(PI/2);
  popMatrix();
}
