public class World implements Renderable{
  StTree map;
  Player player;
  ArrayList<Arrow> arrows;
  
  public World(){
    player = new Player();
    map = new StTree();
    arrows = new ArrayList<Arrow>();
  }
  
  public void update(){
    StNode n = map.checkLocation(player);
    if(n!=map.current){
      n.add(new Random());
      arrows.clear();
    }
    map.current = n;
    map.update();
    
    for(Arrow a : arrows){
      arrowCheck(map.current,a);
      a.update();
    }
    player.update();
    /*if(player.colliding(map.current.get())){
      System.out.println("true");
    } else {
      System.out.println("false");
    }*/
  }
  
  public boolean arrowCheck(StNode n, Arrow a){
    for(Door d : n.get().getDoors()){
      if(a.colliding(d)){
        System.out.println("yes door");
        a.move();
        a.wasAtDoor=true;
        return true;
      }
    }
    if(a.colliding(n.get())){
      a.move();
      return true;
    } else {
      if(a.wasAtDoor){
        System.out.println("yes door");
        a.move();
        a.wasAtDoor = false;
        System.out.println(map.checkLocation(a)==map.current);
        arrowCheck(map.checkLocation(a),a);
      }
      return false;
    }
  }
  
  public void mousemove(){
    player.mousemove();
  }
  
  public void launch(){
    arrows.add(player.launch());
  }

}


