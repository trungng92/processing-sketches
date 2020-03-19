screenSize = 320;
gridSize = 16;

// 10 squares means 11 lines
int[] gridLinesX = new int[11];
int[] gridLinesY = new int[11];

void setup() {
    for(int i = 0; i < gridLinesX.length; i++) {
        gridLinesX[i] = gridSize * i
    }
    
    for(int i = 0; i < gridLinesY.length; i++) {
        gridLinesY[i] = gridSize * i
    }
    
    size(screenSize, screenSize);     
    strokeWeight(2);
} 

boolean iso = true;
void draw() {
    background(255);
    pushMatrix();
    if(iso) {
        translate((screenSize / 2) - (gridSize / 2), height / 4);
    } else {
        translate((screenSize / 4) - (gridSize / 2), height / 4);
    }
    for(int i = 0; i < gridLinesX.length; i++) {
        PVector vec1 = transform(gridLinesX[i], 0, iso);
        PVector vec2 = transform(gridLinesX[i], (gridLinesY.length - 1) * gridSize, iso);
        line(vec1.x, vec1.y, vec2.x, vec2.y);
    }
    
    for(int i = 0; i < gridLinesY.length; i++) {
        PVector vec1 = transform(0, gridLinesY[i], iso);
        PVector vec2 = transform((gridLinesX.length - 1) * gridSize, gridLinesY[i], iso);
        line(vec1.x, vec1.y, vec2.x, vec2.y);
    }
    popMatrix();
}

PVector transform(int x, int y, boolean iso) {
    if(iso) {
        return new PVector(x - y, (x + y) / 2);
    } else {
        return new PVector(x, y);
    }

}

void mouseClicked() {
    iso = !iso;    
}
