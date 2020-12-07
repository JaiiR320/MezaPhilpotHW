public class Main {
    public static void main(String[] args) throws Exception {
        ElectionData ed = new ElectionData();
        VotingMachine vm = new VotingMachine(ed);
        vm.screen();
    }
}
