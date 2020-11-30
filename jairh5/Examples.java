import static org.junit.Assert.assertEquals;

import java.util.GregorianCalendar;
import java.util.LinkedList;

import org.junit.Test;

public class Examples {
    public Examples() {
        d1.add(r1);
        d1.add(r2);
        d2.add(r3);
        d2.add(r4);
        d3.add(r5);
        wm1.addDailyReport(new GregorianCalendar(2020, 9,12), d1);
        wm1.addDailyReport(new GregorianCalendar(2020, 10,2), d2);
        wm1.addDailyReport(new GregorianCalendar(2020, 9,20), d3);
    }
    Reading r1 = new Reading(new Time(2,1), 70, 0.4);  //Temp: 74
    Reading r2 = new Reading(new Time(3,20), 78, 2.5); //Rain: 2.9
    LinkedList<Reading> d1 = new LinkedList<>();

    Reading r3 = new Reading(new Time(6,10), 82, 4);  //Temp: 82
    Reading r4 = new Reading(new Time(10,12), 82, 2.3);  //Rain: 6.3
    LinkedList<Reading> d2 = new LinkedList<>();

    Reading r5 = new Reading(new Time(3,10), 52, 4.1);
    LinkedList<Reading> d3 = new LinkedList<>();

    LinkedList<DailyWeatherReport> report1 = new LinkedList<>();
    IList reportLL = new ReportList(report1);
    WeatherMonitor wm1 = new WeatherMonitor(reportLL);

    @Test
    public void avgTempTwoReports () {
        assertEquals(63, wm1.averageTempForMonth(9,2020),.01);
    }

    @Test
    public void avgTempOneReport () {
        assertEquals(82, wm1.averageTempForMonth(10,2020),.01);
    }

    @Test
    public void edgeCaseNoGivenMonthTemp() {
        assertEquals(0, wm1.averageTempForMonth(1, 2020),.01);
    }

    @Test
    public void edgeCaseNoGivenYearTemp() {
        assertEquals(0, wm1.averageTempForMonth(9, 2022),.01);
    }

    @Test
    public void totalRainfallTwoMonth() {
        assertEquals(7, wm1.totalRainfallForMonth(9,2020), 0.01);
    }

    @Test
    public void totalRainfallOneMonth() {
        assertEquals(6.3, wm1.totalRainfallForMonth(10,2020), 0.01);
    }

    @Test
    public void edgeCaseNoGivenMonthRain() {
        assertEquals(0, wm1.totalRainfallForMonth(1, 2020),.01);
    }

    @Test
    public void edgeCaseNoGivenYearRain() {
        assertEquals(0, wm1.totalRainfallForMonth(9, 2022),.01);
    }
}