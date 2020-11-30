import java.util.GregorianCalendar;
import java.util.LinkedList;

public class DailyWeatherReport {
    private GregorianCalendar date = new GregorianCalendar();
    private LinkedList<Double> temps = new LinkedList<>();
    private LinkedList<Double> rain = new LinkedList<>();

    public DailyWeatherReport(GregorianCalendar date, LinkedList<Double> temps, LinkedList<Double> rain){
        this.date = date;
        this.temps = temps;
        this.rain = rain;
    }

    /**
     * Checks if the DailyWeatherReport is the correct month and year
     * @param month the month
     * @param year the year
     * @return true if it is the correct month and year
     */
    public boolean sameMonthYear(int month, int year){
        return this.date.get(2) == month && this.date.get(1) == year;
    }

    /**
     * Gets the average temperature of the DailyWeatherReport
     * @return the average temperature
     */
    public double getAvgTemp(){
        double sum = 0;
        if (temps.isEmpty()) {
            return 0;
        }
        for (Double d : temps) {
            sum += d;
        }
        return sum/(double)temps.size();
    }

    /**
     * Gets the total rainfall for the day
     * @return the sum of the rainfall for the day
     */
    public double getTotalRain(){
        double sum = 0;
        if (rain.isEmpty()) {
            return 0;
        }
        for (Double d : rain) {
            sum += d;
        }
        return sum;
    }
}
