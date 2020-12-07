public class UnknownCandidateException extends Exception {
    private static String candidate;

    public UnknownCandidateException(String candidate) {
       this.candidate = candidate;
    }

    public static String getCandidate() {
        return candidate;
    }
}
