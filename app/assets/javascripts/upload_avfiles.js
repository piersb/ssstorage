function readFiles(event) {
  console.log('here');
  console.log(event);
          var fileList = event.target.files;
    for(var i=0; i < fileList.length; i++ ) {
        var fileInput    = $(elem);
        var form     = $(fileInput.parents('form:first'));
        var fileInput = fileList[i];     // a File object
        file.fileupload({
          fileInput:       fileInput,
          url:             form.data('url'),
          type:            'POST',
          autoUpload:       true,
          formData:         form.data('form-data'),
          paramName:        'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
          dataType:         'XML',  // S3 returns XML if success_action_status is set to 201
          replaceFileInput: false
      });
    }
}