
// This function returns all the files in a directory as an array of Strings
private String[] listFileNames(String dir) {                               // called in sprite class, scene class and sound void
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {                                                                 // If it's not a directory
    return null;
  }
}

public PImage[] spriteFolder() {                           // verify how many items arent images and import them

  try {
    String path = sketchPath()+ "/import";                      // search for folderpath
    String[] filenames = listFileNames(path);                           // search filenames                                 
    int totalNumberOfCostumes = 0;
    int loadedCostume = 0;
    for (int i = 0; i < filenames.length; i++) {                        // iterate for searching each file and check if it's an image before importing them
      String extention = filenames[i].substring(filenames[i].indexOf(".")); // separate extention for separate img to sounds and prevent otherfiles
      if (extention.equals(".png") || extention.equals(".jpg") || extention.equals(".jpeg") || extention.equals(".tga") || extention.equals(".gif") ) {
        totalNumberOfCostumes++;                                        // var for knowing the number of images
      }
    }
    costumes = new PImage [totalNumberOfCostumes];                      // init the array of images width the checked up totalNumberOfCostumes var
    names = new String[totalNumberOfCostumes];
    for (int i = 0; i < filenames.length; i++) {                        // iterate for importing them
      String extention = filenames[i].substring(filenames[i].indexOf(".")); // check extention prevent fail
      if (extention.equals(".png") || extention.equals(".jpg") || extention.equals(".jpeg") || extention.equals(".tga") || extention.equals(".gif") ) {
        costumes[loadedCostume] = loadImage(path +"/"+ filenames[i]);   // load images
        names[loadedCostume] = filenames[i];
        loadedCostume++;
      }
    }
  }
  catch(Exception e) {
    println("!!---- Caution ! There is no spriteFolder at this name");
  }
  if (costumes.length < 1) {
    println("!!---- Caution! empty ----!!");
  }
  return costumes;
}
