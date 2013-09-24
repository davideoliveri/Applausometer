import controlP5.*;

ControlP5 cp5;
PFont UIFont;


void setupCp5() {
  cp5 = new ControlP5(this);
  cp5.setColorLabel(color(0));

  cp5.addSlider("GainControl")
    .setPosition((width/2)-125, (canvas.height/2)+87)
      .setRange(0.2, 3)
        .setSize(250, 18)
          .setValue(1)
            .setLabel("Attenuation");

  cp5.addToggle("toggleSyphon")
    .setPosition((width/2)-32.5, (canvas.height/2)+30)
      .setSize(65, 25)
        .setValue(false)
          .setLabel("Toggle Syphon")
            .update();


  cp5.addBang("resetLEFT")
    .setPosition((width*.25)+15, (canvas.height/2)+10)
      .setSize(45, 25)
        .update();

  cp5.addToggle("activateLEFT")
    .setValue(true)
      .setPosition((width*.25)-60, (canvas.height/2)+10)
        .setSize(45, 25)
          .update();

  cp5.addBang("resetRIGHT")
    .setPosition((width*.75)+15, (canvas.height/2)+10)
      .setSize(45, 25)
        .update();

  cp5.addToggle("activateRIGHT")
    .setValue(false)
      .setPosition((width*.75)-60, (canvas.height/2)+10)
        .setSize(45, 25)
          .update();

}

void GainControl(float f) {
  maxMappedLevelValue = f;
  println(f);
}

void toggleSyphon(boolean theFlag) {
  syphonSend = theFlag;
}
void activateLEFT(boolean theFlag) {
  computeLEFT = theFlag;
}

void activateRIGHT(boolean theFlag) {
  computeRIGHT = theFlag;
}

void resetLEFT() {
  mappedLEFTLevel = 0;
  oldLEFTlevel = 0;
  maxValueLEFT = 0;
  theLeftValue =  "0";
}

void resetRIGHT() {
  mappedRIGHTLevel = 0;
  oldRIGHTlevel = 0;
  maxValueRIGHT = 0;
  theRightValue = "0";
}

