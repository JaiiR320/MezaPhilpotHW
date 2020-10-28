/**
 * Athlete
 */

public class Athlete {
    public FinalResult result = new FinalResult();
    
    public boolean betterSkiier(Athlete a){
        if (a.result.ski.pointsEarned() > this.result.ski.pointsEarned()) {
            return true;
        } else {
            return false;
        }
    }
    public boolean betterShooter(Athlete a){
        if (a.result.shoot.pointsEarned() < this.result.shoot.pointsEarned()) {
            return true;
        } else {
            return false;
        }
    }
    public boolean hasBeaten(Athlete a){
        if (betterShooter(a) || betterSkiier(a)) {
            return true;
        } else {
           return false; 
        }
    }
}
