int riff = 0;
int octave = 0;
boolean playNote;
boolean endOfMelody = false;
boolean randomMelody = true;
boolean changeChord = false;

void randomRiff()
{
  if (randomMelody)
  {
    melody.clear(); //Refresh melody array
    rythem.clear(); //Refresh rythem array
    riff = int(random(0, allRiffs.length));
    println("The random number of the riff generated was: " + riff);
    octave = octaves[int(random(0, octaves.length))];
    println("The random number of the octave generated was: " + octave);
//    riff = 1; //For debugging purposes don't use random
//    octave = 3; //^
//    println(allRiffs[riff][0].length); //Debugging
    for (int i = 0; i < allRiffs[riff][0].length; i++)
    {
      String[] scale = scaleMap.get(currentScale); //Get current scale
      rythem.add(allRiffs[riff][1][i]);
      int numInScale = int(allRiffs[riff][0][i]) - 1; //To offset that arrays begin with 0
      if (numInScale == -1)
      {
        melody.add("~"); //Symbolic of rest
      }
      else
      {
        String note = scale[numInScale] + str(octave);
        melody.add(note); //Use the number in the scale for the melody
      }
    }
    randomMelody = false; //Don't generate melody until next run through
    endOfMelody = false;
  }
}

void playRiff()
{
  if (!randomMelody)
  {
    firstTime();
    checkTimer(); //Check to see if should go on to next note
    checkEndOfMelody(); //Check to see if the melody is over
    if (playNote & !endOfMelody)
    {
      playNote(melody.get(currentNote), rythem.get(currentNote));
    }
  }
}

void firstTime()
{
  if (firstTime & !endOfMelody)
  {
    playChord(currentChord, 4); //Play chord tone
    currentNote = -1; //That way when millis() > 0 (haven't defined endTime), it will equal 0
    println(melody);
    println(rythem);
    firstTime = false; //Prevent repeat of this
  }
}

void checkTimer()
{
  if (millis() >= endTime & !endOfMelody) //If the note has finished
  {
    currentNote++; //Next note
    println("Current Note = " + currentNote);
    playNote = true; //Allow to play
  }
}

void checkEndOfMelody()
{
  if (currentNote > melody.size()-1 & !endOfMelody) //Past last note
  {
    println("The melody is made up of: " + melody.size() + " note(s)");
    println("Melody is finished");
    firstTime = true;
    endOfMelody = true;
    randomMelody = true; //New melody
    changeChord = true; //New chord
//    exit(); //Quit
  }
}

void playNote(String note, float beats) //Declare note and duration
{
  startTime = millis(); //Start time
  currentNoteName = note;
  endTime = startTime + whichBeat(beats); //Time to start next note
  if (note.equals("~")) //If there is a rest
  {
    println("Resting for: " + beats + " beats");
  }
  else
  {
//    println("Will play note: " + note + " for: " + beats + " beats");
    noteMap.get(note).play(beats);
  }
  playNote = false; //Don't allow repeat of note
}

void playChord(String chord, float beats)
{
  chordMap.get(chord).play(beats);
}

void volume(int t, int p, int b, int d, int pn)
{
  hasVolume = trumpet.hasControl(ddf.minim.Controller.VOLUME);
  if (hasVolume)
  {
    println("This computer is capable of local volume control");
    trumpet.setVolume(float(t/100));
    piano.setVolume(float(p/100));
    bass.setVolume(float(b/100));
    jazzDrums60.setVolume(float(d/100));
    jazzDrums120.setVolume(float(d/100));
    jazzDrums180.setVolume(float(d/100));
    pianoNotes.setVolume(float(pn/100));
  }
  else
  {
    println("This computer is not capable of local volume control");
  }
}

void changeChordTone()
{
  if (currentChordNum == chordProgressionSequence.length-1)
  {
    println("Finished chord progression sequence");
    currentChordNum = 0;
  }
  if (changeChord)
  {
    currentChordNum++; //Next chord
    currentScale = allScaleNames[chordProgressionSequence[currentChordNum]];
    currentChord = allChords[chordProgressionSequence[currentChordNum]];
    println("Current chord is: " + currentChord);
    println("Current scale is: " + currentScale);
    changeChord = false;
  }
}
