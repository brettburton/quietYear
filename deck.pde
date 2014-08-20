
class Deck{

ArrayList<String> cards;
PrintWriter OUTPUT;   

String deckName;
int buttX1, buttY1, buttW1, buttH1, buttX2, buttY2, buttW2, buttH2, textX, textY, textS, textW, textH;
boolean isInside1, isInside2, cardsLeft, initialized;

//----------------------------------------------------------

Deck(String deckName_){
 
  cards = new ArrayList<String>();  
 
  isInside1 = false;
  isInside2 = false;
  cardsLeft = true;
  initialized = false;
  
  textX = 50;
  textY = 200;
  textW = 300;
  textH = 500;
  textS = 15;
  
  deckName = deckName_;
  
}

//----------------------------------------------------------

void init(){
  reshuffle();
  initialized = true;
}

//----------------------------------------------------------

void display(){
  
  buttX1 = 50;
  buttY1 = 100;
  buttW1 = 150;
  buttH1 = 50;
  noStroke();
  fill(255,0,0);
  rect(buttX1, buttY1, buttW1, buttH1);
  fill(0,0,0);
  textSize(textS/1.5);
  text("Draw", buttX1+buttY1/8, buttY1+buttH1/1.5);
  
  buttX2 = 250;
  buttY2 = 100;
  buttW2 = 150;
  buttH2 = 50;
  noStroke();
  fill(255,0,0);
  rect(buttX2, buttY2, buttW2, buttH2);
  fill(0,0,0);
  textSize(textS/1.5);
  text("Reshuffle", buttX2+buttY2/8, buttY2+buttH2/1.5);

  

}


//----------------------------------------------------------

void update(){
  
  int mx = mouseX, my = mouseY;
  
  if (mx > buttX1 & mx < buttX1+buttW1 & my > buttY1 & my < buttY1+buttH1)  isInside1 = true;
  else                                        isInside1 = false;
  if (mx > buttX2 & mx < buttX2+buttW2 & my > buttY2 & my < buttY2+buttH2)  isInside2 = true;
  else                                        isInside2 = false;
  
}
  
//----------------------------------------------------------
  
void getCard(){
 
  if(cards.size() == 0){
    background(80,80,80);
//    textSize(textS/1.5);
//    text("All Cards Have Been Dealt", textX, textY);
    cardsLeft = false;
 }
 
  if(cardsLeft == true){
  
  int index = int(random(cards.size()));  // Same as int(random(52))
  String myCard = (cards.get(index));  
 // String[] list = split(myCard, " or ");
  
  background(80,80,80);
  textSize(textS);
  text(myCard, textX, textY, textW, textH);
//  text(list[0], textX, textY, textW, textH);
//  text(list[1], textX, textY+100, textW, textH);
  
  
//  String men = "Chernenko ] Andropov ] Brezhnev";
//String[] list = split(men, " ] ");
//// list[0] is now "Chernenko", list[1] is "Andropov"...
  
  cards.remove(index);
  saveTextFile();
  
  }
}

//----------------------------------------------------------

void saveTextFile(){ 
  
 OUTPUT = createWriter("cardList"+(deckName)+"B.txt");
  for(int i = 0; i < cards.size(); ++i){        
    String card = (String) cards.get(i);
    OUTPUT.println(card + "");  // here we export the cards
  }
  
  OUTPUT.flush();
  OUTPUT.close();
}

//----------------------------------------------------------

void reshuffle(){
  
   cards.clear();
  
   String[] cardList = loadStrings("cardList"+(deckName)+"A.txt"); 
   for(int i = 0; i < cardList.length; ++i){
     String[] myCards = split(cardList[i], ',');
     String card = myCards[0];
     cards.add(card);           // add values to a new array slot
  }
  
  saveTextFile();
  cardsLeft = true;
  
  background(80,80,80);
  textSize(textS);
  text("The Deck has been reshuffled", textX, textY);
  
}

//----------------------------------------------------------

void restoreDeckState(){
  
  background(80,80,80);
  fill(0,0,0);
  textSize(40);
//  text("LOADING DECK", textX, textY);
  
   String[] cardList = loadStrings("cardList"+(deckName)+"B.txt"); 
   for(int i = 0; i < cardList.length; ++i){
     String[] myCards = split(cardList[i], ',');
     String card = myCards[0];
     cards.add(card);           // add values to a new array slot
  }
  
//  background(80,80,80);
//  textSize(textS/1.5);
//  text("Deck has been loaded", textX, textY);

  
}

}
