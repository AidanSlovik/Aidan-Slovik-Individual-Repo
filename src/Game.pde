void setup() {
  size(400, 400);
  
  ellipseMode(CENTER);
}

void draw() {
  background(125);
  Button button = new Button(50, 50, 50, 200, "hi", 100, 20);
  button.display();
  if(button.isHovered() == true) {
    if(mousePressed) {
      text('p', 150, 100);
    } else {
      text('h', 150, 100);
    }
  }
  

  ellipse(200, 200, 100, 100);
}
