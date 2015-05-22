public abstract class Structure implements Collidable, Renderable {
  
  public boolean colliding(Collidable struct){
    
  }
}

class TNode<E> {
  private E data;
  private int depth;
  private ArrayList<TNode<E>> next;
  private TNode<E> parent;
  
  public TNode(E n, int d){
    data = n;
    depth = d;
  }
  
  public ArrayList<TNode<E>> getNextList(){
      return next;
  }

  public void addNext(E n){
    TNode<E> d = new TNode<E>(n,depth+1);
    next.add(d);
  }

  public TNode<E> getParent(){
      return parent;
  }

  public void set(E n){
      data = n;
  }
  
  public E get(){
    return data;
  }
  
  public int getDepth(){
      return depth;
  }
  
  public boolean trim(int d){
    if(d<=depth){
        return true;
    } else {
      Iterator it = next.iterator();
      while(it.hasNext()){
        if(it.next().trim()){
          it.remove();
        }
      }
    }
    return false;
  }
  
}

class Trees<E> {
  TNode<E> root;
  
  public Trees(E n){
    root = new TNode<E>(n,0);
  }

}
