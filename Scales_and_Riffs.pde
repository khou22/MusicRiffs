//***************************** Chord scales ************************************
String majorC[] = {"C", "D", "E", "F", "G", "A", "B"};
String majorDb[] = {"Db", "Eb", "F", "Gb", "Ab", "Bb", "C"};
String majorD[] = {"D", "E", "Gb", "G", "A", "B", "Db"};
String majorEb[] = {"Eb", "F", "G", "Ab", "Bb", "C", "D"};
String majorE[] = {"E", "Gb", "Ab", "A", "B", "Db", "Eb"};
String majorF[] = {"F", "G", "A", "Bb", "C", "D", "E"};
String majorGb[] = {"Gb", "Ab", "Bb", "B", "Db", "Eb", "F"};
String majorG[] = {"G", "A", "B", "C", "D", "E", "Gb"};
String majorAb[] = {"Ab", "Bb", "C", "Db", "Eb", "F", "G"};
String majorA[] = {"A", "B", "Db", "D", "E", "Gb", "Ab"};
String majorBb[] = {"Bb", "C", "D", "Eb", "F", "G", "A"};
String majorB[] = {"B", "Db", "Eb", "E", "Gb", "Ab", "Bb"};

String CBlues[] = {"C", "Eb", "F", "Gb", "G", "Bb"};
String DbBlues[] = {"Cb", "F", "Gb", "G", "Ab", "B"};
String DBlues[] = {"D", "Gb", "G", "Ab", "B", "C"};
String EbBlues[] = {"Eb", "G", "Ab", "A", "C", "Db"};
String EBlues[] = {"E", "Ab", "A", "Bb", "Db", "D"};
String FBlues[] = {"F", "A", "Bb", "C", "D", "Eb"};
String GbBlues[] = {"Gb", "Bb", "B", "Db", "Eb", "E"};
String GBlues[] = {"G", "B", "C", "D", "E", "F"};

//***************************** Chord Progressions ************************************
int chordProgressionSequence[] = {0, 2, 5, 7, 0}; //Corresponds to 2, 4, 5, 1

//***************************** General ************************************
int octaves[] = {3, 4, 5};
String allNotes[] = {"C3", "Db3", "D3", "Eb3", "E3", "F3", "Gb3", "G3", "Ab3", "A3", "Bb3", "B3", "C4", "Db4", "D4", "Eb4", "E4", "F4", "Gb4", "G4", "Ab4", "A4", "Bb4", "B4", "C5", "Db5", "D5", "Eb5", "E5", "F5", "Gb5", "G5", "Ab5", "A5", "Bb5", "B5", "C6"};
String allChords[] = {"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"};
String noteNames[] = {"C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"};
String[][] allScales = {majorC, majorDb, majorD, majorEb, majorE, majorF, majorGb, majorG, majorAb, majorA, majorBb, majorB, CBlues, DbBlues, DBlues, EbBlues, EBlues, FBlues, GbBlues, GBlues}; //All chord scales
String[] allScaleNames = {"majorC", "majorDb", "majorD", "majorEb", "majorE", "majorF", "majorGb", "majorG", "majorAb", "majorA", "majorBb", "majorB", "CBlues", "DbBlues", "DBlues", "EbBlues", "EBlues", "FBlues", "GbBlues", "GBlues"}; //All chord scale names in same order
String[] usableScaleNames = {"majorC", "majorDb", "majorD", "majorEb", "majorE", "majorF", "majorGb", "majorG", "majorAb", "majorA", "majorBb", "majorB"};

//***************************** Riffs ************************************
//Riffs in accordance with riff guide I got from Joe (0 is a rest)
float melody1[] = {3, 4, 3, 0};
float rythem1[] = {1, .5, .5, 2};
float one[][] = {melody1, rythem1};

float melody2[] = {0, 3, 4, 3, 0};
float rythem2[] = {1, .5, .5, 1, 1};
float two[][] = {melody2, rythem2};

float melody3[] = {5, 1, 4, 1, 3, 1, 4, 1};
float rythem3[] = {.66, .33, .66, .33, .66, .33, .66, .33};
float three[][] = {melody3, rythem3};

float melody4[] = {5, 7, 4, 5, 7, 4, 5, 7};
float rythem4[] = {.66, .33, .66, .33, .66, .33, .66, .33};
float four[][] = {melody4, rythem4};

float melody5[] = {7, 6, 5, 6, 7, 1, 6, 5, 0};
float rythem5[] = {1, 1, 1, 1, .5, .5, .5, .5, 2};
float five[][] = {melody5, rythem5};

float melody6[] = {1, 2, 3, 4, 5, 6, 7, 1};
float rythem6[] = {.5, .5, .5, .5, .5, .5, .5, .5};
float six[][] = {melody6, rythem6};

float melody7[] = {3, 4, 5, 7, 5, 7, 5, 7, 5};
float rythem7[] = {.5, .25, .25, .5, .5, .5, .5, .5, .5};
float seven[][] = {melody7, rythem7};

float melody8[] = {3, 2, 1, 2, 3, 3, 3};
float rythem8[] = {.5, .5, .5, .5, .5, .5, 1};
float eight[][] = {melody8, rythem8};

float allRiffs[][][] = {one, two, three, four, five, six, seven, eight};
