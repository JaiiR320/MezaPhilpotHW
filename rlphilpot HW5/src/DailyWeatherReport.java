import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.LinkedList;

public class DailyWeatherReport {
    private GregorianCalendar date;
    private LinkedList<Double> temp;
    private LinkedList<Double> rainfall;

    public DailyWeatherReport(GregorianCalendar date, LinkedList<Double> temp, LinkedList<Double> rainfall) {
        this.date = date;
        this.temp = temp;
        this.rainfall =rainfall;
    }

    public double getAvgTemp(){
        double sum = 0;
        if (temp.isEmpty()) {
            return 0;
        }
        for (Double d : temp) {
            sum += d;
        }
        return sum/(double)temp.size();
    }

    public boolean sameDate(int month, int year) {
        return (date.get(Calendar.MONTH) == month && date.get(Calendar.YEAR) == year);
    }

    public LinkedList<Double> getRainfall() {
        return rainfall;
    }

}
