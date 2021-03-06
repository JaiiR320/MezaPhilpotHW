import java.util.Scanner;

public class VotingMachine {
    private Scanner keyboard = new Scanner(System.in);
    private ElectionData electionData;

    public VotingMachine(ElectionData electionData) {
        this.electionData = electionData;
    }

    /**
     * the user interface to vote
     */
    public void screen() {
        electionData.printBallot();

        System.out.println("Who do you want to vote for?");
        String candidate1 = keyboard.next();
        String candidate2 = keyboard.next();
        String candidate3 = keyboard.next();

        try {
            electionData.processVote(candidate1, candidate2, candidate3);
        }
        catch (UnknownCandidateException e) {
            System.out.println(e.getCandidate() + " currently does not exist. Would you like to add this candidate to the ballot?");
            System.out.println("Enter 'Y' or 'y' for yes");
            String ans = keyboard.next();
            if (ans.equals("Y") || ans.equals("y")) {
                addWriteIn(UnknownCandidateException.getCandidate());
                screen();
            }
            else electionData = new ElectionData();
        }
        catch (DuplicateVotesException e) {
            System.out.println("You may not vote for a candidate more than once!");
            screen();
        }
    }

    /**
     * adds new candidate to the ballot
     * @param candidate candidate voter wishes to add to the ballot
     */
    private void addWriteIn(String candidate) {
        try {
            electionData.addCandidate(candidate);
        }
        catch (CandidateExistsException e) {
            System.out.println("Candidate already exists");
        }
        System.out.println("Successful");
    }
}
