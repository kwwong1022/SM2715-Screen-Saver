public class Clock {
  private int x;
  private int y;
  private PFont fontA;
  private PFont fontB;
  
  // constructor
  public Clock(int x, int y) {
    this.x = x;
    this.y = y;
    this.fontA = createFont("Hind-Bold.ttf", 42);
    this.fontB = createFont("Hind-Light.ttf", 20);
  }
  
  public void show() {
    String time = toTwoDicimal(hour()) + " : " + toTwoDicimal(minute());
    String date = getDate();
    
    // time
    textAlign(CENTER);
    textFont(fontA);
    fill(20);
    text(time, x, y+3);
    fill(255);
    text(time, x, y);
    
    // date
    textFont(fontB);
    fill(20);
    text(date, x, y+3+28);
    fill(255);
    text(date, x, y+28);
  }
  
  public String getDate() {
    String month = "";
    
    // casting month from int to String in english
    switch (month()) {
      case 1:
        month = "January";
        break;
      case 2:
        month = "February";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "December";
        break;
    }
    
    return day() + " " + month + " " + year();
  }
  
  // 9 -> 09
  public String toTwoDicimal(int param) {
    if (param < 10) {
      return "0" + param;
    } else {
      return String.valueOf(param);
    }
  }
}
