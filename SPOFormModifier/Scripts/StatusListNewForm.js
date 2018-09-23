
function pbPageModificationFunc() {
    var statusValue = $("#StatusField_8bd36554-9b41-49be-9c96-c2e25743c53a_\\$DropDownChoice option:selected").text();

    if (statusValue != "finished") {
        $("#StatusComment").parent().parent().hide();
    }

    setOnChangeForStatusField();
}

function setOnChangeForStatusField() {
    $("#StatusField_8bd36554-9b41-49be-9c96-c2e25743c53a_\\$DropDownChoice").on("change", function () { showStatusCommentField(); });
}

function showStatusCommentField() {
    var statusValue = $("#StatusField_8bd36554-9b41-49be-9c96-c2e25743c53a_\\$DropDownChoice option:selected").text();

    if (statusValue != "finished") {
        $("#StatusComment").parent().parent().hide();
    } else {
        $("#StatusComment").parent().parent().show();
    }
}
