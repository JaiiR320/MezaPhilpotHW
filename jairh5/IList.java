import java.util.LinkedList;

/**
 * IList
 */
public interface IList {
    public LinkedList<DailyWeatherReport> parseList(int month, int year);
    public void addReport(DailyWeatherReport d);
}
