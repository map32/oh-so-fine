public class Menu{
  
  boolean menuOn = false;
  
   public void displayMenu() {
     menuOn = true;
     fill(0,0,0,100);
     rect(50,50, width-100, height-100);
     fill(255);
     text("Press 1 to Resume",100, 100);
     text("press 2 to Restart", 100, 150);
   }
  
  public void keyPressed() {
   println(keyCode);
   if (keyCode == 49 && menuOn == true){ //press 1 while menu is open to resume
    menuOn = false;
    }
   if (keyCode==50){
    restart();
   }
   if (keyCode==77 && menuOn == false){
     menuOn = true;
  }
  } 
    
  public void draw(){
   fill(255,120);
   rect(0,0,width, height);
   
   if (menuOn = true){
     displayMenu();
   }else{
     world.update();
   }
  }
   
}  
     
  

