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
  
  public boolean colliding(Structure struct){
    return false;
  }
  
  public String toString(){
    return ""+x+" "+y+" "+z+" "+wide+" "+tall+" "+deep+"";
  }
  
  public Door[] getDoors(){
    return null;
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
    next.add(0,d);
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
  
  public StTree(){
    origin = new StNode(new Hallway(-100,0,100,-1,-1,-1));
    current = origin;
    current.add(new Random());
  }
  
  public void update(){
    origin.update();
  }
  
  public StNode checkLocation(Collidable2 c){
    return checkLocation(c,current);
  }
  
  public StNode checkLocation(Collidable2 c, StNode n){
    if(!c.colliding(n.get())){
      if(c.colliding2(n.getParent().get())==true){
        return n.getParent();
      } else {
        for(StNode nn : n.getNextList()){
          if(c.colliding2(nn.get())){
            return nn;
          }
        }
      }
    }
    return n;
  }
}
