// Process base image (renamed to 001,002, etc.)
T = getTitle();
run("Subtract Background...", "rolling=50 stack"); //background subtraction
run("Smooth") //smoothing

// Split channels
run("Split Channels"); // splits into magenta (cell membrane), cyan (Golgi), and nucleus (yellow)

//Modify Colors
selectWindow("C1-" + T); //selecting
run("Yellow"); //recoloring
rename(T + "_Y"); //renaming
//Do Z projection
run("Z Project...", "projection=[Max Intensity]");
rename("MAX_" + T + "_Y"); //renaming Z projection

selectWindow("C2-" + T); //same thing for other channel
run("Cyan");
rename(T + "_C");
run("Z Project...", "projection=[Max Intensity]");
rename("MAX_" + T + "_C");

selectWindow("C3-" + T); //same thing for third channel
run("Magenta");
rename(T + "_M");
run("Z Project...", "projection=[Max Intensity]");
rename("MAX_" + T + "_M");
