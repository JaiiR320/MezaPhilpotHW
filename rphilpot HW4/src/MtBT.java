class MtBT implements IBinTree {
    MtBT(){}

    // returns false since empty tree has no elements
    public boolean hasElt(int e) {
        return false;
    }

    // returns 0 since enpty tree has no elements
    public int size() {
        return 0;
    }

    // returns 0 since empty tree has no branches
    public int height() {
        return 0;
    }

    public boolean isHeap(int e){
        return true;
    }


    public boolean contains(IBinTree hAdded) {
        return true;
    }


    public boolean addEltTester(IHeap hOrig, int elt, IBinTree hAdded) {
        return true;
    }
}