// Baohui Zhang      bzhang7
// Haopeng Wang      hwang15

import org.junit.Test;
import java.util.LinkedList;
import static org.junit.Assert.*;

public class Examples {
    public Examples(){};
    ElectionData ED = new ElectionData();

    ElectionData Setup1 () {

        ElectionData ED1 = new ElectionData();

        // put candidates on the ballot
        try {
            ED1.addCandidate("Cather");
            ED1.addCandidate("John");
            ED1.addCandidate("Rob");
            ED1.addCandidate("Gompei");
            ED1.addCandidate("Husky");
        } catch (Exception e) {}

        // cast votes

        try {
            ED1.processVote("Cather", "John", "Rob");
            ED1.processVote("Cather", "John", "Gompei");
            ED1.processVote("Cather", "John", "Rob");
            ED1.processVote("Cather", "John", "Rob");
            ED1.processVote("John", "Husky", "Rob");
            ED1.processVote("Gompei", "Husky", "John");
            //Cather: 12  John: 12  Gompei: 4 Husky: 4  Rob: 4
        } catch (Exception e) {}

        return(ED1);
    }

    ElectionData Setup2 () {

        ElectionData ED = new ElectionData();

        // put candidates on the ballot
        try {

            ED.addCandidate("gompei");
            ED.addCandidate("husky");
            ED.addCandidate("ziggy");

        } catch (Exception e) {}

        // cast votes

        try {

            ED.processVote("gompei", "husky", "ziggy");
            ED.processVote("gompei", "ziggy", "husky");
            ED.processVote("husky", "gompei", "ziggy");

        } catch (Exception e) {}

        return(ED);
    }


    ElectionData Setup3 () {

        ElectionData ED = new ElectionData();

        // put candidates on the ballot
        try {

            ED.addCandidate("gompei");
            ED.addCandidate("husky");
            ED.addCandidate("ziggy");

        } catch (Exception e) {}

        // cast votes

        try {

            ED.processVote("gompei", "husky", "ziggy");
            ED.processVote("ziggy", "gompei", "husky");
            ED.processVote("husky", "gompei", "ziggy");

        } catch (Exception e) {}

        return(ED);
    }
    @Test
    public void testMostFirstWinner () {
        assertEquals ("gompei", Setup2().findWinnerMostFirstVotes());
    }

    @Test
    public void testFirstWinnerTie() {
        assertTrue(Setup3().findWinnerMostFirstVotes().equals("Runoff required"));
    }

    @Test
    public void testMostPointWinner() {
        assertEquals ("gompei", Setup2().findWinnerMostPoints());
    }

    @Test
    public void testMostPointWinner2() {
        assertEquals ("gompei", Setup3().findWinnerMostPoints());
    }

    @Test
    public void testTieWinners() {
        LinkedList<String> winners = new LinkedList<>();
        winners.add("Cather");
        winners.add("John");
        assertTrue (winners.contains(Setup1().findWinnerMostPoints()));
    }

    @Test(expected = CandidateExistsException.class)
    public void testAddExistedCandidate() throws CandidateExistsException
    {
        ED.addCandidate("Cather");
        ED.addCandidate("Cather");
    }

    @Test(expected = UnknownCandidateException.class)
    public void testUnknownCandidate() throws UnknownCandidateException, DuplicateVotesException, CandidateExistsException {
        ED.addCandidate("Cather");
        ED.addCandidate("Husky");
        ED.processVote("Cather", "Husky", "John");
    }

    @Test(expected = DuplicateVotesException.class)
    public void testDuplicateCandidate() throws UnknownCandidateException, DuplicateVotesException, CandidateExistsException {
        ED.addCandidate("Cather");
        ED.addCandidate("Husky");
        ED.processVote("Cather", "Husky", "Cather");
    }

}
