import java.util.GregorianCalendar; 
import java.util.LinkedList;
/**
 * WeatherMonitor
 */
public class WeatherMonitor {
    private IList reports;

    public WeatherMonitor(IList list) {
        this.reports = list;
    }

    public double averageTempForMonth(int month, int year){
        LinkedList<DailyWeatherReport> parsed = reports.parseList(month, year);
        LinkedList<Double> avg = new LinkedList<>();
        double count = 0;
        
        for (DailyWeatherReport d : parsed) {
            avg.add(d.getAvgTemp());
        } 
        for (Double d : avg) {
            count += d;
        }
        if (!avg.isEmpty()) {
            return count/avg.size();
        }
        return 0;
    }

    public double totalRainfallForMonth(int month, int year){
        LinkedList<DailyWeatherReport> d = reports.parseList(month, year);
        double sum = 0;
        for (DailyWeatherReport daily : d) {
            sum += daily.getTotalRain();
        }
        return sum;
    }

    public void addDailyReport(GregorianCalendar date, LinkedList<Reading> readings){
        LinkedList<Double> temps = new LinkedList<>();
        LinkedList<Double> rain = new LinkedList<>();
        for (Reading r : readings) {
            rain.add(r.rain());
            temps.add(r.temp());
        }
        reports.addReport(new DailyWeatherReport(date, temps, rain));
    }
}   