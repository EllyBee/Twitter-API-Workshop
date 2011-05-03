
// This example allows you to update your own Twitter status

// Visit this url: http://apilab.internal.sandbox.wk.com/ to get your
// own accessToken and accessSecret. These will make this example link to your own account.

String accessToken = "Put your access token here";
String accessSecret = "Put your access secret here";


String newStatus = "I love api lab yes";

 //----------------------------------//code//-------------------------------------------------//

Twitter myTwitter;

PFont font;

void setup(){
  
   //set up connection to twitter
   myTwitter = new TwitterFactory( ) . getOAuthAuthorizedInstance (
   "os2TlxsbP32YfVPvnJTaA", "qoA55TNgxqXJLN2DejcysWd2CHsUwLPDKlEcpOT7fA", 
   new AccessToken( accessToken, accessSecret ) );
    
  size(200,200);
  
 
  noStroke();
  
  update();
  
  
  }


void draw(){
 
}


void update(){
  
    try{
      
    int s = second();  
    int m = minute();  
    int h = hour(); 
   
    String time = h + ":" + m +  ":" + s;
   
   
    println("status update");
  
    Status status = myTwitter.updateStatus(newStatus + " - tweeted from #apilab at " + time);
    println(status.getText());
    System.out.println("Successfully updated the status to [" + status.getText() + "].");


 }
 
 //catch errors
  catch(TwitterException te){
    println("error");
     println("Couldn't connect: " + te);
  }
  
  
  
  catch(NullPointerException ne){
    println("null");
  }
}

