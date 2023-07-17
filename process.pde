void removeBackground() {
  loadPixels();
  color targetColor = get(0,0); // Couleur du fond à supprimer (blanc ici)

  for (int i = 0; i < pixels.length; i++) {
    if (pixels[i] == targetColor) {
      pixels[i] = color(0, 0); // Rendre le pixel transparent
    }
  }

  updatePixels();
  println("done background removed");
}



void autoCrop(int j) {
  loadPixels();

  int left = width;
  int right = 0;
  int top = height;
  int bottom = 0;

  // Trouver les limites non vides
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      if (alpha(pixels[index]) > 0) {
        if (x < left) left = x;
        if (x > right) right = x;
        if (y < top) top = y;
        if (y > bottom) bottom = y;
      }
    }
  }

  // Recadrer l'image
  int newWidth = right - left + 1;
  int newHeight = bottom - top + 1;
  PImage croppedImage = createImage(newWidth, newHeight, ARGB);

  // Copier la région d'intérêt dans la nouvelle image
  for (int x = left; x <= right; x++) {
    for (int y = top; y <= bottom; y++) {
      int srcIndex = x + y * width;
      int destIndex = x - left + (y - top) * newWidth;
      croppedImage.pixels[destIndex] = pixels[srcIndex];
    }
  }

  // Remplacer l'image originale par l'image recadrée
  costumes[j] = croppedImage;
  updatePixels();
  println("done cropped");
}
