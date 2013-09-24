import ddf.minim.*;
import codeanticode.syphon.*;

SyphonServer server;
Minim minim;
AudioInput in;

PGraphics canvas;
int w = 1024, h = 768;
int thickWidth = 30;

float LEFTlevel, RIGHTlevel;
float rectW;
color rosa = (#FF3BAE), blu = (#3B9EFF), rosso = color(206, 43, 55), verde = color(0, 146, 70);

boolean computeLEFT = false, computeRIGHT = false;
float maxMappedLevelValue = 1;
boolean syphonSend = false;
PFont font;
boolean canSave = false;

void setup()
{
  size(512, 512, P2D);
  canvas = createGraphics(w, h, JAVA2D);
  canvas.beginDraw();
  canvas.textSize(45);
 // font = createFont("GothamHTF-Bold", 150);
  font = createFont("Arial-Bold", 150);
  canvas.textFont(font);
  canvas.textAlign(CENTER);
  
  canvas.endDraw();

  rectW = canvas.width/2.2;
  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  server = new SyphonServer(this, "Applausometro");
  setupCp5();
  // uncomment this line to *hear* what is being monitored, in addition to seeing it
  //in.enableMonitoring();
}

void draw()
{
  background(82, 118, 60);
  canvas.beginDraw();
  canvas.background(0);
  drawThresholdLEFT();
  drawThresholdRIGHT();
  drawThicks(thickWidth);
  drawWhiteRect();
  drawNumbers();
  canvas.endDraw();
  if (syphonSend) {
    server.sendImage(canvas);
  }
  image(canvas, 0, 0, canvas.width/2, canvas.height/2);
}

