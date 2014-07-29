int[][] squares;
int[][] nextsquares;
boolean go;

void setup() {
  size(400, 300);
  background(0);
  
  squares = new int[10][10];
  nextsquares = new int[10][10];
  go = false;
}

void draw() {
  stroke(50);                        // draw the gridlines
  noFill();
  for (int i = 1; i < 10; i++) {
    line(i * 33, 0, i * 33, 300);
    line(0, i * 33, 300, i * 33);
  }
  
  rect(320, 120, 60, 45);
  rect(320, 220, 60, 45);
  fill(150);
  text("Conway's", 320, 30);
  text("Game of", 320, 50);
  text("Life", 320, 70);
  text("NEXT", 335, 135);
  text("RESET", 335, 235);
  
  noStroke();
  for (int i = 0; i < 9; i++) {      // color in the alive cells
    for (int j = 0; j < 9; j++) {
      if (squares[i][j] == 1) {
        fill(255);
        rect(i * 33 + 1, j * 33 + 1, 32, 32);
      }
      if (squares[i][j] == 0) {
        fill(0);
        rect(i * 33 + 1, j * 33 + 1, 32, 32);
      }
      nextsquares[i][j] = squares[i][j];    // copy current cells
    }
  }
  
  if (go == true) {
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      int living = 0; 
      if (i > 0) {
        if (squares[i - 1][j] == 1) living++;
        if (j > 0) {
          if (squares[i - 1][j - 1] == 1) living++;
        }
        if (squares[i - 1][j + 1] == 1) living++;
      }
      if (j > 0) {
        if (squares[i][j - 1] == 1) living++;
        if (squares[i + 1][j - 1] == 1) living++;
      }
        
      if (squares[i][j + 1] == 1) living++;  
      if (squares[i + 1][j + 1] == 1) living++;
      if (squares[i + 1][j] == 1) living++;
      
      if (living < 2) nextsquares[i][j] = 0;
      if (living > 3) nextsquares[i][j] = 0;
      if (living == 3) nextsquares[i][j] = 1;
    }
  }
  
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      squares[i][j] = nextsquares[i][j];
    }
  }
  go = false;
  }
}

void mousePressed() {
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (mouseX >= i * 33 && mouseX <= i * 33 + 33 && mouseY >= j * 33 && mouseY <= j * 33 + 33) {
        squares[i][j] = 1;
      }
    }
  }
  
  if (mouseX >= 320 && mouseX <= 380 && mouseY >= 120 && mouseY <= 165) go = true; 
  if (mouseX >= 320 && mouseX <= 380 && mouseY >= 220 && mouseY <= 265) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        squares[i][j] = 0;
      }
    }
  }

}
