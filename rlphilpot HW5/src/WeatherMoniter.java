import java.util.GregorianCalendar;
import java.util.LinkedList;

public class WeatherMoniter {
    private IDailyWeatherReport dailyWeatherReport;

    public WeatherMoniter(IDailyWeatherReport dailyWeatherReport) {
        this.dailyWeatherReport = dailyWeatherReport;
    }
    public double averageTempForMonth(int month, int year) {
        double dwr = dailyWeatherReport.averageTempForMonth(month, year);
        return dwr;
    }

    public double totalRainfallForMonth(int month, int year) {
        double dwr = dailyWeatherReport.totalRainfallForMonth(month, year);
        return dwr;
    }

    public void addDailyReport(GregorianCalendar date, LinkedList<Reading> report){
        dailyWeatherReport.addDailyReport(date, report);
    }
}
