/**
 * FinalResult
 */

public class FinalResult {
    public ShootingResult shoot = new ShootingResult();
    public SkiingResult ski = new SkiingResult();

    /**
     * Gets the base score of the athlete
     * @return double
     */
    private double baseScore(){
        return ski.pointsEarned()+ski.getPenalties()+shoot.getPenalties();
    }

    public double finalScore(){
        switch (ski.position) {
            case 1:
                return baseScore()-10;
            case 2:
                return baseScore()-7;
            case 3:
                return baseScore()-3;
            case 4:
                return baseScore()-1;
            default:
                return baseScore();
        }
    }
}
