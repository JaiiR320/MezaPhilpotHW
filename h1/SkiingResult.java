/**
 * SkiingResult
 * implements IEvent interface
 */

public class SkiingResult implements IEvent {
    public int position;
    public int penalties;
    public double lap1;
    public double lap2;
    public double lap3;
    public double lap4;

    @Override
    public double getPenalties(){
        return (5*penalties);
    }
    @Override
    public double pointsEarned(){
        return lap1+lap2+lap3+lap4;
    }
    /**
     * Sets the lap times for each of the 4 laps
     * @param a - lap 1
     * @param b - lap 2
     * @param c - lap 3
     * @param d - lap 4
     */
    public void setLaps(double a, double b, double c, double d){
        this.lap1 = a;
        this.lap2 = b;
        this.lap3 = c;
        this.lap4 = d;
    }
}
    
