// Baohui Zhang       bzhang7
// Haopeng Wang       hwang15
import org.junit.Test;
import java.util.GregorianCalendar;
import java.util.LinkedList;

import static org.junit.Assert.*;

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

        // 3 temp, 13 rain
        LinkedList<Reading> a = new LinkedList<>();
        LinkedList<Reading> b = new LinkedList<>();
        LinkedList<Reading> c = new LinkedList<>(); // c is empty
        a.add(s1);
        a.add(s2);
        a.add(s3);

        b.add(s4);
        b.add(s5);
        b.add(s6);

        w = new WeatherMoniter(list);
        w.addDailyReport(new GregorianCalendar(2020, 9, 1), a);
        w.addDailyReport(new GregorianCalendar(2020, 10, 1), b);
        w.addDailyReport(new GregorianCalendar(2020, 11, 1), c);
        System.out.println(w.averageTempForMonth(10, 2020) + " " + w.totalRainfallForMonth(10, 2020));
    }

    LinkedList<DailyWeatherReport> t = new LinkedList<>();
    IDailyWeatherReport list = new DWRLinkedList(t);
    WeatherMoniter w = new WeatherMoniter(list);

    Reading s1 = new Reading(new Time(1,1), 5, 2);
    Reading s2 = new Reading(new Time(1,1), 3, 3);
    Reading s3 = new Reading(new Time(1,1), 2, 6);
    // 10/3 temp, 11 rain

    Reading s4 = new Reading(new Time(1,1), 1, 9);
    Reading s5 = new Reading(new Time(1,1), 5, 0);
    Reading s6 = new Reading(new Time(1,1), 3, 4);

    Reading r1 = new Reading(new Time(2,1), 70, 0.4);  //Temp: 74
    Reading r2 = new Reading(new Time(3,20), 78, 2.5); //Rain: 2.9
    LinkedList<Reading> d1 = new LinkedList<>();

    Reading r3 = new Reading(new Time(6,10), 82, 4);  //Temp: 82
    Reading r4 = new Reading(new Time(10,12), 82, 2.3);  //Rain: 6.3
    LinkedList<Reading> d2 = new LinkedList<>();

    Reading r5 = new Reading(new Time(3,10), 52, 4.1);
    LinkedList<Reading> d3 = new LinkedList<>();

    LinkedList<DailyWeatherReport> report1 = new LinkedList<>();
    IDailyWeatherReport reportLL = new DWRLinkedList(report1);
    WeatherMoniter wm1 = new WeatherMoniter(reportLL);

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


    //2001.01.12
    GregorianCalendar d20010112 = new GregorianCalendar(2001,0,12);
    LinkedList<Double> temp0112 = new LinkedList<>();
    LinkedList<Double> rainfall0112 = new LinkedList<>();
    DailyWeatherReport r20010112 = new DailyWeatherReport(d20010112, temp0112, rainfall0112);

    //2001.02.12
    GregorianCalendar d20010212 = new GregorianCalendar(2001,1,12);
    LinkedList<Double> temp0212 = new LinkedList<>();
    LinkedList<Double> rainfall0212 = new LinkedList<>();
    DailyWeatherReport r20010212 = new DailyWeatherReport(d20010212, temp0212, rainfall0212);

    //2001.02.15
    GregorianCalendar d20010215 = new GregorianCalendar(2001,1,15);
    LinkedList<Double> temp0215 = new LinkedList<>();
    LinkedList<Double> rainfall0215 = new LinkedList<>();
    DailyWeatherReport r20010215 = new DailyWeatherReport(d20010215, temp0215, rainfall0215);

    @Test
    public void testTempAvg() {
        temp0112.add(10.00);
        temp0112.add(5.00);
        temp0112.add(6.00);

        temp0212.add(20.00);
        temp0212.add(10.00);
        temp0212.add(5.00);
        temp0212.add(13.00);

        temp0215.add(100.00);

        LinkedList<DailyWeatherReport> r1 = new LinkedList<>();
        r1.add(r20010112);
        r1.add(r20010212);
        r1.add(r20010215);

        IDailyWeatherReport ir1 = new DWRLinkedList(r1){};
        WeatherMoniter wm1 = new WeatherMoniter(ir1);
        assertEquals(56.00, wm1.averageTempForMonth(1, 2001), 0.01);
        assertEquals(0.00, wm1.averageTempForMonth(11,2001),0.01);    //edge case
        assertEquals(7.00, wm1.averageTempForMonth(0,2001),0.01);
    }

    @Test
    public void testTotalRainfall() {
        rainfall0112.add(1.00);
        rainfall0112.add(4.00);
        rainfall0112.add(20.00);

        rainfall0212.add(3.00);
        rainfall0212.add(50.00);
        rainfall0212.add(23.00);
        rainfall0212.add(4.00);

        rainfall0215.add(200.00);

        LinkedList<DailyWeatherReport> r1 = new LinkedList<>();
        r1.add(r20010112);
        r1.add(r20010212);
        r1.add(r20010215);
        IDailyWeatherReport ir1 = new DWRLinkedList(r1){};
        WeatherMoniter wm1 = new WeatherMoniter(ir1);

        assertEquals(280.00, wm1.totalRainfallForMonth(1,2001),0.01);
        assertEquals(0.00, wm1.totalRainfallForMonth(5,2001),0.01); //edge case
        assertEquals(25.00, wm1.totalRainfallForMonth(0,2001),0.01);
    }

    @Test
    public void emptyReport() {
        LinkedList<DailyWeatherReport> reportE = new LinkedList<>();
        IDailyWeatherReport reportEm = new DWRLinkedList(reportE);
        WeatherMoniter wmE = new WeatherMoniter(reportEm);

        assertEquals(0, wmE.averageTempForMonth(9, 2020), .01);
        assertEquals(0, wmE.totalRainfallForMonth(10, 1988), .01);
    }

    @Test
    public void averageTempTest(){
        assertEquals(3.33, w.averageTempForMonth(9, 2020), .01);
        assertEquals(3, w.averageTempForMonth(10, 2020), .01);
        assertEquals(0, w.averageTempForMonth(11, 2020), .01); // empty
        assertEquals(0, w.averageTempForMonth(1145, 2015120), .01); // no date
    }

    @Test
    public void totalRainfallTest(){
        assertEquals(11, w.totalRainfallForMonth(9, 2020), .01);
        assertEquals(13, w.totalRainfallForMonth(10, 2020), .01);
        assertEquals(0, w.totalRainfallForMonth(11, 2020), .01); // empty
        assertEquals(0, w.totalRainfallForMonth(1145, 2015120), .01); // no date
    }
}
