
// This example allows you to search Twitter and print your results
                
String searchQuery = "cats";

//----------------------------------//code//-------------------------------------------------//



Twitter myTwitter;

int tweetNum= 10;
PImage[] img= new PImage[tweetNum];
PFont font;

void setup(){

myTwitter = new Twitter();
 
size(800,480);

font= loadFont("ArialMT-15.vlw");


}


void draw(){
background(0);
update();
delay(1000);
}




void update(){

try{
  Query query= new Query(searchQuery);
  query.setRpp(tweetNum); //sets the number of tweets to return per page, up to a max of 100
  QueryResult result= myTwitter.search(query);
  ArrayList tweets= (ArrayList) result.getTweets();

  for(int i=0; i<tweets.size(); i++){
    Tweet t= (Tweet) tweets.get(i);
    
    pushMatrix();
    translate(10, 10+40*i);
    
    String user= t.getFromUser();    //store username in "user"
    String msg= t.getText();   //store tweet in "msg" 
    Date d= t.getCreatedAt();   //store date in "d"
    
    //getting time difference (millis seconds ago)
    Date now= new Date();
    long past= now.getTime() - d.getTime();
   

    String imgUrl= t.getProfileImageUrl(); //store where the image is (URL)
    
    img[i]= loadImage(imgUrl);
    image(img[i], 0, 0, 30, 30);

    fill(255);
    textFont(font,15);
    text(msg,35,15);
    
    popMatrix();
  }
}
catch(TwitterException te){
  println("error");
 
}
catch(NullPointerException ne){
  println("nullnull");
}
}


void mousePressed(){
update();
}
