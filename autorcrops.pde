PImage [] costumes = null;
String[] names = null;
File[] imageFiles;

void setup() {
  surface.setTitle("rmvcrop");
  size(2048, 2048);
  spriteFolder();
  noLoop();
}

void draw() {
  for (int i = 0; i < costumes.length; i++) {
    background(0);
    image(costumes[i], 0, 0);
    removeBackground();
    autoCrop(i);
    String outputPath = "output/" + names[i];
    costumes[i].save(outputPath);
  }
  exit();
}
