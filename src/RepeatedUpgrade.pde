public class RepeatedUpgrade extends Upgrade {
  private int lastUpdateTime = 0;
  private int interval = 1000; // milliseconds
  private Counter counter;
  private boolean active = false;
  private int level = 0;

  public RepeatedUpgrade(Button b, int c, int a, Counter counter) {
    super(b, c, a);
    this.counter = counter;
  }

  public void update() {
    if (button.isHovered()) {
      if (mousePressed && !pressedLastFrame && !active && counter.get() >= cost) {
        level++;
        counter.subtract(cost);
        active = true;
        println("RepeatedUpgrade " + button.getID() + " activated");
      } else if (mousePressed && !pressedLastFrame && counter.get() >= cost) {
        level++;
        counter.subtract(cost);
        println("RepeatedUpgrade " + button.getID() + " leveled up");
      }
    }

    if (active && millis() - lastUpdateTime > interval) {
      int value = (int) (amount * level);
      counter.add(value);
      lastUpdateTime = millis();
      println("RepeatedUpgrade added " + value + " (level " + level + "). Total: " + counter.get());
    }

    pressedLastFrame = mousePressed;
  }
}

