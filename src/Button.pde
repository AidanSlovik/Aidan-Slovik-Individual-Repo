public class Button {

  int xPos;
  int yPos;
  int wdith;
  int hieght;
  String text;
  int textSize;
  int cloor;

  public Button(int x, int y, int w, int h, String text, int c, int textSize) {
    this.xPos = x;
    this.yPos = y;
    this.wdith = w;
    this.hieght = h;
    this.text = text;
    this.cloor = c;
    this.textSize = textSize;
  }

  void display() {
    fill(cloor);
    rect(xPos, yPos, wdith, hieght, 0, 0, 0, 0);
    fill(255);
    textAlign(CENTER, CENTER);
    text(text, xPos + wdith / 2, yPos + hieght / 2);
  }

  boolean isHovered() {
    if (mouseX >= xPos && mouseX <= xPos + wdith && mouseY >= yPos && mouseY <= yPos + hieght) {
      cloor = 150;
      return true;
    }
    return false;
  }
}
