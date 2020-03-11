$(function () {

    function uploadFile(elem) {
        let fileInput = $(elem);
        let form = $(fileInput.parents('form:first'));
        let url = form.data('url');
        let formData = form.data('form-data');
        let xhr = new XMLHttpRequest();
        fd = new FormData;
        xhr.open("POST", url, true);
        fd.append(formData);
        formData.append("upload_file", elem);
        xhr.send(fd);
    }


    $('.directUpload').find("input:file").each(function (i, elem) {
        uploadFile(elem);


        // console.log(elem);
        // var fileInput = $(elem);
        // var form = $(fileInput.parents('form:first'));
        // var submitButton = form.find('input[type="submit"]');
        // var progressBar = $("<div class='bar'></div>");
        // var barContainer = $("<div class='progress'></div>").append(progressBar);
        // fileInput.after(barContainer);
        //
        // fileInput.fileupload({
        //     fileInput: fileInput,
        //     url: form.data('url'),
        //     type: 'POST',
        //     autoUpload: true,
        //     formData: form.data('form-data'),
        //     paramName: 'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
        //     dataType: 'XML',  // S3 returns XML if success_action_status is set to 201
        //     replaceFileInput: false
        // });
    });
});