import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedList;

class ElectionData {
    private LinkedList<String> ballot = new LinkedList<String>();

    private HashMap<String, Integer> firstChoice = new HashMap<>();
    private HashMap<String, Integer> secondChoice = new HashMap<>();
    private HashMap<String, Integer> thirdChoice = new HashMap<>();

    ElectionData() {
    }

    /**
     * Finds the winner of election based on the peoples first choice
     * @return the name of the candidate that won or "Runoff required" if it is a tie.
     */
    public String findWinnerMostFirstVotes() {
        double voteCount = 0;
        for(String key: ballot){
            voteCount += firstChoice.get(key);
        }
        for (String key: ballot) {
            if (voteCount != 0 && firstChoice.get(key)/voteCount > 0.5) {
                return key;
            }
        }
        return "Runoff required";
    }

    /**
     * Finds the winner of election based on the point system (3 points for first choice, 2 points for second choice, 1 point for third choice)
     * @return the name of the candidate that won
     */
    public String findWinnerMostPoints() {
        int max = 0; 
        int sum = 0;
        String winner = ballot.get(0);
        for (String key: ballot) {
            sum += firstChoice.get(key)*3;
            sum += secondChoice.get(key)*2;
            sum += thirdChoice.get(key);

            if (sum > max) {
                max = sum;
                winner = key;
            }
            sum = 0;
        }
        return winner;
    }

    /**
     * Stores a single voters choice in the data structure
     * @param candidate1 name of the candidate for voters first choice
     * @param candidate2 name of the candidate for voters second choice
     * @param candidate3 name of the candidate for voters second choice
     * @throws UnknownCandidateException thrown if ballot does not contain a candidate the user voted for
     * @throws DuplicateVotesException thrown if voter voted for a candidate more than once
     */
    public void processVote(String candidate1, String candidate2, String candidate3) throws UnknownCandidateException, DuplicateVotesException{
        if (!(ballot.contains(candidate1))) {
            throw new UnknownCandidateException(candidate1);
        }
        if (!(ballot.contains(candidate2))) {
            throw new UnknownCandidateException(candidate2);
        }
        if (!(ballot.contains(candidate3))) {
            throw new UnknownCandidateException(candidate3);
        }
        if (candidate1.equals(candidate2)) {
            throw new DuplicateVotesException(candidate1);
        }
        if (candidate1.equals(candidate3)) {
            throw new DuplicateVotesException(candidate1);
        }
        if (candidate2.equals(candidate3)) {
            throw new DuplicateVotesException(candidate2);
        }

        firstChoice.put(candidate1, addCount(candidate1, firstChoice));
        secondChoice.put(candidate2, addCount(candidate2, secondChoice));
        thirdChoice.put(candidate3, addCount(candidate3, thirdChoice));

        System.out.println("You voted for: " + candidate1 + ", " + candidate2 + ", " + candidate3);
    }

    /**
     * adds a candidates name to the ballot
     * @param candidate name of candidate to be added to ballot
     * @throws CandidateExistsException thrown if the candidates name already exists in the ballot
     */
    public void addCandidate(String candidate) throws CandidateExistsException {
            if (ballot.contains(candidate)) {
                throw new CandidateExistsException(candidate);
            }
            else {
                ballot.add(candidate);
                firstChoice.put(candidate, 0);
                secondChoice.put(candidate, 0);
                thirdChoice.put(candidate, 0);
            }
    }

    /**
     * prints the names of candidates on the ballot
     */
    public void printBallot() {
        System.out.println("The candidates are ");
        for (String s : ballot) {
            System.out.println(s);
        }
    }

    /**
     * adds a vote to the candidate the voter voted for
     * @param key name of the candidate the voter voted for
     * @param votes the hashtable based on what choice the candidate was
     * @return the number of votes the candidate now has
     */
    public int addCount(String key, HashMap<String, Integer> votes) {
        return votes.get(key)+1;
    }
}
