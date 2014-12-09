//Rearchitectured Code on November 29, 2014
//Piano notes and bass are too quiet
/*
Exhibit Invention

Title: Automated Music Soloing
Imagined, Designed, and Programmed by: Kevin Hou
Date: December 15, 2014

Description:
This application automatically plays default riffs or random melodies based
on music theory. The entire program is based off the current scale and chord.
There are a number of instruments that play and each can be muted to the user's
desire.

Sources of ideas and inspiration:
 * iTunes jazz radio
 * Music theory in my music class
 
Includes code from:
 * Music_Soloing (First version of this code that I wrote)
 
<Use command + T to auto-indent your code for cleaner formatting>
<If you can't remember where you found some code, Google the text to find it.>
<Put your name in the name of this file!>

*/

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
boolean random = true;
boolean mute = false;
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
  initialInstruments(); //Turn on certain instruments
  currentScale = "majorC"; //Don't use blues scales
  currentChord = "C";
}

void draw()
{
  changeCurrent(currentInt);
  userInterface();
  changeChordTone();
  randomRiff();
  playRiff();
}
