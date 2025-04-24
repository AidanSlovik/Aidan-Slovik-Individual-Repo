String status = "";
Upgrade upgradeTest;
ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<Upgrade> upgrades = new ArrayList<Upgrade>();

void setup() {
  size(400, 400);
  Table buttonTable;
  buttonTable = loadTable("Button Data.csv", "header");
  int position = 0;
  for (TableRow row : buttonTable.rows()) {

    int ID = row.getInt("ID");
    int XPOS = row.getInt("XPOS");
    int YPOS = row.getInt("YPOS");
    int WIDTH = row.getInt("WIDTH");
    int HEIGHT = row.getInt("HEIGHT");
    String text = row.getString("TEXT");
    int TSIZE = row.getInt("TSIZE");
    int COLOR = row.getInt("COLOR");
    Button button = new Button(ID, XPOS, YPOS, WIDTH, HEIGHT, text, TSIZE, COLOR);
    buttons.add(button);
    Upgrade upgrade = new Upgrade(button, 2.0, 5.0);
    upgrades.add(upgrade);
    position++;
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
  
  //ellipse(200, 200, 100, 100);
//text("Status: " + status, 150, 150);
}
