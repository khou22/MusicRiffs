import controlP5.*;
ControlP5 cp5;

int offset = 10;
int lineSpacing = 25;
int buttonSizeX = 150;
int buttonSizeY = 75;

void setupWindow()
{
  size(displayWidth-250, displayHeight-250);
  background(backgroundColor);
  cp5 = new ControlP5(this);
  addInstrumentButtons();
}

void userInterface()
{
//  refresh();
  sheetMusic();
  displayMelodyInfo();
  chooseScaleAndChord();
}

void refresh()
{
  background(backgroundColor);
}

void displayMelodyInfo()
{
  textFont(defaultFont);
  fill(255); //For rectangle
  rect(offset, offset, (4 * width)/10, height/4);
  fill(0); //Black font color
  text("Riff ID: " + (riff + 1), offset + 5, offset + 20);
  text("Melody: " + melody, offset + 5, offset + 20 + lineSpacing);
  text("Rythem: " + rythem, offset + 5, offset + 20 + (2 * lineSpacing));
  text("Chord: " + currentChord, offset + 5, offset + 20 + (3 * lineSpacing));
  text("Scale: " + currentScale, offset + 5, offset + 20 + (4 * lineSpacing));
}

void addInstrumentButtons()
{
  cp5.addButton("melodyButton")
    .setValue(0)
    .setLabel("Melody")
    .setPosition((4 * width)/10 + (2 * offset), 10)
    .setSize(buttonSizeX, buttonSizeY)
    ;
    
  cp5.addButton("chordsButton")
    .setValue(0)
    .setLabel("Chords")
    .setPosition((4 * width)/10 + (3 * offset) + buttonSizeX, 10)
    .setSize(buttonSizeX, buttonSizeY)
    ;
    
  cp5.addButton("bassButton")
    .setValue(0)
    .setLabel("Bass")
    .setPosition((2 * offset), 10 + ((height/4) + (3 * offset)))
    .setSize(buttonSizeX, buttonSizeY)
    ;
    
  cp5.addButton("trumpetButton")
    .setValue(0)
    .setLabel("Trumpet")
    .setPosition((3 * offset) + buttonSizeX, 10 + ((height/4) + (3 * offset)))
    .setSize(buttonSizeX, buttonSizeY)
    ;
  
  cp5.addButton("pianoNotesButton")
    .setValue(0)
    .setLabel("Piano Notes")
    .setPosition((4 * offset) + (2 * buttonSizeX), 10 + ((height/4) + (3 * offset)))
    .setSize(buttonSizeX, buttonSizeY)
    ;
    
  cp5.addButton("saxButton")
    .setValue(0)
    .setLabel("Sax")
    .setPosition((5 * offset) + (3 * buttonSizeX), 10 + ((height/4) + (3 * offset)))
    .setSize(buttonSizeX, buttonSizeY)
    ;
    
  cp5.addButton("pianoChordsButton")
    .setValue(0)
    .setLabel("Piano Chords")
    .setPosition((6 * offset) + (4 * buttonSizeX), 10 + ((height/4) + (3 * offset)))
    .setSize(buttonSizeX, buttonSizeY)
    ;
    
  cp5.addButton("drumsButton")
    .setValue(0)
    .setLabel("Drums")
    .setPosition((7 * offset) + (5 * buttonSizeX), 10 + ((height/4) + (3 * offset)))
    .setSize(buttonSizeX, buttonSizeY)
    ;
}

void melodyButton()
{
  if (melodyOn)
  {
    melodyOn = false;
  }
  else
  {
    melodyOn = true;
  }
}

void rythemButton()
{
  if (chordsOn)
  {
    chordsOn = false;
  }
  else
  {
    chordsOn = true;
  }
}

void trumpetButton()
{
  if (trumpetOn)
  {
    trumpetOn = false;
  }
  else
  {
    trumpetOn = true;
  }
}

void bassButton()
{
  if (bassOn)
  {
    bassOn = false;
  }
  else
  {
    bassOn = true;
  }
}

void pianoNotesButton()
{
  if (pianoNotesOn)
  {
    pianoNotesOn = false;
  }
  else
  {
    pianoNotesOn = true;
  }
}

void saxButton()
{
  if (saxOn)
  {
    saxOn = false;
  }
  else
  {
    saxOn = true;
  }
}

void pianoChordsButton()
{
  if (pianoChordsOn)
  {
    pianoChordsOn = false;
  }
  else
  {
    pianoChordsOn = true;
  }
}

void drumsButton()
{
  if (drumsOn)
  {
    drumsOn = false;
  }
  else
  {
    drumsOn = true;
  }
}
