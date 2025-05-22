ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<Upgrade> upgrades = new ArrayList<Upgrade>();
Counter counter;
int manualClickPower = 1;
boolean start = false;
String gameType = "";
boolean clickButtonPressedLastFrame = false;
Button clickButton = new Button(999, 150, 300, 100, 50, "CLICK", "CLICK", color(200));
Button timedrun = new Button(-1, width, height + 200, 200, 100, "timed run", "Timed run", 100);
Button speedrun = new Button(-2, width + 400, height + 200, 200, 100, "speed run", "speed run", 100);
Timer gameTimer;
boolean gameOver = false;
String finalTime;

void setup() {
  size(800, 800);
  Table buttonTable;
  buttonTable = loadTable("Button Data.csv", "header");
  counter = new Counter();
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
  }
}

void draw() {
  if (start == false) {
    background(0);
    //text("Start", width/2, height/2);
    timedrun.isHovered();
    timedrun.display();
    speedrun.isHovered();
    speedrun.display();
    if (mousePressed && timedrun.isHovered()) {
      gameType = "timedrun";
      start = true;
      println(gameType);
      gameTimer = new Timer(10, true);//time for timedrun
    } else if (mousePressed && speedrun.isHovered()) {
      gameType = "speedrun";
      start = true;
      println(gameType);
      gameTimer = new Timer(0, false);
    }
  }

  if (start == true && gameOver == false) {
    background(125);
    for (Upgrade u : upgrades) {
      u.update();
      u.display();
    }

    fill(255);
    textSize(24);
    text("Time: " + gameTimer.getTimeString(), width / 2, 100);

    counter.display(width / 2, 50);

    clickButton.isHovered();
    clickButton.display();
    if (clickButton.isHovered() && mousePressed && !clickButtonPressedLastFrame) {
      counter.add(manualClickPower);
    }

    clickButtonPressedLastFrame = mousePressed;

    if (gameType.equals("timedrun") && gameTimer.isFinished()) {
      gameOver = true;
    } else if (gameType.equals("speedrun") && counter.get() >= 50) {//limit for speedrun
      finalTime = gameTimer.getTimeString();
      gameOver = true;
    }
  }
  if (gameOver) {
    background(50);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    if (gameType.equals("timedrun")) {
      text("Time's up! Final Score: " + counter.get(), width / 2, height / 2);
    } else if (gameType.equals("speedrun")) {
      text("Goal reached in: " + finalTime, width / 2, height / 2);
    }
  }
}
