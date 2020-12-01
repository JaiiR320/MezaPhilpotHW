import java.util.GregorianCalendar;
import java.util.LinkedList;

public class DWRLinkedList implements IDailyWeatherReport {
    LinkedList<DailyWeatherReport> dailyWeatherReport;

    public DWRLinkedList(LinkedList<DailyWeatherReport> dailyWeatherReport) {
        this.dailyWeatherReport = dailyWeatherReport;
    }
    public LinkedList<DailyWeatherReport> clean(int month, int year) {
        LinkedList<DailyWeatherReport> cleanedDWR = new LinkedList<>();
        for (DailyWeatherReport i: dailyWeatherReport) {
            if(i.sameDate(month, year)) {
                cleanedDWR.add(i);
            }
        }
        return cleanedDWR;
    }

    public double averageTempForMonth(int month, int year) {
        double tempCount=0;
        LinkedList<DailyWeatherReport> cleanedDWR = clean(month, year);
        if (cleanedDWR.size()==0) {
            return 0;
        }
        LinkedList<Double> avg = new LinkedList<>();
        for (DailyWeatherReport i: cleanedDWR) {
                avg.add(i.getAvgTemp());
            }
        for (Double c: avg) {
            tempCount += c;
        }
        return tempCount/avg.size();
    }

    public double totalRainfallForMonth(int month, int year) {
        double readings=0;
        LinkedList<DailyWeatherReport> cleanedDWR = clean(month, year);
        if (cleanedDWR.size()==0) {
            return 0;
        }
        for (DailyWeatherReport i: cleanedDWR) {
            if (i.getRainfall().size() > 0) {
                for (Double c : i.getRainfall()) {
                    readings += c;
                }
            }
        }
        return readings;
    }

    public void addDailyReport(GregorianCalendar date, LinkedList<Reading> report) {
        LinkedList<Double> temps = new LinkedList<>();
        LinkedList<Double> rain = new LinkedList<>();
        for (Reading r : report) {
            rain.add(r.getRainfall());
            temps.add(r.getTemp());
        }
        dailyWeatherReport.add(new DailyWeatherReport(date, temps, rain));
    }
}
