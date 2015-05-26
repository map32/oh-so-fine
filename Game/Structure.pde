import java.util.Iterator;

public abstract class Structure implements Collidable, Renderable {
  
  protected int tall,deep,wide;
  
  public void update(){}
  
  public boolean colliding(Collidable struct){
    return false;
  }
}

class TNode<E> implements Renderable{
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
  
  public void update(){
      ((Renderable)data).update();
  }
  
  public int getDepth(){
      return depth;
  }
  
  public void setDepth(int d){
      d = depth;
  }
  
  public boolean trim(int d){
    if(d<=depth){
        return true;
    } else {
      Iterator it = next.iterator();
      while(it.hasNext()){
        if(((TNode<E>)it.next()).trim(d+1)){
          it.remove();
        }
      }
    }
    return false;
  }
  
}
