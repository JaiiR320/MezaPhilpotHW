/**
 * ShootingResult
 * implements IEvent interface
 */

public class ShootingResult implements IEvent{
    public ShootingRound round1 = new ShootingRound();
    public ShootingRound round2 = new ShootingRound();
    public ShootingRound round3 = new ShootingRound();
    public ShootingRound round4 = new ShootingRound();

    @Override
    public double getPenalties(){
        return 60*(20-pointsEarned());
    }
    @Override
    public double pointsEarned(){
        return (round1.targets + round2.targets + round3.targets + round4.targets);
    }
    
    /**
     * Sets the number of targets hit for all 4 rounds
     * @param a - round 1
     * @param b - round 2
     * @param c - round 3
     * @param d - round 4
     */
    public void setRounds(int a, int b, int c, int d){
        this.round1.targets = a;
        this.round2.targets = b;
        this.round3.targets = c;
        this.round4.targets = d;
    }

    
}
