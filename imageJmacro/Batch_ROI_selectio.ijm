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
	processednumber=0
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + list[i]))
			processFolder("" + input + list[i]);
			
		if(endsWith(list[i], suffix)) {
			processednumber++;	
			print(processednumber); 
			print(list[i]); 
			processFile(input, output, list[i],suffix);					    
		}
	}
	print("All done!");
}

function processFile(input, output, file,suffix) {
    open(input+ file);
    suffixlength=lengthOf(suffix);
    filename=substring(getTitle,0,lengthOf(getTitle)-suffixlength);
    newfilename=filename + "-1" + suffix;    
    waitForUser("Select ROI, then click OK.");
    
    if (isOpen(newfilename)) {
    	selectWindow(newfilename);
    	run("Split Channels");
   		C1filename="C1-" + newfilename;
    	C2filename="C2-" + newfilename;

    	selectWindow(C1filename);
    	tifc1filename=substring(C1filename,0,lengthOf(C1filename)-suffixlength) + ".tif";
    	saveAs("Tiff", output+tifc1filename);
    	close(tifc1filename);
    	selectWindow(C2filename);
    	tifc2filename=substring(C2filename,0,lengthOf(C2filename)-suffixlength) + ".tif";
    	saveAs("Tiff", output+tifc2filename);
    	close(tifc2filename);
    	
    	close(file); 
    }
    else {
    close(file); 
    print("Error   " + file );
    }	
}
