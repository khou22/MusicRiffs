int spacingBetweenLines = 30;
int smallestX = 100;
int lowestLine = 450;
int lengthOfLine = 400;
int xPosition = smallestX + spacingBetweenLines;
int xReset = smallestX + spacingBetweenLines;
int C3Position = spacingBetweenLines;
int spacingBetweenNotes = 20;
int widthOfNote = (3 * spacingBetweenLines)/4;
int heightOfNote = spacingBetweenLines;
int noteStemLength = 60;

void sheetMusic()
{
  refresh();
  addLines();
  addScale();
}

void addLines()
{
  for (int i = 0; i < 5; i++)
  {
    line(smallestX, lowestLine - (spacingBetweenLines * i), smallestX + lengthOfLine, lowestLine - (spacingBetweenLines * i));
  }
  line(smallestX, lowestLine, smallestX, lowestLine - (spacingBetweenLines * 4));
  line(smallestX + lengthOfLine, lowestLine, smallestX + lengthOfLine, lowestLine - (spacingBetweenLines * 4));
}

void addScale()
{
  xPosition = xReset;
  String array[] = scaleMap.get(currentScale);
  for (int i = 0; i < array.length; i++)
  {
    String value = array[i] + "3";
    for (int j = 0; j < allNotes.length; j++)
    {
//      println("Does " + value + " equal " + allNotes[j]); //Debugging
      if (value.equals(allNotes[j]))
      {
        if (value.equals("F3") || value.equals("B3"))
        {
          j = j + 1;
          addNote(xPosition, lowestLine - (j * (spacingBetweenLines/4)) + C3Position);
          println("There was an F or B");
        }
        else
        {
          addNote(xPosition, lowestLine - (j * (spacingBetweenLines/4)) + C3Position);
        }
        xPosition = xPosition + spacingBetweenLines + spacingBetweenNotes;
        println(j);
      }
    }
  }
}

void addNote(int x, int y)
{
  fill(0); //Black notes
  ellipse(x, y, widthOfNote, heightOfNote);
  line(x + (widthOfNote/2), y, x + (widthOfNote/2), y - noteStemLength);
}
