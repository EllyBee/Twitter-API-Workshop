 
 
//----------------------------------//variables//-------------------------------------------------//

// Visit this url: http://apilab.internal.sandbox.wk.com/ to get your
// own accessToken and accessSecret. These will make this example link to your own account.

String accessToken = "Put your access token here";
String accessSecret = "Put your access secret here";

//List of updates for your twitter roulette machine - feel free to change

String update1 = "There never was a good war or a bad peace.";
String update2 = "The only true wisdom consists in knowing that you know nothing.";
String update3 = "You can’t shake hands with a clenched fist.";
String update4 = "Knowledge talks, wisdom listens.";
String update5 = "When the character of a man is not clear to you, look at his friends.";
String update6 = "Never forget what a man says to you when he is angry."; 
String update7 = "Guns don’t kill people — people do.";
String update8 = "Beware of a man of one book.";



//----------------------------------//code//-------------------------------------------------//


Twitter myTwitter;

//font stuff
PFont font;


//array of possible updates
String[] updates = {update1, update2, update3, update4, update5, update6, update7, update8};

String newStatus;
 
String mode = "wheel";

int mouseCount = 0;

Boolean firstRun = true;





void setup(){

   //set up connection to twitter
   myTwitter = new TwitterFactory( ) . getOAuthAuthorizedInstance (
   "os2TlxsbP32YfVPvnJTaA", "qoA55TNgxqXJLN2DejcysWd2CHsUwLPDKlEcpOT7fA",      
      
   new AccessToken( accessToken, accessSecret) );
      
   size(500,480);
    
   frameRate(4);
   
   font= loadFont("ArialMT-15.vlw");
   textFont(font); 
   noStroke();

  
  }


void draw(){                 
  
  if(mode=="wheel"){                         
      SpinTheWheel();                 
  }
  
  
  if(mode=="stop"){                                  
      wheelStop();
  }
 
}


 void mousePressed(){
 
switch(mouseCount) {
    case 0:                          
      mode = "stop";
      mouseCount = 1;
      break;
    case 1:                         
      mode = "wheel"; 
      mouseCount = 0;
      firstRun = true;
      break;
  }
 
 
 }


 
 
 
 void SpinTheWheel(){

  background(0);

   for(int t=0; t < updates.length; t++){
      
       fill(255);
       textFont(font,15);
       
       int x = int(random(width - 20));
       int y = int(random(height - 20));
       
       text(updates[t],x,y);
      
    }
    
  fill(255);
  rect(0,0,width, 30);
  
  fill(0);
  textFont(font,15);
  text("Twitter Quote Roulette - click to play", 10 , 20 );
 
 
 }
 
 
 
 void wheelStop(){
 
 if(firstRun){
 
   background(255);
   
   int i = updates.length-1;
   int s = int(random(i));
   
   newStatus = updates[s];
   
   String msg = "Your Twitter status has just been updated to...";
 
   fill(0);
   textFont(font,15);

   text(msg, 20, height/2 - 20);
   
   fill(255, 0, 0);

   text(newStatus, 20, height/2 + 20);
   
   update();
   
   firstRun = false;
   
 }

 }
 
 
 
 void update(){

  try{
 
  println("status sending = " + newStatus);
  
  int s = second();  
  int m = minute();  
  int h = hour(); 
   
  String time = h + ":" + m +  ":" + s;
  
  Status status = myTwitter.updateStatus(newStatus + " tweeted from #apilab at " + time);
 
  System.out.println("Successfully updated the status to [" + status.getText() + "].");
 
   
 }
 
catch(TwitterException te){
  println("error");
  println("Couldn't connect: " + te);
   
   
}
catch(NullPointerException ne){
  println("null");
  
  
}
}
