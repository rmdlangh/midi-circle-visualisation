import themidibus.*;


MidiBus bus;
int[] notes;
float[] notes_summary;

void setup(){
  size(800, 800);
  background(0, 0, 0, 100);
  MidiBus.list();
  
  bus = new MidiBus(this, 1, 2);
  
  notes = new int[12];
  notes_summary = new float[12];
}

void draw(){
  
  background(0);     // BLACK
  
  if(frameCount%1==0){
    for(int i=0; i<12; i++){
      if( notes_summary[i] > 0){
        notes_summary[i] -= 0.4;
      }
    }
  }
  
  int sum = 0;
  for(int i=0; i<12; i++){
    sum += notes_summary[i];
  }
  
  for(int i=0; i<12; i++){
    
    float angle = i*2*3.14/12 - 3.14/2;
    int x = int(400 + 200*cos(angle));
    int y = int(400 + 200*sin(angle));
    
    if(notes_summary[i] > 0){
      int intensity =  int(notes_summary[i]);
      fill(intensity,intensity,intensity);
      circle(x, y, 50);
    }
  }
  
  for(int i=0; i<12; i++){
    
    float angle = i*2*3.14/12 - 3.14/2;
    int x = int(400 + 200*cos(angle));
    int y = int(400 + 200*sin(angle));
    
    if(notes[i] > 0){
      fill(150,250,150);
      circle(x, y, 30);
    }
  }
  
  
  
  
  
}

void noteOn(int channel, int pitch, int velocity){
  println("Note On --> channel: "+channel+"; pitch: "+pitch+"; velocity: "+velocity);
  println("Note On --> modulo: "+pitch%12);
  notes[pitch%12] +=1;
  notes_summary[pitch%12] += (255-notes_summary[pitch%12])/2;
  
}

void noteOff(int channel, int pitch, int velocity){
  println("Note Off --> channel: "+channel+"; pitch: "+pitch+"; velocity: "+velocity);
  println("Note Off --> modulo: "+pitch%12);
  notes[pitch%12] -=1;
}
