public class Interface{
  
  int time;
  int score;
  int arrows;
  
  public Interface(){
  }
  
  public void update(){
    pushMatrix();
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    
    //add update function
    
    hint(ENABLE_DEPTH_TEST);
    lights();
    popMatrix();
  }  
  
}
