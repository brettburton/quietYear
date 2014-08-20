

Deck spring;
Deck summer;
Deck fall;
Deck winter;

int whatSeason = 1;

//----------------------------------------------------------

void setup(){
  
  spring = new Deck("Spring");
  summer = new Deck("Summer");
  fall = new Deck("Fall");
  winter = new Deck("Winter");
  
  size(450,600);
  background(80,80,80);
 
  spring.restoreDeckState();
  summer.restoreDeckState();
  fall.restoreDeckState();
  winter.restoreDeckState();
  
}

//----------------------------------------------------------

void draw(){
  
  //background(80,80,80);
  
  //spring -------------------------
  if (whatSeason == 1){
    
    if(spring.initialized==false){
      spring.init(); //load the deck if it hasn't already been loaded
    }
  
  textSize(20);
  text("It is Spring", 50, 40);
  spring.display();
  spring.update();
  }


  //summer -------------------------
  if (whatSeason == 2){

    if(summer.initialized==false){
      summer.init(); //load the deck if it hasn't already been loaded
    }
    
  textSize(20);
  text("It is Summer", 50, 40);
  summer.display();
  summer.update();
  } 

 
 //fall -------------------------
   if (whatSeason == 3){
    
    if(fall.initialized==false){
      fall.init(); //load the deck if it hasn't already been loaded
    }
  
  textSize(20);
  text("It is Fall", 50, 40);
  fall.display();
  fall.update();
  }
 
 //winter -------------------------
   if (whatSeason == 4){
    
    if(winter.initialized==false){
      winter.init(); //load the deck if it hasn't already been loaded
    }
  
  textSize(20);
  text("It is Winter", 50, 40);
  winter.display();
  winter.update();
  }
  
 
   nextSeason();
   
}

//----------------------------------------------------------

void mouseClicked(){
  
   //spring -------------------------
  
  if (whatSeason == 1){
    if(spring.isInside1 == true){
      spring.getCard();
    }
    if(spring.isInside2 == true){
      spring.reshuffle();
    }
  }
  
   //summer -------------------------
   
  if (whatSeason == 2){    
    if(summer.isInside1 == true){
      summer.getCard();
    }
    if(summer.isInside2 == true){
      summer.reshuffle();
    }
  }
  
   //fall -------------------------
  
    if (whatSeason == 3){      
    if(fall.isInside1 == true){
      fall.getCard();
    }
    if(fall.isInside2 == true){
      fall.reshuffle();
    }
  }
  
   //winter -------------------------
  
    if (whatSeason == 4){      
    if(winter.isInside1 == true){
      winter.getCard();
    }
    if(winter.isInside2 == true){
      winter.reshuffle();
    }
  }
  
}

//----------------------------------------------------------

void nextSeason(){
  
   if (spring.cardsLeft == false && summer.cardsLeft == true){
   whatSeason = 2;
 }
 
   if (spring.cardsLeft == false && summer.cardsLeft == false && fall.cardsLeft == true){
   whatSeason = 3;
  }

   if (spring.cardsLeft == false && summer.cardsLeft == false && fall.cardsLeft == false && winter.cardsLeft == true){
   whatSeason = 4;
  }
  
   if (spring.cardsLeft == false && summer.cardsLeft == false && fall.cardsLeft == false && winter.cardsLeft == false){
   print ("out of cards");
  }
  
}


