ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<Upgrade> upgrades = new ArrayList<Upgrade>();
Counter counter;
int manualClickPower = 1;
boolean clickButtonPressedLastFrame = false;

void setup() {
  size(800, 800);
  Table buttonTable;
  buttonTable = loadTable("Button Data.csv", "header");
  counter = new Counter();
  Button clickButton = new Button(999, 150, 300, 100, 50, "CLICK", "CLICK", color(200));
  buttons.add(clickButton);
  for (TableRow row : buttonTable.rows()) {

    int ID = row.getInt("ID");
    int XPOS = row.getInt("XPOS");
    int YPOS = row.getInt("YPOS");
    int WIDTH = row.getInt("WIDTH");
    int HEIGHT = row.getInt("HEIGHT");
    String text = row.getString("TEXT");
    String TYPE = row.getString("TYPE");
    int COLOR = row.getInt("COLOR");
    int COST = row.getInt("COST");
    int AMOUNT = row.getInt("AMOUNT");
    Button button = new Button(ID, XPOS, YPOS, WIDTH, HEIGHT, text, TYPE, COLOR);
    buttons.add(button);
    if (TYPE.equals("REPEATED")) {
      upgrades.add(new RepeatedUpgrade(button, COST, AMOUNT, counter));
    } else if (TYPE.equals("SINGLE")) {
      upgrades.add(new SingleUpgrade(button, COST, AMOUNT, counter));
    }
    // also inheritance for adding upgrades and multiplying upgrades
  }

  //ellipseMode(CENTER);
}

void draw() {
  background(125);
  for (Upgrade u : upgrades) {
    u.update();
    u.display();
  }

  counter.display(width / 2, 50);

  for (Button b : buttons) {
    if (b.type.equals("CLICK")) {
      b.isHovered();
      b.display();

      if (b.isHovered()) {
        if (mousePressed && !clickButtonPressedLastFrame) {
          counter.add(manualClickPower);
        }
      }
    }
  }
  clickButtonPressedLastFrame = mousePressed;


  //ellipse(200, 200, 100, 100);
  //text("Status: " + status, 150, 150);
}
