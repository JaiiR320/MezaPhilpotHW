public class FinalResult{
    ShootingResult shootingResult;
    SkiingResult skiingResult;


    public FinalResult(ShootingResult shootingResult, SkiingResult skiingResult) {
        this.shootingResult = (shootingResult);
        this.skiingResult = (skiingResult);
    }
    public double finalScore(){
        switch (this.skiingResult.place){
            case 1:
                return (shootingResult.getPenalties() + shootingResult.pointsEarned() + skiingResult.getPenalties() + skiingResult.pointsEarned() - 10);
            case 2:
                return (shootingResult.getPenalties() + shootingResult.pointsEarned() + skiingResult.getPenalties() + skiingResult.pointsEarned() - 7);
            case 3:
                return (shootingResult.getPenalties() + shootingResult.pointsEarned() + skiingResult.getPenalties() + skiingResult.pointsEarned() - 3);
            case 4:
                return (shootingResult.getPenalties() + shootingResult.pointsEarned() + skiingResult.getPenalties() + skiingResult.pointsEarned() - 1);
            default:
                return (shootingResult.getPenalties() + shootingResult.pointsEarned() + skiingResult.getPenalties() + skiingResult.pointsEarned());
        }
    }
}

