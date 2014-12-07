//General
int beatsPerMeasure = 4;
boolean hasVolume; //Not all computers can set volume

//Minim library (http://code.compartmental.net/minim/)
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer piano; //For chords
AudioPlayer trumpet; //For melody notes
AudioPlayer bass; //For bass lines
AudioPlayer pianoNotes; //For piano melody notes
AudioPlayer sax; //For tenor sax notes
AudioPlayer jazzDrums60;
AudioPlayer jazzDrums120;
AudioPlayer jazzDrums180;

//Fonts
PFont defaultFont;
PFont buttonFont;
PFont headerFont;

//Hashmaps
HashMap<String, Note> noteMap = new HashMap<String, Note>(); //Hashmap
HashMap<String, Chord> chordMap = new HashMap<String, Chord>(); //Hashmap
HashMap<String, String[]> scaleMap = new HashMap<String, String[]>(); //Hashmap for scales

//Files
String pianoChords = "Piano Chord Samples.aif";
String pianoNotesFile = "Piano Notes.aif";
String trumpetNotes = "Trumpet Note Samples.aif";
String bassComp = "Bass Bassline.aif";
String tenorSaxFile = "Tenor Sax.aif";
String jazzDrums60File = "Jazz Drums 60.aif";
String jazzDrums120File = "Jazz Drums 120.aif";
String jazzDrums180File = "Jazz Drums 180.aif";
float fileBPM = 60; //60 BPM in garageband
float speedMultiple = fileBPM/trackBPM; //Speed up/down by this much
float valOfBeat = fileBPM/60; //Number of seconds each beat is

//Not direclty changed
int currentNote = 0;
int currentChordNum = 0;
float lengthOfNote = 1;
int startTime = 0;
int endTime = 0;
int longestNote = 8; //8 = 2 beats *Don't change this
int shortestNote = 1; //1 = .25 beats *Don't change this
boolean firstTime = true;
boolean conditional = true;
boolean firstPerMelody = true;
float beatsUsed = 0;
String currentNoteName = "NA";

//Array Lists
ArrayList<String> melody;
ArrayList<Float> rythem;

void declareClasses()
{
  minim = new Minim(this); //Initialize the minim library
  piano = minim.loadFile(pianoChords); //Load player
  trumpet = minim.loadFile(trumpetNotes); //Load player
  bass = minim.loadFile(bassComp); //Load player
  sax = minim.loadFile(tenorSaxFile); //Load player
  pianoNotes = minim.loadFile(pianoNotesFile); //Load player
  jazzDrums60 = minim.loadFile(jazzDrums60File);
  jazzDrums120 = minim.loadFile(jazzDrums120File);
  jazzDrums180 = minim.loadFile(jazzDrums180File);
}

class Note //Create a class for each note
{
  String noteName;
  
  Note(String noteName)
  {
    this.noteName = noteName;
  }
  void play(float beats) //Code for playing
  {
    for (int i = 0; i < allNotes.length; i++)
    {
      if (noteName.equals(allNotes[i])) //Special syntax for finding strings equal to each other
      {
//        println(speedMultiple);
        float beatsIn = (i * beatsPerMeasure) + (beatsPerMeasure - (speedMultiple * beats));
        float endOfNote = ((i + 1) * beatsPerMeasure);
        println("Playing a " + noteName + " for " + beats + " beat(s)");
        println("From " + whichBeat(beatsIn) + " to " + whichBeat(endOfNote));
        trumpet.setLoopPoints(whichBeat(beatsIn), whichBeat(endOfNote)); //Declare beginning and end of note
        pianoNotes.setLoopPoints(whichBeat(beatsIn), whichBeat(endOfNote)); //Declare beginning and end of note
        sax.setLoopPoints(whichBeat(beatsIn), whichBeat(endOfNote)); //Declare beginning and end of note
        if (melodyOn)
        {
          if (trumpetOn)
          {
            trumpet.loop(0); //Play one time
          }
          if (saxOn)
          {
            sax.loop(0); //Play one time
          }
          if (pianoNotesOn)
          {
            pianoNotes.loop(0); //Play one time
          }
        }
      }
    }
  }
}

class Chord //Create a class for each chord
{
  String chordName;
  
  Chord(String chordName)
  {
    this.chordName = chordName;
  }
  void play(float beats)
  {
    for (int i = 0; i < allChords.length; i++)
    {
      if (chordName.equals(allChords[i]))
      {
        float beatsIn = (i * beatsPerMeasure) + (beatsPerMeasure - (speedMultiple * beats));
        float endOfNote = ((i + 1) * fileBPM);
        bass.setLoopPoints(whichBeat(beatsIn), whichBeat(endOfNote)); //For bass
        piano.setLoopPoints(whichBeat(beatsIn), whichBeat(endOfNote)); //Declare beginning
        if (chordsOn)
        {
          if (pianoChordsOn)
          {
            piano.loop(0); //Play one time
          }
          if (bassOn)
          {
            bass.loop(0); //Play two times because two times faster
          }
        }
      }
    }
  }
}

int whichBeat(float beat) //Which beat to come in on in the track
{
  int val = int(1000 * (beat * valOfBeat));
  return val;
}

void createHashmaps() //Create the objects for each note
{
  for (int i = 0; i < allNotes.length; i++)
  {
    noteMap.put(allNotes[i], new Note(allNotes[i]));
    println("Created note: " + allNotes[i] + " (corresponds with: " + allNotes[i] + ")");
  }
  for (int i = 0; i < allChords.length; i++)
  {
    chordMap.put(allChords[i], new Chord(allChords[i]));
    println("Created chord: " + allChords[i] + " (corresponds with: " + allChords[i] + ")");
  }
  for (int i = 0; i < allScales.length; i++)
  {
    scaleMap.put(allScaleNames[i], allScales[i]);
    println(allScaleNames[i] + " corresponds with scale: " + allScales[i]);
  }
}

void initializeMelodyArray()
{
  melody = new ArrayList<String>(); //Initialize
  rythem = new ArrayList<Float>();
}

void createFonts()
{
  defaultFont = createFont("Times New Roman", 16);
  buttonFont = createFont("Cambria", 26);
  headerFont = createFont("Arial", 16);
}
