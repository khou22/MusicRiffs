//Drawing the keyboard with the highlighted keys
int startingX = 550;
int startingY = 350;
int whiteKeyWidth = 60;
int whiteKeyHeight = 225;
int blackKeyWidth = 40;
int blackKeyHeight = 150;
int positionX = startingX;
color highlightColor = color(46, 159, 255); //Light blue
color highlightMelody = color(235, 44, 50); //Red
String[] allScaleNamesKeyboard = {"majorC", "majorDb", "majorD", "majorEb", "majorE", "majorFb", "majorF", "majorGb", "majorG", "majorAb", "majorA", "majorBb", "majorB", "CBlues", "DbBlues", "DBlues", "EbBlues", "EBlues", "FBlues", "GbBlues", "GBlues"}; //All chord scale names in same order
String[] allNotesKeyboard = {"C", "Db", "D", "Eb", "E", "Fb", "F", "Gb", "G", "Ab", "A", "Bb", "B"};
String[] blackKeys = {"Db", "Eb", "Gb", "Ab", "Bb"};

void chooseScaleAndChord()
{
  addTextTitle();
  drawKeys();
}

void drawKeys()
{
  fill(255);
  rect(startingX, startingY, 7 * whiteKeyWidth, whiteKeyHeight); //Make all non-selected keys white
  positionX = startingX; //Reset
  for (int i = 0; i < 13; i++) //13 keys
  {
    if (i%2 == 0) //If even (white keys)
    {
      noFill(); //White
      highlightSelected(i); //If it's the current scale
      rect(positionX, startingY, whiteKeyWidth, whiteKeyHeight); //Draw
      positionX = positionX + whiteKeyWidth - (blackKeyWidth/2);
    }
    else //If odd (black keys)
    {
      fill(0); //Black
      highlightSelected(i); //If it's the current scale
      if (i != 5) //If not Fb
      {
        rect(positionX, startingY, blackKeyWidth, blackKeyHeight); //Draw key
      }
      positionX = positionX + (blackKeyWidth/2);
    }
  }
  redrawBlackKeys();
}

void highlightSelected(int i)
{
//  println("If " + allScaleNames[i] + " is equal to " + currentScale); //Debugging
  if (allScaleNamesKeyboard[i].equals(currentScale))
  {
    fill(highlightColor); //Blue
  }
//  println("The melody.size() variable = " + melody.size()); //Debugging
  if (melody.size() > 0) //If there is a melody
  {
//    println("The variable, melody.get(currentNote) = " + melody.get(currentNote));
    if (currentNote < melody.size())
    {
      String note = melody.get(currentNote).substring(0, melody.get(currentNote).length() - 1); //Delete last character (the octave integer)
//      println("The variable, note = " + note); 
      if (note.equals(allNotesKeyboard[i]))
      {
        fill(highlightMelody); //Red
      }
    }
  }
}

void redrawBlackKeys()
{
  positionX = startingX + whiteKeyWidth - (blackKeyWidth/2);
  for (int i = 0; i < 5; i++) //5 Black Keys
  {
    if (blackKeyHighlight() == true)
    {
//      println("The fill is now set to noFill");
      noFill(); //If the current note is the current black key
    }
    else //If not the current black key
    {
      fill(0); //Black
    }
    if (i != 2)
    {
      rect(positionX, startingY, blackKeyWidth, blackKeyHeight);
    }
    positionX = positionX + whiteKeyWidth;
  }
}
 
boolean blackKeyHighlight() //Return true if the notes is a black key
{
  boolean condition = false;
  if (melody.size() > 0 & currentNote < melody.size()) //If there is a melody
  {
    String note = melody.get(currentNote).substring(0, melody.get(currentNote).length() - 1); //Note without octave
//    println(note);
    for (int j = 0; j < blackKeys.length; j++)
    {
      if (note.equals(blackKeys[j])) //If current note equals a black key
      {
//        println("Condition = true");
        condition = true;
      }
    }
  }
//  println("Function blackKeyHighlight = " + condition);
  return condition;
}

void addTextTitle()
{
  textFont(headerFont);
  text("Blue = Current chord/scale    Red = Note being played", startingX, startingY - offset);
}
