public class Upgrade {

  private Button button;
  private float multiplier;
  private float adder;
  private boolean pressedLastFrame = false;

  public Upgrade(Button b, float m, float a) {
    this.button = b;
    this.multiplier = m;
    this.adder = a;
  }

  public void display() {
    button.display();
  }

  public void update() {
    if (button.isHovered()) {
      if (mousePressed && !pressedLastFrame) {
        status = "Upgraded";
        println("Upgrade activated: x" + multiplier + ", +" + adder);
      } else if (!mousePressed) {
        status = "hover";
      }
    } else {
      status = "nothing";
    }
    pressedLastFrame = mousePressed;
  }


  public float getMulti() {
    return multiplier;
  }
  
 
  public float getAdder() {
    return adder;
  }
}
