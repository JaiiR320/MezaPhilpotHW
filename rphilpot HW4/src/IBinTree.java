interface IBinTree {
    // determines whether element is in the tree
    boolean hasElt(int e);

    // returns number of nodes in the tree; counts duplicate elements as separate items
    int size();

    // returns depth of longest branch in the tree
    int height();

    // determines if tree is a valid heap
    boolean isSmaller(int data);

    int countElt(int e);
}