String status = "";
Upgrade upgradeTest;

void setup() {
  size(400, 400);
  Button button = new Button(50, 50, 50, 200, "hi", 100, 20);
  upgradeTest = new Upgrade(button, 2.0, 5.0);
  //ellipseMode(CENTER);
}

void draw() {
  background(125);
  upgradeTest.display();
  upgradeTest.update();
  //println(status);
  //ellipse(200, 200, 100, 100);
  text("Status: " + status, 150, 150);
}
