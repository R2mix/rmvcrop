PImage [] costumes = null;
String[] names = null;
File[] imageFiles;

void setup() {
  size(800, 600);
  spriteFolder();
  noLoop();
}

void draw() {
  for (int i = 0; i < costumes.length; i++) {
    clear();
    image(costumes[i], 0, 0);
    removeBackground();
    autoCrop(i);
    String outputPath = "output/" + names[i];
    costumes[i].save(outputPath);
  }
  exit();
}
