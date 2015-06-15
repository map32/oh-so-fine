public class Interface{
  
  public Interface(){
  }
  
  public void lose(int score, int arrow){
    pushMatrix();
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    fill(255,255,255);
    text("You Lost", width/2,height/2-120);
    text(Integer.toString(score), width/2, height/2);
    hint(ENABLE_DEPTH_TEST);
    lights();
    popMatrix();
  }
  
  public void update(int score, int arrow){
    pushMatrix();
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    
    text(60-(millis() * 1000)+"s", width/2, 40);
    text(score, 40, 40);
    text(arrow, 40, 80);
    
    hint(ENABLE_DEPTH_TEST);
    lights();
    popMatrix();
  }  
  
}
