public class World implements Renderable{
  StTree map;
  Player player;
  ArrayList<Arrow> arrows;
  ArrayList<Objecty> objects;
  
  public World(){
    player = new Player();
    map = new StTree();
    arrows = new ArrayList<Arrow>();
    objects = new ArrayList<Objecty>();
  }
  
  public void update(){
    StNode n = map.checkLocation(player);
    if(n!=map.current){
      Random r = new Random();
      n.add(r);
      Structure s = n.getNextList().get(0).get();
      objects.clear();
      objects.add(new Objecty(s.x()+r.nextFloat()*s.w(),s.y()+r.nextFloat()*s.h(),s.z()+r.nextFloat()*s.d(),100,0,0,0,n));
      arrows.clear();
    }
    map.current = n;
    map.update();
    for(Arrow a : arrows){
      if(!a.dead){
      arrowCheck(map.checkLocation(a,a.lastLocation),a);
      for(Objecty o : objects){
        if(!o.dead && a.lastLocation == o.lastLocation){
          if(a.colliding2(o.hitbox)){
            o.dead = true;
            player.incScore();
          }
        }
      }
      }
      a.update();
    }
    for(Objecty o : objects){
      if(!o.dead){
        objectCheck(map.checkLocation(o,o.lastLocation),o);
        o.update();
      }
    }
    player.update();
    playerCheck(player,n);
    player.see();
    /*if(player.colliding(map.current.get())){
      System.out.println("true");
    } else {
      System.out.println("false");
    }*/
    //System.out.println(map.current.get()+"&"+player.hitbox.x+" "+player.hitbox.z+" "+player.hitbox.wide+" "+player.hitbox.deep);
    //System.out.println(map.current.get()
  }
  
  public boolean arrowCheck(StNode n, Arrow a){
    for(Door d : n.get().getDoors()){
      if(a.colliding2(d)){
        System.out.println("yes door");
        a.move();
        a.wasAtDoor=true;
        return true;
      }
    }
    if(!a.dead && a.colliding(n.get())){
      a.lastLocation = n;
      a.move();
      return true;
    } else {
      a.dead = true;
      if(a.wasAtDoor){
        a.move();
        a.wasAtDoor = false;
      }
      return false;
    }
  }
  
  public void objectCheck(StNode n, Objecty o){
    if(o.colliding(n.get())){
      o.lastLocation = n;
      o.move();
      return;
    } else {
      o.adjust(n.get());
    }
  }
  
  public void playerCheck(Player player, StNode n){
    for(Door d : n.get().getDoors()){
      if(player.colliding2(d)){
        player.wasAtDoor = true;
        return;
      }
    }
    for(Door d : n.getParent().get().getDoors()){
      if(player.colliding2(d)){
       player.wasAtDoor = true;
        return;
      }
    }
    if(!player.wasAtDoor){
      player.adjustX(n.get().x(),n.get().w());
      player.adjustZ(n.get().z(),n.get().d());
    } else {
      /*for(Door d : n.get().getDoors()){
        if(player.colliding2(d)){
          System.out.println("got nails");
          return;
        }*/
    }
      player.wasAtDoor = false;
  }
  
  
  public void mousemove(){
    player.mousemove();
  }
  
  public void launch(){
    arrows.add(0,player.launch());
    arrows.get(0).lastLocation = map.current;
  }

}


