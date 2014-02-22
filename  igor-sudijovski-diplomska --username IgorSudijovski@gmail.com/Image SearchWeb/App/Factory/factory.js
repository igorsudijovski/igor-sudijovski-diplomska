var factory = new function () {

    this.addCallbackScript = function (url) {
        $("#callback").remove();
        var script = document.createElement("script");
        script.setAttribute("src", url);
        script.setAttribute("id", "callback");
        document.getElementsByTagName('head')[0].appendChild(script);
    }
    this.putImageInContext = function (url, height, width,id) {
        if (this.isWordDocument()) {
            this.putImageInContextWord(url, height, width);
        } else {
            $("body").append('<div id="copyed' + id + '"><img  src="' + url + '" /> </div>');
            this.putImageInContextPowerPoint("copyed" + id);
            $("#copyed" + id).remove();
        }
    }

    this.putImageInContextWord = function (url, height, width) {
        var img = '<img height="' + height + '" width="' + width + '" src="' + url + '"/>';
        var options = { coercionType: Office.CoercionType.Html };
        Office.context.document.setSelectedDataAsync(
            img, options,
            function (asyncResult) {
                if (asyncResult.status == "failed") {
                    app.showNotification('Error:', asyncResult.error.message);
                }
            });
    }

    this.putImageInContextPowerPoint = function (imgId) {
        var imgControl = document.getElementById(imgId);
        imgControl.contentEditable = 'true';
        var controlRange;

        if (document.body.createControlRange) {
            controlRange = document.body.createControlRange();
            controlRange.addElement(imgControl);
            controlRange.execCommand('Copy');
        }
        imgControl.contentEditable = 'false';
        app.showNotification("Copied", "The image is copied in your clipboard. To show in your presentation paste there.");
    }
    this.checkDimension = function (basic, max) {
        var intRegex = /^\d+$/;
        if (intRegex.test(basic)) {
            var b = parseInt(basic);
            if (b < max && b > 0) {
                return b;
            }
        }
        return max;
    }

    this.makeIdForHtml = function (name) {
        return name.toLowerCase().replace(/\s/g, "");
    }

    this.trancate = function (str) {
        if (str.length > 8) {
            return str.substring(0, 5) + '...';
        } else {
            return str;
        }
    }

    this.isWordDocument = function () {
        if (Office.CoercionType.Html) {
            return true;
        } else {
            return false;
        }
    }
}