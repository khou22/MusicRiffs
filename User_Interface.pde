import controlP5.*;
ControlP5 cp5;

int offset = 10;
int lineSpacing = 25;
int buttonSizeX = 150;
int buttonSizeY = 75;
int booleanSizeX = 175;
int booleanSizeY = 500;
int booleanTopY = offset;
int booleanLeftX = 1000;
int booleanLineSpacing = 30;
int currentInt = 0;
int sliderWidth = 300;

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
  displayBooleans();
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
  rect(offset, offset, (4 * width)/10, height/4 + lineSpacing);
  fill(0); //Black font color
  if (random) //Random melody
  {
    text("Riff ID: Random", offset + 5, offset + 20);
  }
  else //Not random melody
  {
    text("Riff ID: " + (riff + 1), offset + 5, offset + 20);
  }
  text("Melody: " + melody, offset + 5, offset + 20 + lineSpacing);
  text("Rythem: " + rythem, offset + 5, offset + 20 + (2 * lineSpacing));
  text("Chord: " + currentChord, offset + 5, offset + 20 + (3 * lineSpacing));
  text("Scale: " + currentScale, offset + 5, offset + 20 + (4 * lineSpacing));
  String scaleString = "";
  for (int i = 0; i < scaleMap.get(currentScale).length; i++)
  {
    scaleString = scaleString + scaleMap.get(currentScale)[i] + " ";
  }
  text("Scale Notes: " + scaleString, offset + 5, offset + 20 + (5 * lineSpacing));
}

void displayBooleans()
{
  textFont(defaultFont);
  fill(255); //Rectangle
  rect(booleanLeftX, booleanTopY, booleanSizeX, booleanSizeY);
  int x = booleanLeftX + offset;
  int y = booleanTopY + (2 * offset);
  fill(0);
  textConditionals(melodyOn, "Melody", x, y);
  textConditionals(chordsOn, "Chords", x, y + (booleanLineSpacing));
  textConditionals(trumpetOn, "Trumpet", x, y + (2 * booleanLineSpacing));
  textConditionals(pianoChordsOn, "Piano Chords", x, y + (3 * booleanLineSpacing));
  textConditionals(saxOn, "Sax", x, y + (4 * booleanLineSpacing));
  textConditionals(bassOn, "Bass", x, y + (5 * booleanLineSpacing));
  textConditionals(pianoNotesOn, "Piano Notes", x, y + (6 * booleanLineSpacing));
  textConditionals(drumsOn, "Drums", x, y + (7 * booleanLineSpacing));
  textConditionals(random, "Random Melody", x, y + (8 * booleanLineSpacing));
  textConditionals(mute, "Mute", x, y + (9 * booleanLineSpacing));
}

void textConditionals(boolean input, String label, int x, int y)
{
  if (input) //True
  {
    text(label + " = True", x, y);
  }
  else //False
  {
    text(label + " = False", x, y);
  }
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
    
  cp5.addButton("randomButton")
    .setValue(0)
    .setLabel("Random")
    .setPosition((4 * width)/10 + (4 * offset) + (2 * buttonSizeX), 10)
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
  
  cp5.addButton("muteButton")
    .setValue(0)
    .setLabel("Mute")
    .setPosition(width - buttonSizeX - offset, height - buttonSizeY - offset)
    .setSize(buttonSizeX, buttonSizeY)
    ;
    
  cp5.addSlider("currentInt")
    .setPosition((((4 * width)/10) + (3 * offset)), buttonSizeY + (4 * offset))
    .setWidth(sliderWidth)
    .setLabel("Current Scale Number")
    .setRange(0, usableScaleNames.length - 1)
    .setNumberOfTickMarks(usableScaleNames.length - 1)
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

void randomButton()
{
  if (random)
  {
    random = false;
  }
  else
  {
    random = true;
  }
}

void muteButton()
{
  if (mute)
  {
    mute = false;
  }
  else
  {
    mute = true;
  }
}
