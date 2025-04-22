String status = "";
Upgrade upgradeTest;
Button[] buttons = new Button[2];
Upgrade[] upgrades = new Upgrade[2];
void setup() {
  size(400, 400);
  Table buttonTable;
  buttonTable = loadTable("Button Data.csv", "header");
  int position = 0;
  for (TableRow row: buttonTable.rows()) {
    
    int ID = row.getInt("ID");
    int XPOS = row.getInt("XPOS");
    int YPOS = row.getInt("YPOS");
    int WIDTH = row.getInt("WIDTH");
    int HEIGHT = row.getInt("HEIGHT");
    String text = row.getString("TEXT");
    int TSIZE = row.getInt("TSIZE");
    int COLOR = row.getInt("COLOR");
    Button button = new Button(ID, XPOS, YPOS, WIDTH, HEIGHT, text, TSIZE, COLOR);
    buttons[position] = button;
    Upgrade upgrade = new Upgrade(button, 2.0, 5.0);
    upgrades[position] = upgrade;
    //maybe replace array with arraylist
    // add a loop in draw that updates and diplays them
    // also inheritance for adding upgrades and multiplying upgrades
    
  }
  
  Button button = new Button(69, 50, 50, 50, 200, "hi", 100, 20);
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
