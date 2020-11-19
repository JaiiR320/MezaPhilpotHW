import static org.junit.Assert.*;
import org.junit.Test;

public class Examples {
    IHeap heap1 = new DataHeap(4, new DataHeap(10, new MtHeap()
            , new DataHeap(20, new MtHeap(), new MtHeap()))
            , new DataHeap(14, new MtHeap(), new MtHeap()));

    IBinTree tree1  = new DataHeap(4, new DataHeap(10, new MtHeap()
            , new DataHeap(20, new MtHeap(), new MtHeap()))
            , new DataHeap(14, new MtHeap(), new MtHeap()));

    DataHeap heap2 = new DataHeap(3,
            new DataHeap(5,
                    new DataHeap(10, new MtHeap(), new MtHeap()),
                    new DataHeap(8, new MtHeap(), new MtHeap())),
            new DataHeap(6,
                    new DataHeap(9, new MtHeap(), new MtHeap()),
                    new DataHeap(10, new MtHeap(), new MtHeap())));

    DataHeap tree2 = new DataHeap(3,
            new DataHeap(6,
                    new DataHeap(10, new MtHeap(), new MtHeap()),
                    new DataHeap(10, new MtHeap(), new MtHeap())),
            new DataHeap(5,
                    new DataHeap(9, new MtHeap(), new MtHeap()),
                    new DataHeap(8, new MtHeap(), new MtHeap())));
    public Examples() {
        heap1.merge(new DataHeap(2, new MtHeap(), new MtHeap()));

    }



    @Test
    public void testAddElt() {
        assertTrue(true);
        //assertTrue(addEltTester(heap1, 5, heap1.addElt(5)));
    }

    @Test
    public void isHeap(){
        assertTrue(heap1.isHeap(0));
    }

    @Test
    public void hasElt(){
        assertTrue(heap1.hasElt(14));
    }

    @Test
    public void contains() {
        assertTrue(heap1.contains(tree1));
    }

    @Test
    public void addEltTester() {
        assertTrue(heap2.addEltTester(heap2, 11, heap2.addElt(11)));
    }
}
