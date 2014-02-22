

var createTab = new function () {

    this.tab = false;
    this.tabs = [];


    this.createTabs = function () {
        if (tabs.mainTabs.length > 0) {
            $("#clear").show();
            for (var i = 0; i < tabs.mainTabs.length; i++) {
                $("#mainTabs").append('<li> <a href="#tabs-' + i + '">' + tabs.mainTabs[i].category + '</a></li>');
                $("#tabs").append('<div id = "tabs-' + i + '"><div id="' + tabs.mainTabs[i].category + '"><ul id = "list' + tabs.mainTabs[i].category + '"></ul></div></div>');
            }

            for (var i = 0; i < tabs.mainTabs.length; i++) {
                for (var j = 0; j < tabs.mainTabs[i].elements.length; j++) {
                    $("#" + tabs.mainTabs[i].category + " ul").append('<li><a href="#' + tabs.mainTabs[i].category + '-' + j + '"> ' + tabs.mainTabs[i].elements[j].shortText + ' </a></li>');
                    $("#" + tabs.mainTabs[i].category).append('<div id="' + tabs.mainTabs[i].category + '-' + j + '"><div id="' + tabs.mainTabs[i].elements[j].imageId + '"></div></div>');
                }
                this.tabs.push(tabs.mainTabs[i].category);
                if (tabs.mainTabs[i].elements.length > 2) {
                    $("#" + tabs.mainTabs[i].category).tabs();
                    this.addScroolBar("list" + tabs.mainTabs[i].category);
                } else {
                    $("#" + tabs.mainTabs[i].category).tabs()
                }
            }
            this.tab = true;
            $("#tabs").tabs();
            this.addMainScroolBar();            
            if (tabs.mainTabs.length > 1) {
                $("#refreshText").val("#tabs-1");
                tabs.mainTabs[1].elements[0].setText();
                tabs.mainTabs[1].elements[0].putImages(tabs.mainTabs[1].category);
                $("#tabs").tabs({ active: 1 });
            } else {
                $("#refreshText").val("#tabs-0");
                tabs.mainTabs[0].elements[0].setText();
                tabs.mainTabs[0].elements[0].putImages(tabs.mainTabs[0].category);
            }
        }
    }

    this.changeTabName = function (category, shortText, tabname) {
        $("#" + category + ' a[href="#' + tabname + '"]').text(shortText);
        $("#" + category).tabs("refresh");
    }


    this.eraseTab = function () {
        if (this.tab) {
            $("#tabs").tabs("destroy");
            this.tab = false;
        }
        for (var i = 0; i < this.tabs.length; i++) {
            $("#" + this.tabs[i]).tabs("destroy");
        }
        this.tabs = [];
        images.clearAllImages();
        $("#tabs").empty();
        $("#tabs").html('<ul id = "mainTabs"></ul>');
    }

    this.addScroolBar = function (name) {
        var $tabsCont = $('#' + name);
        $tabs = $tabsCont.children();


        var sum = 0;
        for (var k = 0; k < $tabs.length; k++) {
            sum += $('#' + name + ' li:eq(' + k + ')').width();
        }

        $tabsCont.wrap('<div class="tab_cont_wrapper"></div>');
        $tabsCont.width(sum + 50);
        $tabsCont.height($tabs.first().height());
    }

    this.addMainScroolBar = function () {
        var $tabsCont = $('#mainTabs');
        $tabs = $tabsCont.children();


        var sum = 0;
        for (var k = 0; k < $tabs.length; k++) {
            sum += $('#mainTabs li:eq(' + k + ')').width();
        }

        $tabsCont.wrap('<div class="tab_cont_wrapper"></div>');
        $tabsCont.width(sum);
        $tabsCont.height($tabs.first().height());
    }
}