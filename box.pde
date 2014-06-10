float[]x=new float[8];
float[]y=new float[8];
float[]vx=new float[8];
float[]vy=new float[8];
int[]angle=new int[8];
int minin=3;
int count=0;
void setup() {
  size(400,400);
  angle[0]=0;
  angle[1]=90;
  angle[2]=180;
  angle[3]=270;
  angle[4]=0;
  angle[5]=90;
  angle[6]=180;
  angle[7]=270;
}

void draw(){
  background(random(50)+200,random(50)+200,random(50)+200);
  
  for(int k=0;k<8;k++){
    if(k<4){
      x[k]=80*cos(radians(angle[k]))+200;
      y[k]=20*sin(radians(angle[k]))+100;
    }else{
      x[k]=80*cos(radians(angle[k]))+200;
      y[k]=20*sin(radians(angle[k]))+200;
    }
    
    //text(k,x[k],y[k]-10);
  }
  
  //noFill();
  //strokeWeight(5);
  stroke(100);
  
  float mini=min(y[0],y[1],y[2]);
  mini=min(mini,y[3]);
  
  for(int k=0;k<4;k++){
    if(mini==y[k]){
      minin=k;
    }
  }
  
  quad(x[4],y[4]+count,x[5],y[5]+count,x[6],y[6]+count,x[7],y[7]+count);
    
  switch(minin){
    case 0:
    quad(x[0],y[0],x[1],y[1],x[5],y[5],x[4],y[4]);
    quad(x[3],y[3],x[0],y[0],x[4],y[4],x[7],y[7]);
    quad(x[1],y[1],x[2],y[2],x[6],y[6],x[5],y[5]);
    quad(x[2],y[2],x[3],y[3],x[7],y[7],x[6],y[6]);
    break;
    
    case 1:
    quad(x[1],y[1],x[2],y[2],x[6],y[6],x[5],y[5]);
    quad(x[0],y[0],x[1],y[1],x[5],y[5],x[4],y[4]);
    quad(x[2],y[2],x[3],y[3],x[7],y[7],x[6],y[6]);
    quad(x[3],y[3],x[0],y[0],x[4],y[4],x[7],y[7]);
    break;
    
    case 2:
    quad(x[2],y[2],x[3],y[3],x[7],y[7],x[6],y[6]);
    quad(x[1],y[1],x[2],y[2],x[6],y[6],x[5],y[5]);
    quad(x[3],y[3],x[0],y[0],x[4],y[4],x[7],y[7]);
    quad(x[0],y[0],x[1],y[1],x[5],y[5],x[4],y[4]);
    break;
    
    default:
    quad(x[3],y[3],x[0],y[0],x[4],y[4],x[7],y[7]);
    quad(x[2],y[2],x[3],y[3],x[7],y[7],x[6],y[6]);
    quad(x[0],y[0],x[1],y[1],x[5],y[5],x[4],y[4]);
    quad(x[1],y[1],x[2],y[2],x[6],y[6],x[5],y[5]);
    break;
  }
  
  quad(x[0],y[0]-count,x[1],y[1]-count,x[2],y[2]-count,x[3],y[3]-count);
  
  for(int k=0;k<8;k++){
    angle[k]++;
    if(angle[k]>360){
      angle[k]-=360;
    }
  }
  count++;
}

void keyPressed(){
  stop();
}
