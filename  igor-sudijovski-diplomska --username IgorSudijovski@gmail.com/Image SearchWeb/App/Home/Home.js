(function () {
    "use strict";

    // The initialize function must be run each time a new page is loaded
    Office.initialize = function (reason) {
        $(document).ready(function () {
            if (factory.isWordDocument()) {
                $("#insertImg").text("Insert");                
            } else {
                $("#insertImg").text("Copy");
                $("#content-header").css("background", "#D24726");
                $("#width").attr("disabled", true);
                $("#height").prop("disabled", true);
            }
            $("body").bind("mousewheel", function (e) {
                $('#popup-msg').hide("fast");
            });
            app.initialize();
            $('#refresh').hide();
            $('#refresh').click(function (e) {
                $('#refresh').hide();
                var link = $("#refreshText").val();
                $('#notification-message').hide();
                clickToTab(link,null);
                
            });
            $("#clear").hide();
            $("#clear").click(function (e) {
                if (service.currentImage == "") {
                    tabs.empty();
                    $('#notification-message').hide();
                    createTab.eraseTab();
                    $("#search").val("");
                    $("#clear").hide();
                    $("#refresh").hide();
                } else {
                    app.showNotification("Wait", "Please wait first to load all images in current tab");
                }
            });
            $('#searchbutton').click(getData);
            $('#analyseText').click(textAnalize);
            $('#popup-msg').hide();
            $("#insertImg").click(function () {
                $("#popup-msg").hide("fast");
                var url = $("#imgId").val();
                var width = $("#width").val();
                var height = $("#height").val();
                var maxWidth = $("#max-width").val();
                var maxHeight = $("#max-height").val();
                var imgId = $("#theImgId").val();
                width = factory.checkDimension(width, maxWidth);
                height = factory.checkDimension(height, maxHeight);
                factory.putImageInContext(url, height, width, imgId);
            });
            var clicks = 0;

            $('#tabs .image img').live({
                click: function (e) {
                    var node = $(this);
                    var tabname = node.attr("name");
                    clicks++;
                    var coordinateX = e.pageX
                    var coordinateY = e.pageY
                    var img = images.getImageById($(this).parent().attr("id"), tabname);
                    if (clicks == 1) {
                        setTimeout(function (k) {
                            if (clicks == 1) {                                
                                $("#imgId").val(img.url);
                                $("#width").val(img.width);
                                $("#height").val(img.height);
                                $("#max-width").val(img.width);
                                $("#max-height").val(img.height);
                                $("#theImgId").val(img.imgId);
                                if ($("#popup-msg").is(":visible") == true) {
                                    $("#popup-msg").hide();
                                }
                                $("#popup-msg").css({ 'top': coordinateY, 'left': coordinateX }).show("slow");
                            } else {
                                factory.putImageInContext(img.url, img.height, img.width, img.imgId);
                            }
                            clicks = 0;
                        }, 300);
                    }
                }
            });
            $(document).mouseup(function (e) {
                var container = $(".image img");
                var container2 = $("#popup-msg");
                if (!container.is(e.target) // if the target of the click isn't the container...
                    && container.has(e.target).length === 0
                    && !container2.is(e.target)
                    && container2.has(e.target).length === 0) // ... nor a descendant of the container
                {
                    $("#popup-msg").hide("fast");
                }
            });
            //$("#tabs").tabs().scrollabletab();;
            //$("#kazablanka").tabs().scrollabletab();;
            $("#tabs").on('click','a[href^="#"]',function (e) {
                var href = $(this).attr("href");
                $("#refresh").hide();
                clickToTab(href,null);
            });
        });
    };

    Array.prototype.remove = function (from, to) {
        var rest = this.slice((to || from) + 1 || this.length);
        this.length = from < 0 ? this.length + from : from;
        return this.push.apply(this, rest);
    };


    function getData() {
        var selectedValue = "";
        selectedValue = $("#search").val();
        if (service.currentImage == "") {
            if (selectedValue.length < 100) {
                if (selectedValue != "") {
                    if (tabs.mainTabs.length == 0) {
                        tabs.addEntity("MySearch", 100, selectedValue);
                        createTab.eraseTab();
                        createTab.createTabs();
                    } else {
                        clickToTab("#tabs-0", selectedValue);
                        $("#tabs").tabs({ active: 0 });
                    }
                }
            } else {
                app.showNotification("ERROR", "Long search string, please input smaller string");
            }
        } else {
            app.showNotification("Wait", "Please wait first to load all images in current tab");
            $("#refresh").show();
        }
    } 

    function textAnalize() {
        Office.context.document.getSelectedDataAsync(Office.CoercionType.Text, function (result) {
            if (result.status == Office.AsyncResultStatus.Succeeded) {
                var text = result.value.replace(/\r/, "").replace(/\n/, "");
                
                text = encodeURIComponent(text);
                analizator.analize(text);
            }               
        });
    }

    function clickToTab(link, changedText) {
        $("#refreshText").val(link);
        var href = link.replace("#", "");
        var name = href.split("-");
        if (name[0] == "tabs") {
            var index = parseInt(name[1]);
            var category = tabs.getCategoryByIndex(index);
            if (changedText != undefined && changedText != null && changedText != "" && changedText != category.elements[0].searchText) {
                images.deleteImages(category.elements[0].imageId);
                category.elements[0].changeSearchText(changedText, category.category);
            }
            category.elements[0].setText();
            category.elements[0].putImages(category.category);

        } else {
            var index = parseInt(name[1]);
            var category = tabs.getCategoryByName(name[0]);
            if (changedText != undefined && changedText != null && changedText != "" && changedText != category.elements[index].searchText) {
                images.deleteImages(category.elements[index].imageId);
                category.elements[index].changeSearchText(changedText, category.category);
            }
            category.elements[index].setText();
            category.elements[index].putImages(category.category);
        }
    }

})();


