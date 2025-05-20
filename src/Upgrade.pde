public abstract class Upgrade {

  protected Button button;
  protected int cost;
  protected int amount;
  protected boolean pressedLastFrame = false;

  public Upgrade(Button b, int c, int a) {
    this.button = b;
    this.cost = c;
    this.amount = a;
  }

  public void display() {
    button.display();
    text("Cost: " + cost, button.getXPos() + button.getWidth() / 2, button.getYPos() + button.getHeight() / 2 + 30);
  }

  public void update() {
    if (button.isHovered()) {
      if (mousePressed && !pressedLastFrame) {
      } else if (!mousePressed) {
      }
    } else {
    }
    pressedLastFrame = mousePressed;
  }


  public int getAmount() {
    return amount;
  }


  public int getCost() {
    return cost;
  }
}
