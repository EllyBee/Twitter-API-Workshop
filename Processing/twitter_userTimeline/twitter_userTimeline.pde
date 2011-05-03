
      // This example allows you to get and display your Twitter timeline

      // Visit this url: http://apilab.internal.sandbox.wk.com to get your
      // own accessToken and accessSecret. These will make this example link to your own account.
      
      String accessToken = "Put your access token here";
      String accessSecret = "Put your access secret here";
      
      //change these values to change the colour of your twitter stream - values need to be between 0-255
      int redValue = 0;
      int greenValue = 0;
      int blueValue = 0;
      
      //randomise colours - 0 = no -  1 = yes
      int randomColours = 0;
      
      //change font size
      int fontSize = 15;
      
      //change this value to change the spacing between lines
      int lineSpaceCounter = 15;
      
      //to animate or not - 0 = no -  1 = yes
      int animate = 0; 
      
      //change speed of animation - max = 60
      int animationSpeed = 4;
      
      
      //----------------------------------//code//-------------------------------------------------//

      Twitter myTwitter;                 
      PFont font;
      
      //string array to store twitter timeline
      String updates[];
      
      //define the y position of tweets - where the top line of tweets will start
      int lineStart = 20;
      
      //define the x position of tweets
      int x = 10;
      
      int i = 0;                  
      int b = 0;                  
      
      
      void setup(){
        
         //set up connection to twitter
         myTwitter = new TwitterFactory( ) . getOAuthAuthorizedInstance (
          "os2TlxsbP32YfVPvnJTaA", "qoA55TNgxqXJLN2DejcysWd2CHsUwLPDKlEcpOT7fA",      
          
          new AccessToken( accessToken, accessSecret) );
          
          size(800,800);
          
          font= loadFont("ArialMT-48.vlw");
          
          textFont(font); 
          noStroke();
          
          background(255);
          
          updates = new String[20];
          
          //ok lets get your twitter
          update();
          
          //print results
          printResults();
          
          frameRate(animationSpeed);
          }
      
      
      void draw(){
        
        switch(animate) {
          case 0:                          
            
            break;
          case 1:                         
            fill(0,0,0,20);
            rect(0,0,width,height);                             
            x += 1;                                   
            printResults();
            break;
        }

       
      }
      
      void printResults(){
        
        
        for(int a = 0; a < 20; a++){
          
          switch(randomColours) {
          case 0:                          
            
            break;
          case 1:                         
            redValue = int(random(255));
            greenValue = int(random(255));
            blueValue = int(random(255));
            break;
        }
          
 
          fill (redValue, greenValue, blueValue);
          textFont(font, fontSize);
          text(updates[b], x, lineStart);
          
          b++;
          
          lineStart+=lineSpaceCounter;
         
        }
 
        b = 0;
        lineStart = 0;
      }
      

      
      void update(){
      
        try{
 
          //List<Status> statuses = myTwitter.getHomeTimeline(); // returns what you see on your twitter wall
         List<Status> statuses = myTwitter.getUserTimeline(); // returns users timeline
          //List<Status> statuses = myTwitter.getUserTimeline("BillBailey"); // returns users timeline for which ever user is in the brackets
         // List<Status> statuses = myTwitter.getMentions();  //returns a list of tweets you were mentioned in
          //List<Status> statuses = myTwitter.getFriendsTimeline();  //returns a list of the most recent tweets by your friends
          //List<Status> statuses = myTwitter.getRetweetedByMe();
          //List<Status> statuses = myTwitter.getRetweetsOfMe();
 
          
          for (Status status : statuses) {
              System.out.println(status.getUser().getName() + ":" +
                                 status.getText() + "/n");
                                 println();

                   updates[i] = status.getText();
                   i++;
            
                 }

          
        }
        catch(TwitterException te){
          println("error");
           println("Couldn't connect: " + te);
        }
        catch(NullPointerException ne){
          println("null");
        }
      }
      


 
