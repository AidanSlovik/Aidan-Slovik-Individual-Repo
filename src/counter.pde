public class Counter {
  int value = 0;

  public void add(int amount) {
    value += amount;
  }

  public int get() {
    return value;
  }

  public void subtract(int num) {
    value -= num;
  }

  public void display(float x, float y) {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Counter: " + value, x, y);
  }
}
