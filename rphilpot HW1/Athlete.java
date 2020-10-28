public class Athlete {
    FinalResult finalResult;
    public Athlete(FinalResult finalResult){
        this.finalResult = (finalResult);
    }
    public boolean betterSkier(Athlete athlete){
        return (this.finalResult.skiingResult.pointsEarned() > athlete.finalResult.skiingResult.pointsEarned());
    }
    public boolean betterShooter(Athlete athlete){
        return (this.finalResult.shootingResult.pointsEarned() > athlete.finalResult.shootingResult.pointsEarned());
    }
    public boolean hasBeaten(Athlete athlete){
       return (betterSkier(athlete) || betterShooter(athlete));
    }
}
