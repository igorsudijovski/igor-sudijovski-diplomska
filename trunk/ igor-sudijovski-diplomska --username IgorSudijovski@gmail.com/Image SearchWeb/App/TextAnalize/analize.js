var analizator = new function () {
    
    this.analize = function (text) {
        factory.addCallbackScript('https://access.alchemyapi.com/calls/text/TextGetRankedNamedEntities?jsonp=analizator.analizeText&apikey=a788ae67c0770b3eb652c6433b1286894a4a7c69&outputMode=json&text=' + text);
    };

    this.analizeText = function (data) {
        if (data.status == "OK") {
            tabs.empty();
            var textSearch = "Power Point";
            if (factory.isWordDocument()) {
                textSearch = "Word";
            }
            tabs.addEntity("MySearch", 100, textSearch);
            $.each(data.entities, function (i, entity) {
                tabs.addEntity(entity.type, entity.relevance, entity.text);
            });
            createTab.eraseTab();
            createTab.createTabs();
        } else {
            app.showNotification("Analize test error", data.statusInfo);
        }
    }
};

var tabs = new function () {
    this.mainTabs = [];

    this.addEntity = function (type, relevance, text) {
        var categoryExsits = -1;
        var shortText = factory.trancate(text);
        for (var i = 0; i < this.mainTabs.length; i++) {
            if (this.mainTabs[i].category == type) {
                categoryExsits = i;
            }
        }
        if (categoryExsits == -1) {
            var e = new Elements(0, text, shortText, relevance);
            var c = new Category(this.mainTabs.length, type);
            c.addElement(e);
            this.mainTabs.push(c);
        } else {
            this.mainTabs[categoryExsits].addElementfull(text, shortText, relevance);
        }        
    }

    this.getCategoryByIndex = function (index) {
        return this.mainTabs[index];
    }

    this.getCategoryByName = function (category) {
        for (var i = 0; i < this.mainTabs.length; i++) {
            if (this.mainTabs[i].category == category) {
                return this.mainTabs[i];
            }
        }
        return null;
    }

    this.empty = function () {
        this.mainTabs = [];
    }


}

function Category(tabNumber, category) {
    this.tabNumber = tabNumber;
    this.category = category;
    this.elements = [];

    this.addElement = function (el) {
        this.elements.push(el);
    }

    this.addElementfull = function (text ,shortText, relevance) {
        var e = new Elements(this.elements.length, text, shortText, relevance);
        this.elements.push(e);
    }
}

function Elements(tabNumber, searchText, shortText, relevance) {
    this.tabNumber = tabNumber;
    this.searchText = searchText;
    this.shortText = shortText;
    this.relevance = relevance;
    this.imageId = factory.makeIdForHtml(searchText);

    this.setText = function () {
        $("#search").val(this.searchText);
    }

    this.putImages = function (category) {
        var tabname = category + "-" + this.tabNumber;
        service.getImages(this.searchText, tabname, this.imageId);
    }

    this.changeSearchText = function (text,category) {
        this.searchText = text;
        this.shortText = factory.trancate(text);
        this.relevance = 100;
        var tabname = category + "-" + this.tabNumber;
        createTab.changeTabName(category, this.shortText, tabname);
    }
}

