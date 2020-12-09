// Kanyeert Philpot      rlphilpot
// Jair Meza           jdmeza

import org.junit.Test;
import java.util.LinkedList;
import static org.junit.Assert.*;

public class Examples {
    ElectionData ED = new ElectionData();

    ElectionData Setup1 () {

        ElectionData ED1 = new ElectionData();

        // add candidates to the ballot
        try {
            ED1.addCandidate("Plankton");
            ED1.addCandidate("doofenshmirtz");
            ED1.addCandidate("Lincoln");
            ED1.addCandidate("Washington");
            ED1.addCandidate("Kanye");

        } catch (Exception e) {}

        // cast votes

        try {
            ED1.processVote("Lincoln", "Plankton", "Kanye");
            ED1.processVote("Washington", "Husky", "Kanye");
            ED1.processVote("Plankton", "Husky", "Washington");
            ED1.processVote("Lincoln", "doofenshmirtz", "Kanye");
            ED1.processVote("Lincoln", "doofenshmirtz", "Plankton");
            ED1.processVote("Plankton", "Washington", "Kanye");
            // Lincoln: 9   Plankton: 9 Kanye: 4    doofenshmirtz: 4    Washington: 6
        } catch (Exception e) {}

        return(ED1);
    }

    ElectionData Setup2 () {

        ElectionData ED = new ElectionData();

        // put candidates on the ballot
        try {

            ED.addCandidate("Plankton");
            ED.addCandidate("husky");
            ED.addCandidate("doofenshmirtz");

        } catch (Exception e) {}

        // cast votes

        try {

            ED.processVote("Plankton", "husky", "doofenshmirtz");
            ED.processVote("Plankton", "doofenshmirtz", "husky");
            ED.processVote("Plankton", "husky", "doofenshmirtz");
            // Plankton: 9  husky: 5    doofenshmirtz: 4
        } catch (Exception e) {}

        return(ED);
    }


    ElectionData Setup3 () {

        ElectionData ED = new ElectionData();

        // put candidates on the ballot
        try {

            ED.addCandidate("Plankton");
            ED.addCandidate("husky");
            ED.addCandidate("doofenshmirtz");
            ED.addCandidate("RickyBobby");

        } catch (Exception e) {}

        // cast votes

        try {

            ED.processVote("Plankton", "RickyBobby", "doofenshmirtz");
            ED.processVote("doofenshmirtz", "Plankton", "husky");
            ED.processVote("RickyBobby", "Plankton", "RickyBobby");
            // husky: 1 Plankton: 5 RickyBobby: 2   doofenshmirtz: 4
        } catch (Exception e) {}

        return(ED);
    }

    @Test
    public void testMostFirstWinnerSetup1() {
        assertEquals("Lincoln", Setup1().findWinnerMostFirstVotes());
    }
    @Test
    public void testMostFirstWinnerSetup2 () {
        assertEquals ("Plankton", Setup2().findWinnerMostFirstVotes());
    }

    @Test
    public void testFirstWinnerTieSetup3() {
        assertTrue(Setup3().findWinnerMostFirstVotes().equals("Runoff required"));
    }

    @Test
    public void testMostPointWinnerTieSetup1() {
        LinkedList<String> winners = new LinkedList<>();
        winners.add("Lincoln");
        winners.add("Plankton");
        assertTrue (winners.contains(Setup1().findWinnerMostPoints()));
    }

    @Test
    public void testMostPointWinnerSetup2() {
        assertEquals ("Plankton", Setup2().findWinnerMostPoints());
    }

    @Test
    public void testMostPointWinnerSetup3() {
        assertEquals ("Plankton", Setup3().findWinnerMostPoints());
    }

    @Test(expected = CandidateExistsException.class)
    public void testAddExistingCandidate() throws CandidateExistsException
    {
        ElectionData ED = new ElectionData();
        ED.addCandidate("Lincoln");
        ED.addCandidate("Lincoln");
    }

    @Test(expected = UnknownCandidateException.class)
    public void testUnknownCandidate() throws UnknownCandidateException, DuplicateVotesException, CandidateExistsException {
        ElectionData ED = new ElectionData();
        ED.addCandidate("Lincoln");
        ED.addCandidate("Husky");
        ED.processVote("Lincoln", "Husky", "Washington");
    }

    @Test(expected = DuplicateVotesException.class)
    public void testDuplicateCandidate() throws UnknownCandidateException, DuplicateVotesException, CandidateExistsException {
        ElectionData ED = new ElectionData();
        ED.addCandidate("Lincoln");
        ED.addCandidate("Husky");
        ED.processVote("Lincoln", "Husky", "Lincoln");
    }
}
