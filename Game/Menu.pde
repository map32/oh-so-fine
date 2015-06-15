public class Menu{
  
  boolean menuOn = false;
  
   public void displayMenu() {
     pushMatrix();
     camera();
     hint(DISABLE_DEPTH_TEST);
     noLights();
     fill(0,0,0,100);
     rect(50,50, width-100, height-100);
     fill(255);
     text("Press 1 to Resume",100, 100);
     text("press 2 to Restart", 100, 150);
     hint(ENABLE_DEPTH_TEST);
     lights();
     popMatrix();
   }
  
  public void keyPressed() {
   println(keyCode);
   if (keyCode == 49 && menuOn == true){ //press 1 while menu is open to resume
     menuOn = false;
    }
   if (keyCode==50){
     restart();
   }
   if (keyCode==49 && menuOn == false){
     menuOn = true;
   }
  } 
    
  public void update(){
   //fill(255,120);
   //rect(0,0,width, height);
   
   if (menuOn == true){
     displayMenu();
   }
  }
   
}  
     
  

