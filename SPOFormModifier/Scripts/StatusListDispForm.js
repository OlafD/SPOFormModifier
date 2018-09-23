
function pbPageModificationFunc() {
    var statusValue = $("a[name='SPBookmark_StatusField']").parent().parent().parent().find("td:eq(1)").text().trim();

    if (statusValue != "finished") {
        $("a[name='SPBookmark_StatusComment']").parent().parent().parent().hide();
    }
}
