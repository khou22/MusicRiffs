//Info screen with what's going on
boolean infoScreen = false;
int xAllignment = 100;
int spacing = 25;
int y = 100 + spacing;

void drawInfoScreen()
{
  if (infoScreen)
  {
    hideButtons();
    cp5.controller("backButton").show();
    background(backgroundColor); //Refresh
    textFont(infoFont); //Font
    stroke(0);
    strokeWeight(3);
    noFill();
    rect(xAllignment - 50, 100, width - 2 * (xAllignment) + 50, (spacing * 17) + offset);
    fill(0);
    y = 100 + spacing;
    textLine("      Music is a compilation of vocal or instrumental sounds (or both) combined in such a way as to produce beauty of form, harmony, and expression of emotion.");
    textLine("When we hear songs that are pleasing to the ear, what we are actually hearing is the harmony between notes and chords. Although it may be unconscious,");
    textLine("there is a certain palpable effect on the listener when the notes mesh together perfectly. For example, jazz, classical, and even modern pop all use the");
    textLine("same basic ideas of music – chords and notes.");
    textLine("");
    textLine("      A chord is essentially a group of notes (typically three or more) that are played in unison. The chord dictates the personality and feel of a given time frame.");
    textLine("For a solo to sound “perfect,” notes are played that work in harmony with the chord. It is easiest to compare chords and their corresponding notes to books.");
    textLine("If you select a series of books, you now have a “chord.” The individual notes are the books. All the books you select should have some context within the series.");
    textLine("This is similar to music – you must choose notes that work in harmony with the chord. The notes you play can be in any succession and for any length of time.");
    textLine("The best sounding notes are ones that are within the chord’s scale, or books within the given series. Musicians have a collection of hundreds of series, each");
    textLine("with a different plot and different books within them. Chords move in progressions, switching from series to series every so often so as to not read the same book");
    textLine("too many times.");
    textLine("");
    textLine("      In this exhibit, you will see the pleasing effect of having even a random selection of notes played over its corresponding chord. Because the notes fall within");
    textLine("the chord’s scale, the random music sounds harmonic and smooth.");
    textLine("");
    textLine("As you can see, the program lacks the human compoenent which causes the music quality to significantly be decreased.");
  }
}

void textLine(String line)
{
  text(line, xAllignment, y);
  y = y + spacing;
}

void hideButtons() //Hide buttons after going to info screen
{
  cp5.controller("melodyButton").hide();
  cp5.controller("chordsButton").hide();
  cp5.controller("randomButton").hide();
  cp5.controller("bassButton").hide();
  cp5.controller("trumpetButton").hide();
  cp5.controller("pianoNotesButton").hide();
  cp5.controller("muteButton").hide();
  cp5.controller("infoScreen").hide();
  cp5.controller("pianoChordsButton").hide();
//  cp5.controller("drumsButton").hide();
  cp5.controller("saxButton").hide();
  cp5.controller("currentInt").hide();
}

void showButtons() //Show buttons after going back to the main screen
{
  cp5.controller("melodyButton").show();
  cp5.controller("chordsButton").show();
  cp5.controller("randomButton").show();
  cp5.controller("bassButton").show();
  cp5.controller("trumpetButton").show();
  cp5.controller("pianoNotesButton").show();
  cp5.controller("muteButton").show();
  cp5.controller("infoScreen").show();
  cp5.controller("pianoChordsButton").show();
//  cp5.controller("drumsButton").show();
  cp5.controller("saxButton").show();
  cp5.controller("currentInt").show();
}
