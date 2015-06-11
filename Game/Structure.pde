import java.util.Iterator;

public abstract class Structure implements Collidable, Renderable {
  
  protected int x,y,z;
  protected int tall,deep,wide;
  protected int[][] branchP; //x,y,z,angle
  protected Random r = new Random(System.currentTimeMillis());
  public int branch = 0;
  public int direction = 0;
  
  public void update(){}
  
  public int x(){
    return x;
  }
  
  public int y(){
    return y;
  }
  
  public int z(){
    return z;
  }
  
  public int w(){
    return wide;
  }
  
  public int d(){
    return deep;
  }
  
  public int h(){
    return tall;
  }
  
  public boolean colliding(Collidable struct){
    return false;
  }
  
  public String toString(){
    return ""+x+" "+y+" "+z+" "+wide+" "+tall+" "+deep+"";
  }
  
}

class StNode implements Renderable{
  private Structure data;
  private int depth;
  private ArrayList<StNode> next;
  private StNode parent = this;
  
  public StNode(Structure n){
    this(n,null);
  }
  
  public StNode(Structure n, StNode pa){
    data = n;
    next = new ArrayList<StNode>();
    if(pa!=null)
      parent = pa;
    //depth = d;
  }
  
  public ArrayList<StNode> getNextList(){
      return next;
  }

  public void addNext(Structure n){
    StNode d = new StNode(n,this);
    next.add(d);
  }

  public StNode getParent(){
      return parent;
  }

  public void set(Structure n){
      data = n;
  }
  
  public Structure get(){
    return data;
  }
  
  public void update(){
      data.update();
      for(StNode n : next){
        n.update();
      }
      
  }
  
  public int getDepth(){
      return depth;
  }
  
  public void setDepth(int d){
      d = depth;
  }
  
  public void add(Random r){
    if(next.size()==0){
      for(int i=0;i<data.branch;i++){
        System.out.println(data.branch);
        int n = r.nextInt(5);
        if(n==0){
            addNext(new Hallway(data.branchP[i][0],0,data.branchP[i][2],-1,-1,-1,(data.direction+data.branchP[i][3])%4));
          } else {
            addNext(new Room(data.branchP[i][0],0,data.branchP[i][2],-1,-1,-1,(data.direction+data.branchP[i][3])%4));
          }
        }
      }
    }
  }

class StTree implements Renderable{
  private StNode origin;
  private StNode current;
  Random r = new Random();
  
  public StTree(){
    origin = new StNode(new Hallway(-100,0,100,-1,-1,-1));
    current = origin;
    current.add(r);
  }
  
  public void update(){
    if (player.colliding(current.get())){
      System.out.println("true");
    } else {
      System.out.println("false");
    }
    if(!player.inside(current.get())){
      arrows.clear();
      if(player.inside(current.getParent().get())==true){
        current = current.getParent();
      } else {
        for(StNode n : current.getNextList()){
          if(player.inside(n.get())){
            current = n;
            System.out.println("yes");
          }
        }
      }
      current.add(r); // cost saving measure
    }
    for(Arrow a : arrows){
      a.update(current.get());
    }
    origin.update();
  }
}
