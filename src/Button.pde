public class Button {

  int id;
  int xPos;
  int yPos;
  int wdith;
  int hieght;
  String text;
  int textSize;
  int cloor;
  int tempCloor;

  public Button(int id, int x, int y, int w, int h, String text, int textSize, int c) {
    this.id = id;
    this.xPos = x;
    this.yPos = y;
    this.wdith = w;
    this.hieght = h;
    this.text = text;
    this.cloor = c;
    this.textSize = textSize;
  }

  void display() {
    fill(tempCloor);
    rect(xPos, yPos, wdith, hieght, 0);
    fill(255);
    textAlign(CENTER, CENTER);
    text(text, xPos + wdith / 2, yPos + hieght / 2);
  }

  boolean isHovered() {
    if (mouseX >= xPos && mouseX <= xPos + wdith && mouseY >= yPos && mouseY <= yPos + hieght) {
      tempCloor = cloor + 50;
      return true;
    }
    tempCloor = cloor;
    return false;
  }
  
  int getID() {
    return id; 
  }
}
