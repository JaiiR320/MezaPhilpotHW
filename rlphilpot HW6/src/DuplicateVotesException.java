public class DuplicateVotesException extends Exception {
    private static String candidate;

    public DuplicateVotesException(String candidate) {
        this.candidate = candidate;
    }

    public String getCandidate() {
        return candidate;
    }
}
