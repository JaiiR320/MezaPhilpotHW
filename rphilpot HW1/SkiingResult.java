public class SkiingResult implements IEvent{
    int place;
    double time1;
    double time2;
    double time3;
    double time4;
    int penalties;

    public SkiingResult(int place, double time1, double time2, double time3, double time4, int penalties) {
        this.place = place;
        this.time1 = time1;
        this.time2 = time2;
        this.time3 = time3;
        this.time4 = time4;
        this.penalties = penalties;
    }

    public double pointsEarned(){
        return (time1 + time2 + time3 + time4);
    }
    public double getPenalties(){
        return (5*penalties);
    }
}
