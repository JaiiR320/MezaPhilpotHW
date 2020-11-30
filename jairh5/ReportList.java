import java.util.LinkedList;

public class ReportList implements IList {
    LinkedList<DailyWeatherReport> list = new LinkedList<>();
    
    public ReportList(LinkedList<DailyWeatherReport> list){
        this.list = list;    
    }

    public LinkedList<DailyWeatherReport> parseList(int month, int year){  
        LinkedList<DailyWeatherReport> parsed = new LinkedList<>();
        for (DailyWeatherReport d : this.list) {
            if(d.sameMonthYear(month, year)){ // same month/year
                parsed.add(d);
            }
        }
        return parsed;
    }

    public void addReport(DailyWeatherReport d){
        list.add(d);
    }
}
