function readFiles(event) {
  console.log('here');
    var fileList = event.target.files;

    for(var i=0; i < fileList.length; i++ ) {
        var file = fileList[i];     // a File object
        console.log("i: " + i + " - " + file.name);
    }
}