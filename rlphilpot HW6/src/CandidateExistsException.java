public class CandidateExistsException extends Exception {
    private static String candidate;

    public CandidateExistsException(String candidate) {
        this.candidate = candidate;
    }
}
