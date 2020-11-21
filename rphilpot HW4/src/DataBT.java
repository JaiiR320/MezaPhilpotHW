class DataBT implements IBinTree {
    int data;
    IBinTree left;
    IBinTree right;

    DataBT(int data, IBinTree left, IBinTree right) {
        this.data = data;
        this.left = left;
        this.right = right;
    }

    // an alternate constructor for when both subtrees are empty
    DataBT(int data) {
        this.data = data;
        this.left = new MtBT();
        this.right = new MtBT();
    }

    // determines whether this node or node in subtree has given element
    public boolean hasElt(int e) {
        return this.data == e || this.left.hasElt(e) || this.right.hasElt(e) ;
    }

    // adds 1 to the number of nodes in the left and right subtrees
    public int size() {
        return 1 + this.left.size() + this.right.size();
    }

    // adds 1 to the height of the taller subtree
    public int height() {
        return 1 + Math.max(this.left.height(), this.right.height());
    }

    public int countElt(int e){
        if(data == e){
            return 1 + left.countElt(e) + right.countElt(e);
        } else {
            return left.countElt(e) + right.countElt(e);
        }
    }

    //checks to see if heap is valid
    public boolean isSmaller(int e) {
        return e <= data && this.left.isSmaller(data) && this.right.isSmaller(data);
    }
    public boolean isHeap(){
        return this.left.isSmaller(data) && this.right.isSmaller(data);
    }

    public boolean checkOccurence(IHeap hOrig, int elt, IBinTree hAdded){
        int orignial = hOrig.countElt(data);
        int after = hAdded.countElt(data);
        if(hOrig.addElt(elt)){
        
        }

    }

    public boolean contains(IBinTree hAdded) {
        return hAdded.hasElt(data) && this.left.contains(hAdded) && this.right.contains(hAdded);
    }
}