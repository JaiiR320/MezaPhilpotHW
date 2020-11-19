interface IBinTree {
    // determines whether element is in the tree
    boolean hasElt(int e);

    // returns number of nodes in the tree; counts duplicate elements as separate items
    int size();

    // returns depth of longest branch in the tree
    int height();

    // determines if tree is a valid heap
    boolean isHeap(int data);

    //determines if added has same numbers as original
    boolean contains(IBinTree hAdded);

    //tests adding element
    boolean addEltTester(IHeap hOrig, int elt, IBinTree hAdded);
}