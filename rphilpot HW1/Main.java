public class Main {
    public static void main(String[] args) {
        Athlete rob = new Athlete (new FinalResult(new ShootingResult(new ShootingRound(0), new ShootingRound(0), new ShootingRound(0), new ShootingRound(0)), new SkiingResult(5, 145.32,143.2, 155.43, 180.01, 0)));
        Athlete jair = new Athlete (new FinalResult(new ShootingResult(new ShootingRound(5), new ShootingRound(5), new ShootingRound(5), new ShootingRound(5)), new SkiingResult(1,120, 122.23, 118.76, 148.23,2)));
        Athlete cather = new Athlete (new FinalResult(new ShootingResult(new ShootingRound(3), new ShootingRound(3), new ShootingRound(3), new ShootingRound(3)), new SkiingResult(4, 122.12, 126.65, 130.55, 167.31, 1)));

        System.out.println("SKIING GET PENALTIES");
        System.out.println(rob.finalResult.skiingResult.getPenalties());
        System.out.println(jair.finalResult.skiingResult.getPenalties());
        System.out.println(cather.finalResult.skiingResult.getPenalties());

        System.out.println("SKIING POINTS EARNED");
        System.out.println(rob.finalResult.skiingResult.pointsEarned());
        System.out.println(jair.finalResult.skiingResult.pointsEarned());
        System.out.println(cather.finalResult.skiingResult.pointsEarned());

        System.out.println("SHOOTING GET PENALTIES");
        System.out.println(rob.finalResult.shootingResult.getPenalties());
        System.out.println(jair.finalResult.shootingResult.getPenalties());
        System.out.println(cather.finalResult.shootingResult.getPenalties());

        System.out.println("SHOOTING POINTS EARNED");
        System.out.println(rob.finalResult.shootingResult.pointsEarned());
        System.out.println(jair.finalResult.shootingResult.pointsEarned());
        System.out.println(cather.finalResult.shootingResult.pointsEarned());

        System.out.println("FINAL RESULTS FINAL SCORE");
        System.out.println(rob.finalResult.finalScore());
        System.out.println(jair.finalResult.finalScore());
        System.out.println(cather.finalResult.finalScore());

        System.out.println("ATHLETE BETTER SKIER");
        System.out.println(rob.betterSkier(jair));
        System.out.println(rob.betterSkier(cather));
        System.out.println(jair.betterSkier(rob));
        System.out.println(jair.betterSkier(cather));
        System.out.println(cather.betterSkier(rob));
        System.out.println(cather.betterSkier(jair));

        System.out.println("ATHLETE BETTER SHOOTER");
        System.out.println(rob.betterShooter(jair));
        System.out.println(rob.betterShooter(cather));
        System.out.println(jair.betterShooter(rob));
        System.out.println(jair.betterShooter(cather));
        System.out.println(cather.betterShooter(rob));
        System.out.println(cather.betterShooter(jair));

        System.out.println("ATHLETE HAS BEATEN");
        System.out.println(rob.hasBeaten(jair));
        System.out.println(rob.hasBeaten(cather));
        System.out.println(jair.hasBeaten(rob));
        System.out.println(jair.hasBeaten(cather));
        System.out.println(cather.hasBeaten(rob));
        System.out.println(cather.hasBeaten(jair));
    }
}
