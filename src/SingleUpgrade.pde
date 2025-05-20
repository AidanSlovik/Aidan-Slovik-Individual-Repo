public class SingleUpgrade extends Upgrade {
  private Counter counter;

  public SingleUpgrade(Button b, int c, int a, Counter counter) {
    super(b, c, a);
    this.counter = counter;
  }

  public void update() {
    if (button.isHovered()) {
      if (mousePressed && !pressedLastFrame && counter.get() >= cost) {
        int value = (int)(amount);
        manualClickPower += value;
        counter.subtract(cost);
        println("SingleUpgrade boosted manualClickPower by " + value + ". New: " + manualClickPower);
      }
    }
    pressedLastFrame = mousePressed;
  }
}
