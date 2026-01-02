
/*Ver contraseña */
function Password(id,id2) {
    var input = document.getElementById(id);
    var input2 = document.getElementById(id2);
    var img = document.getElementById('check2');
    if (input.type === "password" || input2.type==="password") {
        input.type = "text";
        input2.type = "text";
        img.src = "Img/img_no_ver.png";

    } else {
        input.type = "password";
        input2.type = "password";
        img.src = "Img/img_ver.png";

    }
}