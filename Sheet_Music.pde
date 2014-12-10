int spacingBetweenLines = 30;
int smallestX = 50;
int lowestLine = 500;
int lengthOfLine = 400;
int xPosition = smallestX + spacingBetweenLines;
int xReset = smallestX + spacingBetweenLines;
int C3Position = spacingBetweenLines;
int spacingBetweenNotes = 20;
int widthOfNote = (3 * spacingBetweenLines)/4;
int heightOfNote = spacingBetweenLines;
int noteStemLength = 60;
String nonFlats[] = {"C", "D", "E", "F", "G", "A", "B"};

void sheetMusic()
{
  refresh();
  addText();
  addLines();
  addScale();
}

void addText()
{
  fill(0);
  textFont(sheetMusicTitle);
  text("Notes in the Scale", smallestX, lowestLine - (spacingBetweenLines * 5)); //Title
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
    String value = array[i];
    for (int j = 0; j < nonFlats.length; j++)
    {
      if (value.equals(nonFlats[j])) //Equals a non flat
      {
        addNote(xPosition, lowestLine + spacingBetweenLines - (j * (spacingBetweenLines/2)), nonFlats[j]);
      }
      else //Equals a flat
      {
        if (value.substring(0, 1).equals(nonFlats[j]))
        {
          addNote(xPosition, lowestLine + spacingBetweenLines - (j * (spacingBetweenLines/2)), nonFlats[j]);
          addFlat(xPosition, lowestLine + spacingBetweenLines - (j * (spacingBetweenLines/2)));
        }
      }
    }
    xPosition = xPosition + spacingBetweenLines + spacingBetweenNotes;
  }  
}

void addNote(int x, int y, String note)
{
  fill(0); //Black notes
  ellipse(x, y, widthOfNote, heightOfNote);
  line(x + (widthOfNote/2), y, x + (widthOfNote/2), y - noteStemLength);
  println(note);
  if (note.equals("C"))
  {
    strokeWeight(5);
    line(x - widthOfNote, y, x + widthOfNote, y);
  }
  strokeWeight(3); //Reset stroke weight
}

void addFlat(int x, int y)
{
  fill(0);
  textFont(flatFont);
  println("Printed flat symbol");
  text("b", x + offset + 5, y + 10);
}
