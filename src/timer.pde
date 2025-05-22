public class Timer {
  int startTime;
  int duration; // in milliseconds
  boolean countdown; // true for timedrun, false for speedrun

  public Timer(int durationInSeconds, boolean countdown) {
    this.countdown = countdown;
    this.duration = durationInSeconds * 1000;
    this.startTime = millis();
  }

  public int getElapsed() {
    return millis() - startTime;
  }

  public int getRemaining() {
    return max(0, duration - getElapsed());
  }

  public String getTimeString() {
    int time = countdown ? getRemaining() : getElapsed();
    int seconds = (time / 1000) % 60;
    int minutes = (time / 1000) / 60;
    return nf(minutes, 2) + ":" + nf(seconds, 2);
  }

  public boolean isFinished() {
    return countdown && getElapsed() >= duration;
  }
}
