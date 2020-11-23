/*
 * Macro template to process multiple images in a folder
 */

input = getDirectory("Input directory");
output = getDirectory("Output directory");

Dialog.create("File type");
Dialog.addString("File suffix: ", ".tif", 5);
Dialog.show();
suffix = Dialog.getString();

processFolder(input);

function processFolder(input) {
	list = getFileList(input);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + list[i]))
			processFolder("" + input + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
    open(input+ file);
	run("Gaussian Blur 3D...", "x=1 y=1 z=1");
	savef=substring(file,0,lengthOf(file)-4);
	
	saveAs("Tiff", output+savef+"Gaussianblured1");
	run("Close");
	// do the processing here by replacing
	// the following two lines by your own code
	print("Processing: " + input + file);
	print("Saving to: " + output);
}
