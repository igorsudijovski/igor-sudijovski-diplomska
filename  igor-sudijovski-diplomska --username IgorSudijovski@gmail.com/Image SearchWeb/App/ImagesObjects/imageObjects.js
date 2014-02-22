function Image(name) {
    this.url = "";
    this.tburl = "";
    this.title = "";
    this.width = 0;
    this.height = 0;
    this.tbwidth = 0;
    this.tbheight = 0;
    this.imgId = "";
    this.name = name;
    this.show = function () {
        $("#" + this.name).append(this.drawImage(this.imgId, this.tburl, this.title, this.name));
    }
    this.drawImage = function (id, src, title, nameImg) {
        return '<div class="image" id="' + id + '"><img id="img' + id + '" name="' + nameImg + '" style="cursor:pointer" src="' + src + '"/><span>' + title + '</span></div>';
    }
    /*this.drawImage = function (id, src, title, nameImg) {
        return '<div class="image" id="' + id + '"><a href = "' + this.url + '"><img name="' + nameImg + '" style="cursor:pointer" src="' + src + '"/></a> <span> ' + title + '</span></div>';
    }
    this.drawImage = function (id, src, title, nameImg) {
        return '<div style="height:10px;width:10px" class="image" id="' + id + '"><img id="img' + id + '" name="' + nameImg + '" style="cursor:pointer" src="' + src + '"/><span>' + title + '</span></div>';
    }*/
}

var Tabimages = function (name, tabname) {
    this.name = name;
    this.tabname = tabname;
    this.imagesInHtml = [];
    this.imagesToPutInHtml = [];

    this.putImage = function (url, tburl, title, width, height, tbwidth, tbheight, imgId) {
        var img = new Image(this.name);
        img.url = url;
        img.tburl = tburl;
        img.title = title;
        img.width = width;
        img.height = height;
        img.tbwidth = tbwidth;
        img.tbheight = tbheight;
        img.imgId = imgId;
        this.imagesToPutInHtml.push(img);
    }

    this.imagesToHtml = function () {
        for (var i = 0; i < this.imagesToPutInHtml.length; i++) {
            this.imagesInHtml.push(this.imagesToPutInHtml[i]);
            this.imagesToPutInHtml[i].show();
        }
        this.imagesToPutInHtml = [];
    }
    this.clearAll = function () {
        $("#" + this.name).remove();
        $("#" + this.tabname).html('<div id="' + this.name + '" ></div>');
        this.imagesInHtml = [];
    }
    this.getImageById = function (id) {
        for (var i = 0; i < this.imagesInHtml.length; i++) {
            if (this.imagesInHtml[i].imgId == id) {
                return this.imagesInHtml[i];
                this.imagesToHtml
            }
        }
        return null;
    }
    this.showImages = function (data) {
        var img = this;
        if (data.responseStatus == 200) {
            $.each(data.responseData.results, function (i, datavalue) {
                var width = parseInt(datavalue.width);
                var height = parseInt(datavalue.height);
                var tbWidth = parseInt(datavalue.tbWidth);
                var tbHeight = parseInt(datavalue.tbHeight);

                img.putImage(datavalue.url, datavalue.tbUrl, datavalue.title, width, height, tbWidth, tbHeight, datavalue.imageId);
            });
            this.imagesToHtml();
        }
    }
}

var images = new function () {
    
    this.imageName = "";
    this.tabImages = [];

    this.setImageName = function (name) {
        this.imageName = name;
    }

    this.imageExists = function (name) {
        for (var i = 0; i < this.tabImages.length; i++) {
            if (this.tabImages[i].name == name) {
                return true;
            }
        }
        return false;
    }

    this.getTabImage = function (name) {
        for (var i = 0; i < this.tabImages.length; i++) {
            if (this.tabImages[i].name == name) {
                return this.tabImages[i];
            }
        }
        return null;
    }

    this.addTabImage = function (name, tabname) {
        this.tabImages.push(new Tabimages(name, tabname));
    }

    this.putImage = function (url, tburl, title, width, height, tbwidth, tbheight, imgId) {

        this.getTabImage(this.imageName).putImage(url, tburl, title, width, height, tbwidth, tbheight, imgId);
    }

    this.imagesToHtml = function () {
        this.getTabImage(this.imageName).imagesToHtml();
    }
    this.clearAll = function () {
        this.getTabImage(this.imageName).clearAll();
    }

    this.clearAllImages = function () {
        for (var i = 0; i < this.tabImages.length; i++) {
            delete this.tabImages[i];
        }
        this.tabImages = [];
    }

    this.deleteImages = function (name) {
        for (var i = 0; i < this.tabImages.length; i++) {
            if (this.tabImages[i].name == name) {
                this.tabImages[i].clearAll();
                this.tabImages.remove(i);
                break;
            }
        }
    }
    this.getImageById = function (id, img) {
        return this.getTabImage(img).getImageById(id);
    }
    this.showImages = function (data) {
        this.getTabImage(this.imageName).showImages(data);
    }

    this.deleteElement = function (index) {
        var tmplist = [];
        for (var i = 0; i < this.tabImages.length; i++) {
            if (i != index) {
                tmplist.push(this.tabImages[i]);
            }
        }
        this.tabImages = [];
        this.tabImages = tmplist;
    }
}