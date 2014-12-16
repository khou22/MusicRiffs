//Rearchitectured Code on November 29, 2014
//Piano notes and bass are too quiet
/*
Exhibit Invention

Title: Automated Music Soloing
Imagined, Designed, and Programmed by: Kevin Hou
Date: December 15, 2014
G Block - Natalie Freed

Description:
This application automatically plays default riffs or random melodies based
on music theory. The entire program is based off the current scale and chord.
There are a number of instruments that play and each can be muted to the user's
desire. Use 1440 x 900 (ie. the screen size on a 13" retina mac between the "More space" and the "Best (Retina)"
display settings.

Sources of ideas and inspiration:
 * iTunes jazz radio
 * Music theory in my music class
 
Includes code from:
 * Music_Soloing (First version of this code that I wrote)

Mini-Reflection
 * I wish that the sound quality sounded less "machine-like." As of now, it lacks the human intination and instincts
 * I also wish I had adjusted the display to fit with all different screens, not just my native screen
 * The nice part is that this program can essenitally be changed entirely just by changing a few lines of code. The playing
   aspect of the program is solid and can vertually play any note as long as its specified in the melody.
*/

//Adjustable
int trackBPM = 60; //Actual BPM, only use 60, 120, or 180 with drum beats - 30 allows all notes to be heard
int trumpetVolume = 75; //Set volumes
int pianoVolume = 100;
int bassVolume = 100;
int drumsVolume = 50;
int pianoNotesVolume = 100;
int melodyLength = 32; //*Change this to a high number to play more notes, not definitively based on number
int melodyBeats = 8; //*Change this (Ignore these two lines)
color backgroundColor = color(203, 203, 203); //Background color
boolean trumpetOn = true; //Variables to turn on and off instruments
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
  currentChord = "C"; //Corresponding Scale
}

void draw()
{
  changeCurrent(currentInt);
  userInterface();
  changeChordTone();
  randomRiff();
  playRiff();
  drawInfoScreen();
}
