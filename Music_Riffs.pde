//Rearchitectured Code on November 29, 2014
//Piano notes and bass are too quiet

//Adjustable
int trackBPM = 60; //Actual BPM, only use 60, 120, or 180 with drum beats - 30 allows all notes to be heard
int trumpetVolume = 75;
int pianoVolume = 100;
int bassVolume = 100;
int drumsVolume = 50;
int pianoNotesVolume = 100;
int melodyLength = 32; //*Change this to a high number to play more notes, not definitively based on number
int melodyBeats = 8; //*Change this
color backgroundColor = color(203, 203, 203);
boolean trumpetOn = true;
boolean pianoChordsOn = true;
boolean pianoNotesOn = true;
boolean drumsOn = true;
boolean bassOn = true;
boolean saxOn = false;
boolean melodyOn = true;
boolean chordsOn = true;
String currentScale;
String currentChord;

void setup()
{
  setupWindow(); //Initial setup
  declareClasses(); //Create classes
  createFonts(); //Create fonts
  createHashmaps(); //Create the objects for each note
  initializeMelodyArray(); //Create array for the melody
  volume(trumpetVolume, pianoVolume, bassVolume, drumsVolume, pianoNotesVolume); //Set volume assuming computer supports volume
  currentScale = "majorC"; //Don't use blues scales
  currentChord = "C";
}

void draw()
{
  userInterface();
  changeChordTone();
  randomRiff();
  playRiff();
}
