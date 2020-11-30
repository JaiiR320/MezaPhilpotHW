/**
 * Readings 
 */
public class Reading {
    private Time t;
    private double temp, rainSince;
    public Reading(Time t, double temp, double rain){
        this.t = t;
        this.temp = temp;
        this.rainSince = rain;
    }

    public double temp(){
        return temp;
    }
    public double rain(){
        return rainSince;
    }
}
