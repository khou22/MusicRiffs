int startingX = 550;
int startingY = 350;
int whiteKeyWidth = 60;
int whiteKeyHeight = 225;
int blackKeyWidth = 40;
int blackKeyHeight = 150;
int positionX = startingX;
color highlightColor = color(46, 159, 255); //Light blue

void chooseScaleAndChord()
{
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
}

void highlightSelected(int i)
{
//  println("If " + allScaleNames[i] + " is equal to " + currentScale); //Debugging
  if (i == 5)
  {
    if (allScaleNames[i + 1].equals(currentScale))
    {
      fill(highlightColor);
    }
  }
  if (allScaleNames[i].equals(currentScale))
  {
    fill(highlightColor); //Blue
  }
}
