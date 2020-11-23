/*
 * Macro template to process multiple images in a folder
 */

input = getDirectory("Input directory");
output = getDirectory("Output directory");

Dialog.create("File type");
Dialog.addString("File suffix: ", ".tif", 5);
Dialog.show();
suffix = Dialog.getString();

Dialog.create("radius(pixels)");
Dialog.addString("File suffix: ", "20", 5);
Dialog.show();
radius = Dialog.getString();

processFolder(input);

function processFolder(input) {
	list = getFileList(input);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + list[i]))
			processFolder("" + input + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i],i);
	}
}

function processFile(input, output, file, number) {
    open(input+ file);
	run("Subtract Background...", "rolling=radius stack");
	savef=substring(file,0,lengthOf(file)-4);
	
	saveAs("Tiff", output+savef+"rolltheball"+radius);
	run("Close");
	// do the processing here by replacing
	// the following two lines by your own code
	print("file number " + number);
	print("Processing: " + input + file);
	print("Saving to: " + output);
}
