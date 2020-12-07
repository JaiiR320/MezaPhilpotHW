import java.util.Hashtable;
import java.util.LinkedList;
import java.util.Scanner;

class ElectionData {
    private LinkedList<String> ballot = new LinkedList<String>();

    private Hashtable<String, Integer> firstChoice = new Hashtable<>();
    private Hashtable<String, Integer> secondChoice = new Hashtable<>();
    private Hashtable<String, Integer> thirdChoice = new Hashtable<>();

    Scanner keyboard = new Scanner(System.in);

    ElectionData() {
    }

    public String findWinnerMostFirstVotes() {
        double voteCount = 0;
        for(String key: ballot){
            voteCount += firstChoice.get(key);
        }
        for (String key: ballot) {
            if (firstChoice.get(key)/voteCount > 0.5) {
                return key;
            }
        }
        return "Runoff required";
    }

    public String findWinnerMostPoints() {
        int max = 0, sum = 0;
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

            System.out.println("You voted for " + candidate1 + candidate2 + candidate3);
    }

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

    public void printBallot() {
        System.out.println("The candidates are ");
        for (String s : ballot) {
            System.out.println(s);
        }
    }

    public int addCount(String key, Hashtable<String, Integer> votes) {
        return votes.get(key)+1;
    }
}
