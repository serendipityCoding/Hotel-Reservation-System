package asgp2.springmvc.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateUtil {
	public static String getCurrentDate(){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String currentDate=dateFormat.format(cal.getTime()).toString();
		return currentDate;
	}
}
