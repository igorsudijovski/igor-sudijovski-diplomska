/// <reference path="GetImages.js" />
var cursor = new function () {
    this.labels = [];
    this.index = 0;
}
var searchQuery = new function () {
    this.baseUrl = function (query) {
        return "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&start=0&q=" + query + "&callback=service.processResults";
    };

    this.serviceURL = function (query, start) {
        return "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&start=" + start + "&q=" + query + "&callback=service.processNewResults";
    };
}
var service = new function () {
    this.query = "";
    this.currentImage = "";

    this.getImages = function (query, tabname, name) {
        if (this.currentImage == "") {
            cursor.labels = [];
            cursor.index = 0;
            if (!images.imageExists(name)) {
                images.addTabImage(name, tabname);
                this.query = query;
                this.currentImage = name;
                images.setImageName(name);
                factory.addCallbackScript(searchQuery.baseUrl(query));
            }
        } else if (!images.imageExists(name)) {
            app.showNotification("Please wait", "Loading images from previous tab. Press refresh after 3-4 seconds.");
            $("#refresh").show();
        }
        /*images.clearAll();
        searchQuery.query = query;
        factory.addCallbackScript(searchQuery.baseUrl(query));*/
    };
    
    this.processResults = function (data) {
        if (data.responseStatus == 200 && data.responseData.results.length != 0) {
            images.showImages(data);
            $.each(data.responseData.cursor.pages, function (i, indexes) {
                cursor.labels.push(parseInt(indexes.start));
            });
            cursor.index = 1;
            factory.addCallbackScript(searchQuery.serviceURL(this.query, cursor.labels[cursor.index]));
        } else {
            images.deleteImages(this.currentImage);
            this.currentImage = "";
            if (data.responseStatus != 200) {
                app.showNotification("Error occurred. Try again later.", data.responseDetails);
            } else {
                app.showNotification("Empty", "There is no images for that search. Try again with new query.");
            }
        }
    }
    this.processNewResults = function (data) {
        images.showImages(data);
        cursor.index = cursor.index + 1;
        if (cursor.index < cursor.labels.length) {
            factory.addCallbackScript(searchQuery.serviceURL(this.query, cursor.labels[cursor.index]));
        } else {
            this.currentImage = "";
        }
    }
};


