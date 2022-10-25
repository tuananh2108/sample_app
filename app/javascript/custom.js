let comment_form = document.getElementsByClassName("comment-form")[0];
let btn_reply_cmt = document.getElementsByClassName("btn-reply-cmt");
for (let i = 0; i < btn_reply_cmt.length; i++) {
  btn_reply_cmt[i].onclick = () => {
    document.getElementsByClassName("list-reply-cmt")[i].prepend(comment_form);
    parent_cmt_id = btn_reply_cmt[i].previousElementSibling.id;
    console.log(parent_cmt_id);
    console.log(comment_form.childNodes[3].childNodes[8]);
    comment_form.childNodes[3].childNodes[10].value = parent_cmt_id;
  };
}

// Micropost Form in Home index
let input_upload_image = document.getElementById("micropost_image");
let file_upload_content = document.getElementById("file-upload-content");
let file_upload_image = document.getElementById("file-upload-image");

function readURL(input) {
  if (input.files && input.files[0]) {

    var reader = new FileReader();

    reader.onload = function(e) {
      file_upload_image.setAttribute("src", e.target.result);
      file_upload_content.style.display = "block";
    };

    reader.readAsDataURL(input.files[0]);
  }
}
