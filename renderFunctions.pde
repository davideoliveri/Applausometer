//////////////////////////// DRAW THICK MARKS//////////////
void drawThicks(int thickW) {
  canvas.stroke(255);
  canvas.strokeWeight(2);
  for (int y=0; y<canvas.height; y+=20) {
    canvas.line(0, y, thickW, y);
    canvas.line(canvas.width, y, canvas.width-thickW, y);
  }
}


float oldLEFTlevel = 0;
float mappedLEFTLevel = 0;
float maxValueLEFT = 0;

////////////////////////////////// DRAW RECT & THRESHOLD    LEFT    //////////////////
void drawThresholdLEFT() {
  if (computeLEFT) {
    LEFTlevel = abs(in.mix.level());
    // println("LEFTlevel = "+LEFTlevel); 

    mappedLEFTLevel = map(LEFTlevel, 0.1, maxMappedLevelValue, 0, canvas.height);
    mappedLEFTLevel = constrain(mappedLEFTLevel, 0, canvas.height);
    // println("mappedLEFTLevel = "+ mappedLEFTLevel);
    canvas.fill(verde);
    canvas.noStroke();
    canvas.rect(0, canvas.height-mappedLEFTLevel, canvas.width/2, canvas.height);

    if (oldLEFTlevel < mappedLEFTLevel && mappedLEFTLevel > 1) {
      maxValueLEFT = mappedLEFTLevel;
      oldLEFTlevel = mappedLEFTLevel;
      theLeftValue = nf(round(mappedLEFTLevel), 3);
      // println("oldLEFTlevel = " +oldLEFTlevel);
    }
    else {
    //  maxValueLEFT = maxValueLEFT;
    }
  }
  // println("maxValueLEFT = "+maxValueLEFT);
  // println("\n");
  // float maxValueLEFT = min(oldLEFTlevel, mappedLEFTLevel);
  canvas.stroke(verde);
  canvas.strokeWeight(6);
  canvas.line(0, canvas.height-maxValueLEFT, (canvas.width/2)-6, canvas.height-maxValueLEFT);
}


float oldRIGHTlevel = 0;
float mappedRIGHTLevel = 0;
float maxValueRIGHT = 0;
////////////////////////////////// DRAW RECT & THRESHOLD    RIGHT    //////////////////
void drawThresholdRIGHT() {
  if (computeRIGHT) {
    RIGHTlevel = abs(in.mix.level());
    // println("RIGHTlevel = "+RIGHTlevel);

    mappedRIGHTLevel = map(RIGHTlevel, 0.1, maxMappedLevelValue, 0, canvas.height);
    mappedRIGHTLevel = constrain(mappedRIGHTLevel, 0, canvas.height);
    // println("mappedRIGHTLevel = "+ mappedRIGHTLevel);
    canvas.fill(rosso);
    canvas.noStroke();
    canvas.rect((canvas.width/2), canvas.height-mappedRIGHTLevel, (canvas.width/2), canvas.height);

    if (oldRIGHTlevel < mappedRIGHTLevel && mappedRIGHTLevel > 1) {
      maxValueRIGHT = mappedRIGHTLevel;
      oldRIGHTlevel = mappedRIGHTLevel;
      theRightValue = nf(round(mappedRIGHTLevel), 3);
      // println("oldRIGHTlevel = " +oldRIGHTlevel);
    }
    else {
     // maxValueRIGHT = maxValueRIGHT;
    }
  }
  // println("maxValueRIGHT = "+maxValueRIGHT);
  // println("\n");
  // float maxValueRIGHT = min(oldRIGHTlevel, mappedRIGHTLevel);
  canvas.stroke(rosso);
  canvas.strokeWeight(6);
  canvas.line((canvas.width/2)+6, canvas.height-maxValueRIGHT, canvas.width, canvas.height-maxValueRIGHT);
}


void drawWhiteRect() {
  canvas.fill(255);
  canvas.rect((canvas.width/2)-16, 0, 32, canvas.height);
}

//////////////////////////// DRAW WAVEFORMS//////////////
void drawWaveForms() {

  // draw the waveforms so we can see what we are monitoring
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    canvas.line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
    canvas.line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
  }
}

//////////////////////////// DRAW NUMBERS //////////////
String theRightValue = "";
String theLeftValue = "";

void drawNumbers() {
  canvas.fill(255);  
  canvas.text(theRightValue, canvas.width*.75, canvas.height-40);
  canvas.text(theLeftValue, canvas.width*.25, canvas.height-40);
}

