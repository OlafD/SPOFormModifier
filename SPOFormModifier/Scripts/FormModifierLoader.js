
// create a mapping for the form and the modifier file
var mapping =
{
    values:
    [
    	{ "/lists/statuslist/newform.aspx": "/scripts/StatusListNewForm.js" },
    	{ "/lists/statuslist/dispform.aspx": "/scripts/StatusListDispForm.js" },
        { "/lists/statuslist/editform.aspx": "/scripts/StatusListEditForm.js" }
    ]
};

$(document).ready(function () {
    var scriptFile = "";

    for (var i = 0; i < mapping.values.length; i++) {
        var obj = mapping.values[i];

        for (var key in obj) {
            var value = obj[key].toString();

            if (window.location.href.toLowerCase().indexOf(key) != -1) {
                scriptFile = _spPageContextInfo.siteAbsoluteUrl + value;

                break;
            }
        }
    }

    SP.SOD.registerSod("formModifier.js", scriptFile);

    SP.SOD.executeFunc('formModifier.js', null, function () {
        pbPageModificationFunc();
    });
});
