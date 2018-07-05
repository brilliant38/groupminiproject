/**
 * 
 */
(function($, win, doc) {
    "use strict";

    var $win = $(win),
        $doc = $(doc);

    //gnb �⑥닔 異붽�  
    $.GNB = {};
    $.GNB.init = function() {
        //gnb �ㅽ겕由쏀듃 珥덇린��
        var gnb = new GNB();
    };

    //�명뫗諛뺤뒪 泥댄겕 �⑥닔 
    // @parameter type: input ���� , idx : �쒓렇 �쒖꽌, bChked: 泥댄겕 �щ� 
    win.commonJs = {};
    var commonJs = win.commonJs;

    commonJs.checkBoxCall = function(type, idx, bChked) {
        var checkInput = $('input[type="' + type + '"]').eq(idx);
        var getName = checkInput.attr('name'),
            $siblings = $('[name="' + getName + '"]');

        if (checkInput.attr('type').toUpperCase() === 'RADIO') {
            $siblings.closest('.formWrap').removeClass('on');
            $siblings.attr('checked', false);
        }

        if (bChked) {
            checkInput.closest('.formWrap').addClass('on');
            checkInput.attr('checked', true);
        } else {
            checkInput.closest('.formWrap').removeClass('on');
            checkInput.attr('checked', false);
        }
    }
    commonJs.centerMove = function() {
        var docHeight = $(window).height();
        var innerPopHeight = docHeight - 101;
        var isScroll = false;
        $(".LayerPopWrap").each(function() {
            var popHeight = $(this).outerHeight();
            if (innerPopHeight <= popHeight) {
                isScroll = true;
                $(this).css("width", "620px");
                $(this).find(".popCont").css({
                    "overflow-y": "auto",
                    "overflow-x": "hidden",
                    height: innerPopHeight
                });
            }
            $.util.center(this);
        });
    }
   
    commonJs.errorFocus = function(obj) {
    	obj.focus();
    	obj.addClass("errorFocus"); 
    };
    


    commonJs.findFocusElements = function(target) {
        //div[tabindex="0"], a, button, input, textarea
        return target.find('div[tabindex="0"], a, button, input, textarea, select');
    };
    
    commonJs.firstTargetFocus = function(target) {
        var $target = $(target),
            i = 0,
            getFirstChild = (function getFirstChild(elem) {
                var $elem = $(elem),
                    getChildren = null;
                                    
                if($elem.children().length > 0) {
                    getChildren = $elem.children().eq(0);
                    
                    if(getChildren.hasClass('hidden') || getChildren.is(':hidden')) {
                        getChildren = getChildren.next();
                    }
                    return getFirstChild(getChildren);
                } else {
                    return $elem;
                }
            }($target));
        
        // outline �놁빊
        // getFirstChild.css('outline', 'none');
        // android �ъ빱�ㅻ� �꾪븳 �띿꽦
        getFirstChild.attr('tabindex', '0');
        // �ъ빱�� �대룞
        getFirstChild.focus();
        // getFirstChild.off('focusout.goFocus');
        // getFirstChild.on('focusout.goFocus', function() {
            // $(this).removeAttr('tabindex');
        // });
        return $target;
    };
    commonJs.saveTarget = [];
    commonJs.saveTop = 0;
    //硫붿씤 �앹뾽 �닿린 
    commonJs.openMainPop = function(popId, positionX, postionY) {
    	//�앹뾽 �リ린 
    	$("#"+popId).find(".close").off("click").on("click", function() {
        	var mainPopId = $("#close").closest(".mainPopWrap").attr("id");
            if ($("#"+popId).find("input").is(":checked") == true) {
                setCookie(popId, "Y", 1);
            }
            $("#"+popId).hide();            
        });
    	
    	//荑좏궎 �ㅼ젙 �щ��� �곕씪 �앹뾽 蹂댁뿬二쇨린 
        if (getCookie(popId) != "Y") {
            $('#' + popId).show();
            //�묎렐�� �ъ빱�� 異붽� 
            $('#' + popId).attr("tabindex", 0).focus();
        } else {
            $('#' + popId).hide();
        }
        
        //�앹뾽 �꾩튂 �ㅼ젙
        $('#' + popId).css({
            'top': Number(positionX),
            'left': Number(postionY),
            'z-index': '10000'
        })
    }; 
    
    //荑좉린�ㅼ젙
    function setCookie(name, value, expiredays) { // 荑좏궎�� �대쫫怨� 媛� 洹몃━怨� 荑좏궎媛� 醫낅즺�섎뒗 �좎쭨瑜� �ㅼ젙 �⑸땲��.
    	var today = new Date();
    	    today.setDate(today.getDate() + expiredays);
    	// �좎쭨瑜� �ㅼ젙�섍린 �꾪빐 setDate硫붿냼�쒕� �ъ슜�섏뿬 getDate�� "��"�� 醫낅즺�� �섎（ "1" �� �뷀빀�덈떎.
    	 document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + ';'
    	//荑좏궎瑜� ���μ떆 �대쫫怨� 媛믪쓣 �띿쓣 �대（怨� 洹몃━怨� 荑좏궎瑜� �ъ슜�� 臾몄꽌�� �꾩튂瑜� �뺥븯怨� 醫낅즺�쇱� GMT �쒓컙�쇰줈 �⑸땲��.
	}
	
	function getCookie(key) { //荑좏궎 媛� �살뼱�ㅺ린
        var results = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
        if (results) {
            return (unescape(results[2]));
        } else {
            return undefined;
        }
    }
    //GNB 媛앹껜
    //�묎렐�� focus 
    function GNB() {
        var header = $('header'),
            $gnb = $('nav>ul'),
            $gnbLi = $gnb.find('>li>a'), // gnb  硫붾돱
            $menuWrap = $gnbLi.next(".sub"), // gnb sub 硫붾돱 
            idx = -1,
            totalElmLength = 0,
            timer = null,
            totalMenuSub = $("nav .totalMenu .btnOpen"), //�꾩껜硫붾돱 踰꾪듉 
            isActiveHeader = false;

        //�뚯궗 �뚭컻 �섏씠吏��� ��긽 gnb 硫붾돱 遺덊닾紐� �섍쾶 �좎� 
        if ($(location).attr('pathname').indexOf("company") != -1) {
            isActiveHeader = true;
        }
        
        function removeMainClass() {
            if ($(document).scrollTop() == 0) {
                $("header").removeClass("main");
            }
        }

        function addMainClass() {
            if ($(document).scrollTop() == 0) {
                $("header").addClass("main");
            }
        }
        
        // header �대깽�� 
        if (!isActiveHeader) {
            header.on({
                mouseenter: function() {
                    //gnb 硫붾돱 遺덊닾紐� css 異붽� 
                	removeMainClass(); 
                },
                mouseleave: function() {
                    //gnb硫붾돱 遺덊닾紐� css �쒓굅 
                	addMainClass();
                },
                focusin: function() {
                    //gnb 硫붾돱 遺덊닾紐� css 異붽� 
                	removeMainClass();
                },
                focusout: function() {
                    //gnb硫붾돱 遺덊닾紐� css �쒓굅 
                	addMainClass();
                }
            })

            $gnbLi.on({
                mouseenter: function() {
                	removeMainClass();
                }
            });
            //gnb sub 硫붾돱 �대깽��
            $menuWrap.on({
                mouseenter: function() {
                    //gnb 硫붾돱 遺덊닾紐� css 異붽� 
                	removeMainClass();
                },
                mouseleave: function() {
                    //gnb 硫붾돱 遺덊닾紐� css �쒓굅 
                	addMainClass();
                }
            })
        }


        //gnb 硫붾돱 �대깽��
        $gnbLi.on({
            focusin: function(e) {
                idx = $(this).closest("li").index();                
                openList(idx);
            },
            keydown: function(ev) {
                // back space event
                if (ev.shiftKey == true && ev.keyCode == 9) {
                    var prevElm = $(this).closest("li").prev("li");
                    var prevSub = prevElm.find(".sub");
                    var prevElmIex = prevElm.index();

                    if (prevElm.length > 0 && prevSub.length > 0) {
                        //�댁쟾 �� �닿린 
                        openList(prevElmIex);
                        prevSub.last().find("a").attr("tabindex", 0).focus();
                        ev.preventDefault();
                    } else {
                        hideList();
                    }
                }

            },
            mouseenter: function() {
                //�쒕툕 硫붾돱 �닿린 
                idx = $(this).closest("li").index();
                openList(idx);
            },
            mouseleave: function() {
                //�쒕툕 硫붾돱 �リ린 
                hideList();

            }
        });

        //gnb sub 硫붾돱 �대깽��
        $menuWrap.on({
            mouseenter: function() {
                //gnb 硫붾돱 �닿린 
                idx = $(this).closest("li").index();
                openList(idx);
            },
            mouseleave: function() {
                //gnb 硫붾돱 �リ린 
                hideList();

            },
        });
        
        //�꾩껜 硫붾돱 踰꾪듉 �대깽��
        totalMenuSub.on({
        	focusin: function(ev){
        		hideList();
        	},
        	keydown: function(ev) {
        		// back space event
        		var prevElm = $("nav>ul>li").last(),
        		prevSub = prevElm.find(".sub");
        		if (ev.shiftKey == true && ev.keyCode == 9) {
        			//�댁쟾 �� �닿린
        			openList($("nav>ul>li").length-1);    
        			prevSub.last().find("a").attr("tabindex", 0).focus();
        			ev.preventDefault();
        		}
        	}
        })
        
    }

    //gnb sub 硫붾돱 �닿린
    function openList(idx) {
        var $gnb = $('nav>ul'),
            $gnbLi = $gnb.find('>li>a'), // gnb  硫붾돱
            $menuWrap = $gnbLi.next(".sub"); // gnb sub 硫붾돱 

        hideList();
        $gnbLi.eq(idx).closest("li").addClass("on");

        //�섏쐞 硫붾돱媛� �덉쓣 寃쎌슦�먮쭔 �쒖꽦�� 
        if ($menuWrap.eq(idx).length > 0) {
            $menuWrap.eq(idx).show();
        }
    }


    //gnb sub 硫붾돱 �닿린
    function hideList() {
        var $gnb = $('nav>ul'),
            $gnbLi = $gnb.find('>li>a'), // gnb  硫붾돱
            $menuWrap = $gnbLi.next(".sub"); // gnb sub 硫붾돱 
        $gnbLi.closest("li").siblings().removeClass('on');
        $menuWrap.hide();
    }

    // �덉씠�� �앹뾽 �ㅼ젙 
    $.extend($, {
        util: {
            jquery: function(el) {
                return el.jquery ? el : $(el);
            },
            center: function($el) {
                $el = $.util.jquery($el);


                var n = $el.height() / 2;
                $el.css({
                    position: 'fixed',
                    top: '50%',
                    'margin-top': -n + 'px'
                });

                return this;
            },
            forEachArray: function(list, fn) {
                for (var i = 0, item; item = list[i]; i++) {
                    if (fn(item, i, list) === false) {
                        break;
                    }
                }

                return this;
            }
        },
        popup: function(action, options) {
            switch (action) {
                case 'open':
                    openPopup(options);
                    break;
                case 'close':
                    closePopup();
                    break;
            }
        }
    });

    // �앹뾽 湲곕낯媛�  
    $.popup.defaults = {
        onOpen: function() {},
        onClose: function(remove) {
            remove();
        }
    };

    $.popup.popups = [];

    /**
     * �앹뾽 �앹꽦
     * @param {Number} options.templateId layerPopup Id
     * @param {String} options.wrapper layerPopup parent selector
     * @param {jQuery | HTMLElement} options.appendTop
     * @param {jQuery | HTMLElement} options.appendCont
     */
    function createLayerPopup(options) {
        var $layerWrap = $('<div id="' + options.templateId + '" class="LayerPopWrap" />'),
            $popTop = $('<div class="popTop"><h1 /></div>'),
            $popCont = $('<div class="popCont" />');

        if ($('#' + options.templateId).length > 0) {
            return;
        }

        $layerWrap.append($popTop);
        $layerWrap.append($popCont);
        
        $popTop.find("h1").append(options.appendTop);
        $popCont.append(options.appendCont);
        $popCont.after('<a href="#" class="popClose">�リ린</a>');

        $(options.wrapper).append($layerWrap);
       
    }

    function focusOutClosePop(lastFocus) {
        $(".popTop").off('keydown').on('keydown', function(ev) {
            // back space event
            if (ev.shiftKey == true && ev.keyCode == 9) {
                lastFocus.focus();
                $.popup('close');
                var oPopup = getTopPopup();
                if ($.popup.popups.length > 0) {
                    oPopup.$target.show();
                    lastFocus.focus();
                }
                ev.preventDefault();
            }
        });
        $(".popClose").off('keydown').on('keydown', function(ev) {
            // back space event
            if (ev.keyCode == 9) {
                lastFocus.focus();
                $.popup('close');
                var oPopup = getTopPopup();
                if ($.popup.popups.length > 0) {
                    oPopup.$target.show();
                    lastFocus.focus();
                }
                ev.preventDefault();
            }
        });
    }


    // �앹뾽 �닿린 
    function openPopup(options) {
        options = $.extend({}, $.popup.defaults, options);
        if ($('#' + options.id).css('display') == "block") {
            return false;
        }

        // 紐⑤컮�� �붾㈃ �댁긽��
        $("body").css({ "overflow": "hidden" });
        var oPopCont;
        var popLength = $.popup.popups.length;

        // �ㅼ쨷 �앹뾽 �� 寃쎌슦 吏��곌퀬 湲곗〈 �앹뾽 媛먯텛怨� �쒖옉
        if (popLength > 0 && options.parentPop) {
            options.parentPop.hide();
        }

        var oItemPop = {
            "item_select_1_popup": {
                'appendTop': '�섎쪟 �곕젮�곹뭹 �좏깮 �숈쓽',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_1_1.jpg" alt=""></span>�댄뭹�� 蹂댁엫' +
                    '<br>(醫낆씠 �쇳븨諛�)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_1_2.jpg" alt=""></span>�⑺룷��</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_1_3.jpg" alt=""></span>諛뺤뒪 �ъ옣' +
                    '<br>�� �� 罹먮━��</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_1_4.jpg" alt=""></span>�댄뭹�� 蹂댁엫</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>�댁슜遺덇��곹뭹</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>�좊━瑜� / �ш린瑜� / �꾪겕由댁젣�� / 臾쇳뭹媛��� 100留뚯썝 �댁긽 / �꾧툑 / �좊텇利� / �ш텒 / �덉닠�� / �댁븘�덈뒗 �숇Ъ / �ъ옣�섏� �딆� �곹뭹 / �� 蹂��� 湲몄씠 1m珥덇낵 / �꾩껜�섎젅 1.6m珥덇낵 / �≪껜瑜� / 以묐웾 30kg 珥덇낵 ��</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>二쇱쓽�ы빆</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">�고렪踰� ��2議� 3��뿉 洹쒖젙�섏뼱 �덈뒗 �쒖떊 / �쒕쪟(��:�몄�, �쒕쪟) �깆씠 �ы븿�섏뼱�덈뒗 寃쎌슦, 李쎌쓣 �リ퀬 �쒖떊 / �쒕쪟 �덈ぉ�� �ㅼ떆 �좏깮�섏뿬 二쇱떗�쒖삤.</em></li>' +
                    '<li>�ъ쭊怨� 媛숈씠 �ъ옣�� 遺��ㅽ븳 寃쎌슦 <em class="fc2">"�섍굅�섏� �딆뒿�덈떎."</em></li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">�곴린 �쒗뭹 �댁쇅�� <em class="fc1">�뚯넀 �곕젮媛� �덈뒗 �좊━ �깆쓽 �쒗뭹</em>�� �ㅼ뼱�덉뒿�덇퉴?</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">�곕젮�곹뭹 �ы븿</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">�곕젮�곹뭹 �놁쓬</a>' +
                    '</div>'
            },
            "item_select_2_popup": {
                'appendTop': '�쒖떊/�쒕쪟 �곕젮�곹뭹 �좏깮 �숈쓽',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_2_1.jpg" alt=""></span>�꾧툑</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_2_2.jpg" alt=""></span>�몄�遊됲닾</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_2_3.jpg" alt=""></span>�좉�利앷텒' +
                    '<br>(�곹뭹沅�, 怨듭뿰�곗폆)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_2_4.jpg" alt=""></span>�좊텇利�, �ш텒</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>�댁슜遺덇��곹뭹</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>�좊━瑜� / �ш린瑜� / �꾪겕由댁젣�� / 臾쇳뭹媛��� 100留뚯썝 �댁긽 / �꾧툑 / �좊텇利� / �ш텒 / �덉닠�� / �댁븘�덈뒗 �숇Ъ / �ъ옣�섏� �딆� �곹뭹 / �� 蹂��� 湲몄씠 1m珥덇낵 / �꾩껜�섎젅 1.6m珥덇낵 / �≪껜瑜� / 以묐웾 30kg 珥덇낵 ��</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>二쇱쓽�ы빆</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>�쒖떊/�쒕쪟 �곹뭹�� <em class="fc2">[�고렪踰�]</em> 洹쒖젙�� �섍굅�섏뿬 �댁엫�� �곗젙�⑸땲��.</li>' +
                    '<li>�ъ쭊怨� 媛숈� �곹뭹�� <em class="fc2">�덈� �묒닔 湲덉�</em>�대ŉ �ш퀬�� <em class="fc2">�ш퀬 諛곗긽湲덉븸 �곗젙�먯꽌 �쒖쇅</em>�⑸땲��.</li>' +
                    '</ul>' +
                    '<table class="tableType2 mt20">' +
                    '<caption>�곷┰�쇱옄, �곷┰�대깽��, �곷┰�ъ씤��, �뚮㈇�쇰줈 援ъ꽦�� �ъ씤�� �곷┰ �꾪솴 紐⑸줉</caption>' +
                    '<colgroup>' +
                    '<col style="width:33%">' +
                    '<col style="width:34%">' +
                    '<col style="width:33%">' +
                    '</colgroup>' +
                    '<thead>' +
                    '<tr>' +
                    '<th scope="col">以묐웾</th>' +
                    '<th scope="col">湲곕낯�댁엫</th>' +
                    '<th scope="col">鍮꾧퀬</th>' +
                    '</tr>' +
                    '</thead>' +
                    '<tbody>' +
                    '<tr>' +
                    '<td>350g �댄븯</td>' +
                    '<td>3,100��</td>' +
                    '<td><a href="#" class="icoSearch">�고렪踰�</a></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td>350g �댁긽</td>' +
                    '<td>2,800��</td>' +
                    '<td>Postbox 湲곕낯�댁엫</td>' +
                    '</tr>' +
                    '</tbody>' +
                    '</table>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '�쒖떊/�쒕쪟 �곹뭹�� 媛곸쥌 �댁엫�좎씤 �대깽�몄뿉�� �쒖쇅�⑸땲��.' +
                    '<br> (<em class="fc1">�쒕쪟遊됲닾</em>濡� �ъ옣�댁＜�쒓린 諛붾씪硫�, <em class="fc1">�몄�遊됲닾�� �묒닔 遺덇�</em>�⑸땲��.)' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">�곕젮�곹뭹 �ы븿</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">�곕젮�곹뭹 �놁쓬</a>' +
                    '</div>'
            },
            "item_select_3_popup": {
                'appendTop': '媛��꾩젣�덈쪟 �뚯넀硫댁콉 �좏깮 �숈쓽',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_3_1.jpg" alt=""></span>�ㅽ떚濡쒗뤌 諛뺤뒪��' +
                    '<br>�붾뱾由ъ� �딅룄濡� �ъ옣</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_3_2.jpg" alt=""></span>�ㅽ떚濡쒗뤌 諛뺤뒪��' +
                    '<br>寃ш퀬�섍쾶 �ъ옣</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_3_3.jpg" alt=""></span>而댄벂�� 蹂몄껜 �ъ옣 遺덈웾 �댄뭹 �꾩땐 遺덈웾</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_3_4.jpg" alt=""></span>�대��� �ъ옣 遺덈웾' +
                    '<br>�댄뭹 �꾩땐 遺덈웾</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>�댁슜遺덇��곹뭹</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>�좊━瑜� / �ш린瑜� / �꾪겕由댁젣�� / 臾쇳뭹媛��� 100留뚯썝 �댁긽 / �꾧툑 / �좊텇利� / �ш텒 / �덉닠�� / �댁븘�덈뒗 �숇Ъ / �ъ옣�섏� �딆� �곹뭹 / �� 蹂��� 湲몄씠 1m珥덇낵 / �꾩껜�섎젅 1.6m珥덇낵 / �≪껜瑜� / 以묐웾 30kg 珥덇낵 ��</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>二쇱쓽�ы빆</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">�고렪踰� ��2議� 3��뿉 洹쒖젙�섏뼱 �덈뒗 �쒖떊 / �쒕쪟(��:�몄�, �쒕쪟) �깆씠 �ы븿�섏뼱�덈뒗 寃쎌슦, 李쎌쓣 �リ퀬 �쒖떊 / �쒕쪟 �덈ぉ�� �ㅼ떆 �좏깮�섏뿬 二쇱떗�쒖삤.</em></li>' +
                    '<li>媛��꾩젣�덈쪟�� <em class="fc2">�쒗뭹異쒓퀬 �� �ъ옣�� 諛뺤뒪(�ㅽ떚濡쒗뤌 �ъ옣)</em>濡� �붾뱾由ъ� �딅룄濡� �ъ옣�섏뼱�� ��.' +
                    '<br> �곴린�� 媛숈씠 �ъ옣�섏� �딆� 寃쎌슦 �앸같湲곗궗 �섍굅 �� 吏묓븯 嫄곕��� �� �덉쓬</li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '�꾩땐�쒕줈 �ъ옣�섏뼱 �덉뼱�� �섎ŉ, <em class="fc1">�뚯넀硫댁콉(�앸같�� 梨낆엫 �놁쓬 �몄젙)��<br>' +
                    '�묒닔 媛���</em>�⑸땲��. �뚯넀硫댁콉�� �숈쓽�섏떆寃좎뒿�덇퉴?' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">�숈쓽�섏� �딆쓬</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">�숈쓽��</a>' +
                    '</div>' +
                    '<dl class="addCont">' +
                    '<dt>�뚯넀硫댁콉�대�?</dt>' +
                    '<dd>諛곗넚 以� �ъ옣遺��ㅻ줈 �명븳 �곹뭹�� 怨좎옣/�뚯넀�� ���섏뿬 �앸같�ъ쓽 諛곗긽梨낆엫�� 臾살� �딄쿋�ㅻ뒗 怨좉컼�� �뺤씤�낅땲��.</dd>' +
                    '</dl>'
            },
            "item_select_4_popup": {
                'appendTop': '怨쇱씪瑜� �묒닔遺덇� �덈ぉ�좏깮 �숈쓽',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_4_1.jpg" alt=""></span>�띿떆</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_4_2.jpg" alt=""></span>�щ룄</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_4_3.jpg" alt=""></span>�멸린</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_4_4.jpg" alt=""></span>蹂듭댂��</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>�댁슜遺덇��곹뭹</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>�좊━瑜� / �ш린瑜� / �꾪겕由댁젣�� / 臾쇳뭹媛��� 100留뚯썝 �댁긽 / �꾧툑 / �좊텇利� / �ш텒 / �덉닠�� / �댁븘�덈뒗 �숇Ъ / �ъ옣�섏� �딆� �곹뭹 / �� 蹂��� 湲몄씠 1m珥덇낵 / �꾩껜�섎젅 1.6m珥덇낵 / �≪껜瑜� / 以묐웾 30kg 珥덇낵 ��</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>二쇱쓽�ы빆</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">�고렪踰� ��2議� 3��뿉 洹쒖젙�섏뼱 �덈뒗 �쒖떊 / �쒕쪟(��:�몄�, �쒕쪟) �깆씠 �ы븿�섏뼱�덈뒗 寃쎌슦, 李쎌쓣 �リ퀬 �쒖떊 / �쒕쪟 �덈ぉ�� �ㅼ떆 �좏깮�섏뿬 二쇱떗�쒖삤.</em></li>' +
                    '<li><em class="fc2">臾대Ⅸ 怨쇱씪�� �묒닔湲덉� �곹뭹�낅땲��.</em></li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '<em class="fc1">&lt;�묒닔遺덇� 怨쇱씪&gt;</em> 臾대Ⅸ怨쇱씪 : �щ룄/�멸린/�섎컯/蹂듭댂��/�띿떆/李몄쇅 �� <em class="fc1">�쎄쾶 臾쇰윭吏��� 怨쇱씪</em>' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">�묒닔遺덇��덈ぉ �대떦</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">�묒닔 遺덇��덈ぉ �대떦 �덈맖</a>' +
                    '</div>'
            },

            "item_select_5_popup": {
                'appendTop': '怨〓Ъ瑜� �뺤씤',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_5_1.jpg" alt=""></span>怨〓Ъ瑜�' +
                    '<br>諛뺤뒪�ъ옣</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_5_2.jpg" alt=""></span>怨〓Ъ瑜�' +
                    '<br>諛뺤뒪�ъ옣</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_5_3.jpg" alt=""></span>諛뺤뒪�ъ옣' +
                    '<br>�덈맂 ��</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_5_4.jpg" alt=""></span>留덈��ъ옣' +
                    '<br>�묒닔 遺덇�</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>�댁슜遺덇��곹뭹</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>�좊━瑜� / �ш린瑜� / �꾪겕由댁젣�� / 臾쇳뭹媛��� 100留뚯썝 �댁긽 / �꾧툑 / �좊텇利� / �ш텒 / �덉닠�� / �댁븘�덈뒗 �숇Ъ / �ъ옣�섏� �딆� �곹뭹 / �� 蹂��� 湲몄씠 1m珥덇낵 / �꾩껜�섎젅 1.6m珥덇낵 / �≪껜瑜� / 以묐웾 30kg 珥덇낵 ��</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>二쇱쓽�ы빆</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">�고렪踰� ��2議� 3��뿉 洹쒖젙�섏뼱 �덈뒗 �쒖떊 / �쒕쪟(��:�몄�, �쒕쪟) �깆씠 �ы븿�섏뼱�덈뒗 寃쎌슦, 李쎌쓣 �リ퀬 �쒖떊 / �쒕쪟 �덈ぉ�� �ㅼ떆 �좏깮�섏뿬 二쇱떗�쒖삤.</em></li>' +
                    '<li>�ъ쭊怨� 媛숈� �곹뭹(�곷떒�ъ쭊)�� <em class="fc2">�덈��묒닔 湲덉�</em>�대ŉ �ш퀬 �� <em class="fc2">�ш퀬 諛곗긽湲덉븸 �곗젙�먯꽌 �쒖쇅</em>�⑸땲��.</li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '<em class="fc1">�� / 肄� / 議� �� 怨〓Ъ瑜섎뒗 理쒕� 20kg</em> 源뚯�留� �묒닔 �⑸땲��.' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">�뺤씤</a>' +
                    '</div>'
            },
            "item_select_6_popup": {
                'appendTop': '�쒖빟瑜� �묒닔遺덇� �덈ぉ�좏깮 �숈쓽',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_6_1.jpg" alt=""></span>�꾩슜諛뺤뒪��' +
                    '<br>�뺤긽�ъ옣</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_6_2.jpg" alt=""></span>�꾩슜諛뺤뒪��' +
                    '<br>�뺤긽�ъ옣</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_6_3.jpg" alt=""></span>�⑺룷�� 遺덈웾</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_6_4.jpg" alt=""></span>�꾩슜諛뺤뒪 �댁쇅' +
                    '<br>�ъ옣遺덈웾</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>�댁슜遺덇��곹뭹</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>�좊━瑜� / �ш린瑜� / �꾪겕由댁젣�� / 臾쇳뭹媛��� 100留뚯썝 �댁긽 / �꾧툑 / �좊텇利� / �ш텒 / �덉닠�� / �댁븘�덈뒗 �숇Ъ / �ъ옣�섏� �딆� �곹뭹 / �� 蹂��� 湲몄씠 1m珥덇낵 / �꾩껜�섎젅 1.6m珥덇낵 / �≪껜瑜� / 以묐웾 30kg 珥덇낵 ��</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>二쇱쓽�ы빆</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">�고렪踰� ��2議� 3��뿉 洹쒖젙�섏뼱 �덈뒗 �쒖떊 / �쒕쪟(��:�몄�, �쒕쪟) �깆씠 �ы븿�섏뼱�덈뒗 寃쎌슦, 李쎌쓣 �リ퀬 �쒖떊 / �쒕쪟 �덈ぉ�� �ㅼ떆 �좏깮�섏뿬 二쇱떗�쒖삤.</em></li>' +
                    '<li>�쒖빟瑜�(怨쇱씪利�)�� �꾩슜諛뺤뒪濡� �묒닔媛��ν븯硫�, �꾩� 媛숈씠 <em class="fc2">2諛뺤뒪 �먮뒗 �ㅻⅨ 諛뺤뒪�� �ъ옣�� 寃쎌슦 吏묓솕 嫄곕���</em></li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '�쒖빟瑜�(怨쇱씪利�:�щ룄,諛� ��)�� <em class="fc1">�꾩슜諛뺤뒪</em>濡� �묒닔媛� 媛��ν빀�덈떎.' +
                    '<br>' +
                    '<em class="fc1">��, 1諛뺤뒪�� 媛쒕퀎 �ъ옣�섏뼱 �덉뼱�� �⑸땲��.</em>' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">�묒닔遺덇��덈ぉ �대떦</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">�묒닔 遺덇��덈ぉ �대떦 �덈맖</a>' +
                    '</div>'
            },
            "item_select_7_popup": {
                'appendTop': '�앺뭹瑜� �묒닔遺덇� �덈ぉ�좏깮 �숈쓽',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_7_1.jpg" alt=""></span>�앹꽑</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_7_2.jpg" alt=""></span>�〓쪟</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_7_3.jpg" alt=""></span>源�移�</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_7_4.jpg" alt=""></span>�좊━ 轅�蹂�</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>�댁슜遺덇��곹뭹</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>�좊━瑜� / �ш린瑜� / �꾪겕由댁젣�� / 臾쇳뭹媛��� 100留뚯썝 �댁긽 / �꾧툑 / �좊텇利� / �ш텒 / �덉닠�� / �댁븘�덈뒗 �숇Ъ / �ъ옣�섏� �딆� �곹뭹 / �� 蹂��� 湲몄씠 1m珥덇낵 / �꾩껜�섎젅 1.6m珥덇낵 / �≪껜瑜� / 以묐웾 30kg 珥덇낵 ��</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>二쇱쓽�ы빆</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">�고렪踰� ��2議� 3��뿉 洹쒖젙�섏뼱 �덈뒗 �쒖떊 / �쒕쪟(��:�몄�, �쒕쪟) �깆씠 �ы븿�섏뼱�덈뒗 寃쎌슦, 李쎌쓣 �リ퀬 �쒖떊 / �쒕쪟 �덈ぉ�� �ㅼ떆 �좏깮�섏뿬 二쇱떗�쒖삤.</em></li>' +
                    '<li><em class="fc2">�섏젅湲�(6~10��)�숈븞 源�移�</em>�� �덈� �묒닔 湲덉� �덈ぉ�낅땲��. 蹂�吏덉씠 �곕젮�섎뒗 <em class="fc2">��/諛섏갔瑜�</em> �� �먰븳 �섏젅湲�(6~10��) �덈� �묒닔 湲덉� �낅땲��.</li>' +
                    '<li><em class="fc2">�앹꽑, �〓쪟, �좊━ 轅�蹂�, �닿렐 �� (�묒닔湲덉�)</em></li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '<em class="fc1">&lt;�묒닔遺덇� �앺뭹&gt;</em> 蹂�吏덉슦�ㅺ� �믪� �됰룞/�됱옣�앺뭹' +
                    '<br> (��, 湲곗삩�� ��� <em class="fc1">10��~3�� �묒닔媛���</em>)' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">�묒닔遺덇��덈ぉ �대떦</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">�묒닔 遺덇��덈ぉ �대떦 �덈맖</a>' +
                    '</div>'
            },
            "item_select_8_popup": {
                'appendTop': '�≫솕/�쒖쟻 �뚯넀硫댁콉 �좏깮 �숈쓽',
                'appendCont':

                    '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_8_1.jpg" alt=""></span>洹�湲덉냽</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_8_2.jpg" alt=""></span>�≪껜瑜�' +
                    '<br>(�댄뫖, �붿옣�덈쪟)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_8_3.jpg" alt=""></span>�덉닠��</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_8_4.jpg" alt=""></span>�싳떆��, 怨⑦봽梨� ��</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>�댁슜遺덇��곹뭹</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>�좊━瑜� / �ш린瑜� / �꾪겕由댁젣�� / 臾쇳뭹媛��� 100留뚯썝 �댁긽 / �꾧툑 / �좊텇利� / �ш텒 / �덉닠�� / �댁븘�덈뒗 �숇Ъ / �ъ옣�섏� �딆� �곹뭹 / �� 蹂��� 湲몄씠 1m珥덇낵 / �꾩껜�섎젅 1.6m珥덇낵 / �≪껜瑜� / 以묐웾 30kg 珥덇낵 ��</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>二쇱쓽�ы빆</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">�고렪踰� ��2議� 3��뿉 洹쒖젙�섏뼱 �덈뒗 �쒖떊 / �쒕쪟(��:�몄�, �쒕쪟) �깆씠 �ы븿�섏뼱�덈뒗 寃쎌슦, 李쎌쓣 �リ퀬 �쒖떊 / �쒕쪟 �덈ぉ�� �ㅼ떆 �좏깮�섏뿬 二쇱떗�쒖삤.</em></li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '�꾩땐�쒕줈 �ъ옣�섏뼱 �덉뼱�� �섎ŉ, <em class="fc1">�뚯넀硫댁콉(�앸같�� 梨낆엫 �놁쓬 �몄젙)��<br>' +
                    '�묒닔 媛���</em>�⑸땲��. �뚯넀硫댁콉�� �숈쓽�섏떆寃좎뒿�덇퉴?' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" id="btn-cancel" role="button">�숈쓽�섏� �딆쓬</a>' +
                    '<a href="#" class="btnType1" id="btn-confirm" role="button">�숈쓽��</a>' +
                    '</div>' +
                    '<dl class="addCont">' +
                    '<dt>�뚯넀硫댁콉�대�?</dt>' +
                    '<dd>諛곗넚 以� �ъ옣遺��ㅻ줈 �명븳 �곹뭹�� 怨좎옣/�뚯넀�� ���섏뿬 �앸같�ъ쓽 諛곗긽梨낆엫�� 臾살� �딄쿋�ㅻ뒗 怨좉컼�� �뺤씤�낅땲��.</dd>' +
                    '</dl>'
            },
            "item_select_9_popup": {
                'appendTop': '�몄쓽�� �됱궗 �곹뭹 �좏깮 �숈쓽',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="/img/common/img_item_1_2.jpg" alt=""></span>�⑺룷��</li>' +
                    '<li><span class="thum"><img src="/img/common/img_item_8_2.jpg" alt=""></span>�≪껜瑜�<br>(�댄뫖, �붿옣�덈쪟)</li>' +
                    '<li><span class="thum"><img src="/img/common/img_item_4_2.jpg" alt=""></span>�щ룄</li>' +
                    '<li><span class="thum"><img src="/img/common/img_item_2_3.jpg" alt=""></span>�좉�利앷텒<br>(�곹뭹沅�, 怨듭뿰�곗폆)</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>CU�몄쓽�먯뿉�� �먮ℓ�섎뒗 紐낆젅 �좊Ъ�명듃 援ъ엯 �� �앸같 �묒닔 �쒖뿉 �쒗븯�� �곸슜�⑸땲��.</dt>' +

                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '�곴린 �쒗뭹 �댁쇅�� <em class="fc1">�뚯넀 �곕젮媛� �덈뒗 �좊━ �깆쓽 </em>�쒗뭹�� �ㅼ뼱�덉뒿�덇퉴?' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" id="btn-cancel" role="button">�묒닔遺덇��덈ぉ �대떦</a>' +
                    '<a href="#" class="btnType1" id="btn-confirm" role="button">�묒닔 遺덇��덈ぉ �대떦 �덈맖</a>' +
                    '</div>' +
                    '</div>'
            },
            "item_postal_act_popup": {
                'appendTop': '�고렪踰� 諛쒖톸',
                'appendCont': '<dl class="noti">' +
                    '<dt>�고렪踰� ��1議�(紐⑹쟻)</dt>' +
                    '<dd>' +
                    '�� 踰뺤� �고렪 �댁슜�� 愿��� 湲곕낯�곸씤 �ы빆�� �뺥븯�� 怨듯룊�섍퀬 �곸젙�� �고렪 ��Т瑜� �쒓났�⑥쑝濡쒖뜥 怨듦났�� 蹂듭�利앹쭊�� �대컮吏��⑥쓣 紐⑹쟻�쇰줈 �쒕떎.<br>' +
                    '[�꾨Ц媛쒖젙 2011.12.2]' +
                    '</dd>' +
                    '<dt>�고렪踰� ��1議곗쓽2(�뺤쓽)</dt>' +
                    '<dd>' +
                    '�� 踰뺤뿉�� �ъ슜�섎뒗 �⑹뼱�� �살� �ㅼ쓬怨� 媛숇떎.' +
                    '<ol class="basic mt10">' +
                    '<li>"�고렪臾�"�대� �듭긽�고렪臾쇨낵 �뚰룷�고렪臾쇱쓣 留먰븳��.</li>' +
                    '<li>"�듭긽�고렪臾�"�대� �쒖떊(�멧에) �� �섏궗�꾨떖臾�, �듯솕(�↔툑�듭��쒕� �ы븿�쒕떎) 諛� �뚰삎�ъ옣�고렪臾쇱쓣 留먰븳��.</li>' +
                    '<li>"�뚰룷�고렪臾�"�대� �듭긽�고렪臾� �몄쓽 臾쇨굔�� �ъ옣�� �고렪臾쇱쓣 留먰븳��.</li>' +
                    '<li>"�고렪�붽툑"�대� �고렪臾쇱쓽 諛쒖넚�몄씠�� �섏랬�몄씠 洹� �〓떖�� ��媛�濡� �고렪愿��쒖뿉 �댁빞 �섎뒗 湲덉븸�� 留먰븳��.</li>' +
                    '<li>"�고몴"�� �고렪�붽툑�� �좊궔怨� �고몴�섏쭛 痍⑤��� 臾명솕瑜� �뺤궛�쒗궎湲� �꾪븯�� 諛쒗뻾�섎뒗 利앺몴瑜� 留먰븳��.</li>' +
                    '<li>"�고렪�붽툑�� �쒖떆�섎뒗 利앺몴"�� �고렪�쎌꽌, ��났�쒖떊, �고렪�붽툑 �쒖떆 �몄쁺(�겼쉽)�� �몄뇙�� 遊됲닾(�고븯�μ씠�� �몄궗�μ씠 �몃┛ 寃껋쓣 �ы븿�쒕떎)瑜� 留먰븳��.</li>' +
                    '<li>"�쒖떊"�대� �섏궗�꾨떖�� �꾪븯�� �뱀젙�몄씠�� �뱀젙 二쇱냼濡� �〓��섎뒗 寃껋쑝濡쒖꽌 臾몄옄쨌湲고샇쨌遺��� �먮뒗 洹몃┝ �깆쑝濡� �쒖떆�� �좏삎�� 臾몄꽌 �먮뒗 �꾨떒�� 留먰븳��.<br>' +
                    '�ㅻ쭔, �좊Ц, �뺢린媛꾪뻾臾�, �쒖쟻, �곹뭹�덈궡�� �� ���듬졊�뱀쑝濡� �뺥븯�� 寃껋� �쒖쇅�쒕떎.' +
                    '</li>' +
                    '</ol>' +
                    '[�꾨Ц媛쒖젙 2011.12.2]' +
                    '</dd>' +
                    '<dt>�고렪踰� ��2議�(寃쎌쁺二쇱껜�� �ъ뾽�� �낆젏 ��)</dt>' +
                    '<dd>' +
                    '<ol class="circle">' +
                    '<li>�고렪�ъ뾽�� 援��媛� 寃쎌쁺�섎ŉ, 吏��앷꼍�쒕��κ��� 愿��ν븳��. �ㅻ쭔, 吏��앷꼍�쒕��κ��� �고렪�ъ뾽�� �쇰�瑜� 媛쒖씤, 踰뺤씤 �먮뒗 �⑥껜 �깆쑝濡� �섏뿬湲� 寃쎌쁺�섍쾶 �� �� �덉쑝硫�, 洹몄뿉 愿��� �ы빆�� �곕줈 踰뺣쪧濡� �뺥븳��.</li>' +
                    '<li>�꾧뎄�좎� ��1��낵 ��5��쓽 寃쎌슦 �몄뿉�� ���몄쓣 �꾪븳 �쒖떊�� �〓떖 �됱쐞瑜� ��(璵�)�쇰줈 �섏� 紐삵븯硫�, �먭린�� 議곗쭅�대굹 怨꾪넻�� �댁슜�섏뿬 ���몄쓽 �쒖떊�� �꾨떖�섎뒗 �됱쐞瑜� �섏뿬�쒕뒗 �꾨땲 �쒕떎.</li>' +
                    '<li>��2��뿉�� 遺덇뎄�섍퀬 �쒖떊 (援��湲곌��대굹 吏�諛⑹옄移섎떒泥댁뿉�� 諛쒖넚�섎뒗 �깃린痍④툒 �쒖떊�� �쒖쇅�쒕떎)�� 以묐웾�� 350洹몃옩�� �섍굅�� �고렪�붽툑�� ���듬졊�뱀쑝濡� �뺥븯�� �듭긽�고렪�붽툑�� 10諛곕� �섎뒗 寃쎌슦�먮뒗 ���몄쓣 �꾪븯�� �쒖떊�� �〓떖�섎뒗 �됱쐞瑜� �낆쑝濡� �� �� �덈떎.</li>' +
                    '<li>�꾧뎄�좎� ��2��쓣 �꾨컲�섎뒗 �먯뿉寃� �쒖떊�� �〓떖�� �꾪긽�섏뿬�쒕뒗 �꾨땲 �쒕떎.</li>' +
                    '<li>�고렪�ъ뾽�대굹 �고렪李쎄뎄�낅Т�� �꾪긽�� 愿��� �ы빆�� �곕줈 踰뺣쪧濡� �뺥븳��.<br>�ㅻ쭔, 吏��앷꼍�쒕��κ��� �고렪李쎄뎄�낅Т �몄쓽 �고렪�낅Т�� �쇰�瑜� ���듬졊�뱀쑝濡� �뺥븯�� 諛붿뿉 �곕씪 �ㅻⅨ �먯뿉寃� �꾪긽�� �� �덈떎.</li>' +
                    '</ol>' +
                    '[�꾨Ц媛쒖젙 2011.12.2]' +
                    '</dd>' +
                    '<dt>�고렪踰� ��2議곗쓽2(�쒖떊�〓떖�낆옄�� �좉퀬 ��)</dt>' +
                    '<dd>' +
                    '<ol class="circle">' +
                    '<li>��2議곗젣3��뿉 �곕씪 �쒖떊�� �〓떖�섎뒗 ��(�댄븯 "�쒖떊�〓떖��"�대씪 �쒕떎)�� �섎젮�� �먮뒗 吏��앷꼍�쒕��뱀쑝濡� �뺥븯�� 諛붿뿉 �곕씪 吏��앷꼍�쒕��κ��먭쾶 �좉퀬�섏뿬�� �쒕떎.</li>' +
                    '<li>��1��뿉 �곕Ⅸ �좉퀬瑜� �섎젮�� �먮뒗 �대떦 �좉퀬�쒖뿉 吏��앷꼍�쒕��뱀쑝濡� �뺥븯�� �ъ뾽怨꾪쉷�쒕� 泥⑤��섏뿬 吏��앷꼍�쒕��κ��먭쾶 �쒖텧�섏뿬�� �쒕떎.</li>' +
                    '<li>吏��앷꼍�쒕��κ��� ��1��뿉 �곕씪 �쒖떊�〓떖�낆쓽 �좉퀬瑜� �� ��(�댄븯 "�쒖떊�〓떖�낆옄"�� �쒕떎)�먭쾶 �ㅼ쓬 媛� �몄쓽 �ы빆�� 愿��⑤맂 �먮즺 �쒖텧�� �붽뎄�� �� �덈떎.' +
                    '<ol class="basic">' +
                    '<li>�쒖떊�� 痍④툒臾쇰웾, 留ㅼ텧��, 以묐웾 諛� �붽툑 �� �ъ뾽�댁쁺�� 愿��� �ы빆</li>' +
                    '<li>�곸뾽��, ��由ъ젏 諛� �묒뾽�� �� �쒖꽕�� 愿��� �ы빆</li>' +
                    '<li>洹� 諛뽰뿉 �쒖떊�〓떖�낆옄�� 吏��꽷룹��먯쓣 �꾪븯�� �꾩슂�� �ы빆</li>' +
                    '</ol>' +
                    '</li>' +
                    '</ol>' +
                    '</dd>' +
                    '</dl>'
            }
        };

        var oPackPop = {
            "packaging_1_popup": {
                'appendTop': '源�移섎쪟 �묒닔�덈궡',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 源�移�/�앺뭹瑜� �ъ옣 �덉떆</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_1_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '源��μ슜 鍮꾨땺濡� 2以� �ъ옣 �� �꾩씠�ㅻ컯�ㅼ뿉 �붾뱾由ъ� �딅룄濡� �ъ옣.<br>' +
                    '�곴린�� 媛숈씠 �ъ옣�� �섏� �딆쓣 寃쎌슦 <em class="fc1">�앸같湲곗궗 �섍굅 �� 吏묓솕 嫄곕�</em>�� �� �덉쓬.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. �묒닔湲덉� �곹뭹</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_1_2_1.png" alt=""></span>�앹꽑</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_1_2_2.png" alt=""></span>�〓쪟</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_1_2_3.png" alt=""></span>�좊━蹂묎�</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_1_2_4.png" alt=""></span>�닿렐 ��</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">�앹꽑, �〓쪟, �좊━蹂묎�, �닿렐 �좎� �묒닔 湲덉��낅땲��.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">�뺤씤</a>' +
                    '</div>'
            },
            "packaging_2_popup": {
                'appendTop': '�쒖빟瑜� �묒닔�덈궡',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. �쒖빟瑜� �ъ옣 �덉떆</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_2_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '�쒖빟瑜�(怨쇱씪利� : �щ룄, 諛� ��)�� <em class="fc1">�꾩슜諛뺤뒪</em>濡� �묒닔媛��ν빀�덈떎.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. �묒닔湲덉� �곹뭹</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_2_2_1.png" alt=""></span>�⑺룷�� 遺덈웾</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_2_2_2.png" alt=""></span>�⑺룷�� 遺덈웾</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_2_2_3.png" alt=""></span>�꾩슜諛뺤뒪 �댁쇅 �ъ옣遺덈웾</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_2_2_4.png" alt=""></span>�꾩슜諛뺤뒪 �댁쇅 �ъ옣遺덈웾</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">2諛뺤뒪 �⑺븯�� �ъ옣 �먮뒗 �꾩슜諛뺤뒪 �댁쇅�� �ъ옣�� 寃쎌슦 吏묓솕嫄곕���.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">�뺤씤</a>' +
                    '</div>'

            },
            "packaging_3_popup": {
                'appendTop': '媛��꾩젣�덈쪟 �묒닔�덈궡',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 媛��꾩젣�덈쪟 �ъ옣 �덉떆</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_3_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '<em class="fc1">�ㅽ떚濡쒗뤌 諛뺤뒪</em>�� �붾뱾由ъ� �딅룄濡� 寃ш퀬�섍쾶 �ъ옣�섏뼱�� ��.<br>' +
                    '�곴린�� 媛숈씠 �ъ옣�� �섏� �딆쓣 寃쎌슦 <em class="fc1">�앸같湲곗궗 �섍굅 �� 吏묓솕 嫄곕�</em>�� �� �덉쓬.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. �ъ옣遺덈웾 �곹뭹</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_1.png" alt=""></span>�댄뭹 怨좎젙�섏� �딆쓬</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_2.png" alt=""></span>�댄뭹 怨좎젙�섏� �딆쓬</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_3.png" alt=""></span>�댄뭹 �꾩땐 遺덈웾</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_4.png" alt=""></span>�댄뭹 �꾩땐 遺덈웾</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">�댄뭹 �꾩땐�� 遺덈웾�� 寃쎌슦 吏묓솕 嫄곕��⑸땲��.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">�뺤씤</a>' +
                    '</div>'

            },
            "packaging_4_popup": {
                'appendTop': '媛��꾩젣�덈쪟 �묒닔�덈궡',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 以묎퀬 而댄벂�� �ъ옣 �덉떆</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_4_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '<em class="fc1">�ㅽ떚濡쒗뤌 諛뺤뒪</em>�� �붾뱾由ъ� �딅룄濡� 寃ш퀬�섍쾶 �ъ옣�섏뼱�� ��.<br>' +
                    '�곴린�� 媛숈씠 �ъ옣�� �섏� �딆쓣 寃쎌슦 <em class="fc1">�앸같湲곗궗 �섍굅 �� 吏묓솕 嫄곕�</em>�� �� �덉쓬.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. �ъ옣遺덈웾 �곹뭹</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_1.png" alt=""></span>�댄뭹 怨좎젙�섏� �딆쓬</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_2.png" alt=""></span>�댄뭹 怨좎젙�섏� �딆쓬</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_3.png" alt=""></span>�댄뭹 �꾩땐 遺덈웾</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_4.png" alt=""></span>�댄뭹 �꾩땐 遺덈웾</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">�댄뭹 �꾩땐�� 遺덈웾�� 寃쎌슦 吏묓솕 嫄곕��⑸땲��.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">�뺤씤</a>' +
                    '</div>'

            },
            "packaging_5_popup": {
                'appendTop': '01. 怨쇱씪瑜� �ъ옣 �덉떆',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 怨쇱씪瑜� �ъ옣 �덉떆</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_5_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '<em class="fc1">�깅뵳�� 怨쇱씪</em>留� �묒닔 媛��ν븯硫� 寃ш퀬�섍쾶 �ъ옣�섏뼱�� ��.<br>' +
                    '�곴린�� 媛숈씠 �ъ옣�� �섏� �딆쓣 寃쎌슦 <em class="fc1">�앸같湲곗궗 �섍굅 �� 吏묓솕 嫄곕�</em>�� �� �덉쓬.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. �ъ옣遺덈웾 �곹뭹</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_5_2_1.png" alt=""></span>�띿떆</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_5_2_2.png" alt=""></span>�щ룄</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_5_2_3.png" alt=""></span>�쒖＜媛먭랠</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_5_2_4.png" alt=""></span>李몄쇅</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">臾대Ⅸ 怨쇱씪�� �묒닔湲덉� �곹뭹�낅땲��.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">�뺤씤</a>' +
                    '</div>'
            },
            "packaging_7_popup": {
                'appendTop': '湲고�/�≫솕瑜� �묒닔�덈궡',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 湲고�/�≫솕瑜� �ъ옣 �덉떆</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_6_1.jpg" alt=""></span>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. �묒닔湲덉� �곹뭹</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_1.png" alt=""></span>�좊━�곹뭹 瑜�<br>(�묒＜, 轅� ��)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_2.png" alt=""></span>�≪껜瑜�</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_3.png" alt=""></span>�댄뭹 �꾩땐 遺덈웾</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_4.png" alt=""></span>洹�湲덉냽 瑜�</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_5.png" alt=""></span>�덉닠��</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_6.png" alt=""></span>�싳떆�� 瑜�</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_7.png" alt=""></span>�댁넚�� �ш린蹂대떎<br> �묒� �곹뭹</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">�꾩� 媛숈� �곹뭹�� 吏묓솕�섏� �딆뒿�덈떎.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">�뺤씤</a>' +
                    '</div>'
            },
            "packaging_8_popup": {
                'appendTop': '�쒖떊,�쒕쪟 �묒닔�덈궡',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. �쒖떊�쒕쪟 �ъ옣 �덉떆</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_7_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '<em class="fc1">�먯뼱罹≪씠 遺숈뼱�덈뒗 ��遊됲닾</em>�� �ъ옣, �뱀� �쇰컲 ��遊됲닾�� �ъ옣�� 二쇱떆湲� 諛붾엻�덈떎.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. �묒닔湲덉� �곹뭹</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_7_2_1.png" alt=""></span>�꾧툑</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_7_2_2.png" alt=""></span>�몄�遊됲닾</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_7_2_3.png" alt=""></span>�곹뭹沅�</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_7_2_4.png" alt=""></span>�ш텒</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">�꾧툑, �몄�遊됲닾, �좉�利앷텒(�곹뭹沅�, 怨듭뿰�곗폆), �좊텇利�, �ш텒 �묒닔遺덇�</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">�뺤씤</a>' +
                    '</div>'
            },
            "packaging_10_popup": {
                'appendTop': '�섎쪟 �묒닔�덈궡',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<p class="tit">�ㅼ쓬怨� 媛숈씠 <em class="fc1">�ъ옣�� 遺��ㅽ븳 寃쎌슦</em>�� �섍굅�섏� �딆뒿�덈떎.</p>' +
                    '<ul  class="ulType2">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_8_1.jpg" alt=""></span>諛뺤뒪 �ъ옣 �덈맂 罹먮━��</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_8_2.jpg" alt=""></span>�⑺룷�� 遺덇�<br>(諛뺤뒪�먭컻瑜� �뚯옂�쇰줈 �⑹튇 �뺥깭)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_8_3.jpg" alt=""></span>�댄뭹�� 蹂댁엫 (諛뺤뒪�ъ옣 遺덈웾)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_8_4.jpg" alt=""></span>�댄뭹�� 蹂댁엫(�щ챸鍮꾨땺 �ъ옣)</li>' +
                    '</ul>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">�뺤씤</a>' +
                    '</div>'
            },

        }

        if (options.id.match('item')) {
            oPopCont = oItemPop[options.id];
        } else if (options.id.match('packaging')) {
            oPopCont = oPackPop[options.id];
        }
        // dimmed 媛� 珥덇린�� 
        $('.dimmed').remove();
        //�앹뾽 �몄텧 
        if (oPopCont != undefined) {
            createLayerPopup({
                wrapper: '#ux-popup',
                templateId: options.id,
                appendTop: oPopCont.appendTop,
                appendCont: oPopCont.appendCont

            });
        }

        var $popup = $('#' + options.id).show();
        //�ъ빱�� 鍮좎졇 �섍컝 寃쎌슦 
        // �앹뾽 �ъ빱�� �묎렐��
        var elmLastFocus = $(document).find(':focus');
        var triggerLastFocus;
        if (options.lastFocus != undefined && options.lastFocus.length > 0) {
            focusOutClosePop(options.lastFocus);
            triggerLastFocus = options.lastFocus;
        }else if( elmLastFocus != undefined && elmLastFocus.length>0){
            focusOutClosePop(elmLastFocus);
            triggerLastFocus  = elmLastFocus;
        }

        //�묎렐�� �ъ빱�� �쒖꽌 吏��� 
        $('#' + options.id).find(".popTop").attr("tabindex", 0).focus();
//        var focusElm = commonJs.findFocusElements($('#' + options.id));
//
//        $(focusElm).not('.popClose').each(function(idx) {
//            $(this).attr('tabindex', idx + 1);
//        });
//        $(focusElm).filter('.popClose').attr('tabindex', focusElm.length);

        // .btn_c�� 留덉�留� �몃뱶 �� 寃쎌슦 padding bottom 吏��� 
        var oPopCont = $('#' + options.id).find(".popCont");
        var oBtn = oPopCont.find(".btn_c");
        if (oBtn.next().length <= 0 && oBtn.length > 0) {
            oBtn.addClass("changed");
            oPopCont.addClass("changed");
        } else {
            oBtn.removeClass("changed");
            oPopCont.removeClass("changed");
        }

        //�앹뾽 怨듯넻 �リ린 
        $popup.find('.btnType2').off('click');
        $popup.find('.btnType2').on('click', function(ev) {
        	ev.preventDefault();
            if (popLength > 0 && options.parentPop != undefined) {
                options.parentPop.show();
            }            
            closePopup();
        });
        //痍⑥냼 踰꾪듉 
        $popup.find('.popClose').off('click');
        $popup.find('.popClose').on('click', function(ev) {
            ev.preventDefault();
            if (popLength > 0 && options.parentPop != undefined ) {
                options.parentPop.show();
            }
            closePopup();
        });
        //dimmed �앹꽦
        $popup.after("<div class='dimmed'></div>");
        
        // �앹뾽 �듭뀡媛� �ㅼ젙 
        $.popup.popups.push({
            $target: $popup,
            onOpen: options.onOpen,
            onClose: options.onClose,
            $lastFocus: triggerLastFocus,
            parentPop:options.parentPop,
        });

        // �앹뾽 �듭뀡 �대깽�� �몄텧        
        options.onOpen.call($popup.get(0));

        var $img = $('#' + options.id).find('img'),
            imgLen = $img.length,
            count = 0;

        //�앹뾽 媛��대뜲 �뺣젹 
        if (imgLen > 0) {
            $img.one('load', function() {
                count += 1;
                if (count === imgLen) {
                    // reposition
                    repositionPopup();
                }
            }).each(function() {
                if (this.complete) {
                    $(this).trigger('load');
                }
            });
        } else {
            repositionPopup();
        }

    }


    // �앹뾽 �リ린 
    function getTopPopup() {
        return $.popup.popups[$.popup.popups.length - 1];
    }

    function closePopup() {
        var oPopup = getTopPopup();
        //�앹뾽 �대젮 �덉쓣 寃쎌슦 
        if (oPopup) {
            //�앹뾽 ��젣 �몄텧
            oPopup.onClose.call(oPopup.$target.get(0), removePopup);
        }

    }


    function removePopup() {
        // 紐⑤컮�� �붾㈃ �댁긽��
        $("body").removeAttr('style');
        var count = $.popup.popups.length;
        var popup;

        //�앹뾽�� �대젮 �덉쓣 寃쎌슦
        if (count > 0) {
            //�앹뾽 �듭뀡媛� ��젣 
            popup = $.popup.popups.pop();

            //�앹뾽 ��젣 
            popup.$target.hide();

            // 留덉�留� �덉씠�꾩썐�먯꽌 dimmed ��젣 
            if (count == 1) {
                $('.dimmed').remove();
            }

            //留덉�留� �ъ빱�ㅻ줈 �대룞 
            if (popup.$lastFocus!= undefined && popup.$lastFocus.length > 0) {
                popup.$lastFocus.trigger('focus');
            }
            
            // 2017.04.26 �앹뾽 �ъ빱��
            if(commonJs.saveTarget.length > 0) {
                commonJs.firstTargetFocus(commonJs.saveTarget.pop());
                
            }

        }

    }
    // �앹뾽 媛��대뜲 �뺣젹 (�ㅽ겕濡� �앹꽦��, LayerPopWrap w�レ옄 濡� �ㅼ젙�� �앹뾽 �뺣젹 )
    function repositionPopup() {
        $(".LayerPopWrap .popCont").removeAttr('style');
        //湲곗〈 width 


        var docHeight = $(window).height();
        var innerPopHeight = docHeight - 101;
        $(".LayerPopWrap").each(function() {
            var popHeight = $(this).height();
            if (docHeight < popHeight) {
                $(this).css({ "width": "620px", "marginLeft": "-310px" });
                $(this).find(".popCont").css({
                    "overflow-y": "auto",
                    "overflow-x": "hidden",
                    height: innerPopHeight
                });
            } else {
                $(this).css({ "width": "600px", "marginLeft": "-300px" });
            }

            //�뱀씠耳��댁뒪 LayerPopWrap w
            if ($(this).attr("class").indexOf("LayerPopWrap w") >= 0) {
                $(".LayerPopWrap").css({ "width": "", "marginLeft": "" });
            }

            $.util.center(this);
        });
    }


    function setCalendar() {
        var doc = $(document);
        var calendar = doc.find('span.calendar');

        if (!calendar.length) {
            return;
        }

        function addZero(n) {
            return (String(n).length < 2) ? '0' + n : n;
        }

        var curD = new Date();
        var stD = new Date(Date.parse(curD) - 30 * 1000 * 60 * 60 * 24);
        var endD = new Date(Date.parse(curD) + 30 * 1000 * 60 * 60 * 24);

        var option = {
            //start     : { year : stD.getFullYear(), month : stD.getMonth()+1, day : stD.getDate() },      //�щ젰 �쒖옉��
            //current : { year : curD.getFullYear(), month : curD.getMonth()+1, day : curD.getDate() }, //�щ젰 �꾩옱��
            //end   : { year : endD.getFullYear(), month : endD.getMonth()+1, day : endD.getDate() }    //�щ젰 留덉�留�
        };

        $.fn.getCalrendar = function() {
            return this.data('calrendar');
        };

        //ex.) $('div.calendar:eq(0)').selectDate({year:2015,month:5,day:10});
        $.fn.selectDate = function(opt) {
            //this.data('calrendar').setDate(opt);
            //$(this).children('input').attr('value',opt.year+'.'+addZero( opt.month )+'.'+addZero( opt.day ));
            //return true;
        };

        //ex.) $('div.calendar:eq(0)').getDate();
        /*
        $.fn.getDate = function()
        {
            return $(this).children('input').attr('placeholder');
        };
        */
        /*
        ex.) 
        $('div.calendar:eq(0)').setup({
            start   : { year:2016, month:1,  day:1  },
            end     : { year:2016, month:12, day:31 },
            today   : { year:2016, month:5,  day:1  },
            date    : { year:2016, month:5,  day:8  }
        });
        */

        $.fn.setup = function(opt) {

            var d = this.data('calrendar');
            if (opt.start) {
                d.setStartDay(opt.start);
            }
            if (opt.end) {
                d.setEndDay(opt.end);
            }
            if (opt.today) {
                d.setToday(opt.today);
            }
            if (opt.date) {
                d.setDate(opt.date);
                $(this).children('input').attr('value', opt.date.year + '.' + addZero(opt.date.month) + '.' + addZero(opt.date.day));
            }
        };

        calendar.each(function(idx) {
            var cal = $(this);
            var mIndex = cal.css('z-index');
            var box = cal.children('div.calBox');

            var calObj = box.calendarInit({
                //target : box.children('.calTop'),
                year: box.find('.year'), // �ы몴��
                month: box.find('.month'), // �뷀몴��
                start: option.start, //�щ젰 �쒖옉��
                current: option.current, //�щ젰 �꾩옱��
                end: option.end //�щ젰 留덉�留�
            });

            cal.data('calrendar', calObj);
            calObj.setVisible(false);

            var input = cal.children('input');
            //input.attr('value',option.current.year+'.'+addZero( option.current.month )+'.'+addZero( option.current.day ));
            calObj.calrendarClose = function() {
                cal.css('z-index', 1);
                this.setVisible(false);
            };
            calObj.calrendarOpen = function() {
                cal.css('z-index', 1000);
                this.setVisible(true);
            };

            calObj.bind(calObj.EVENTS.SELECT, function(evt, date) {
                input.attr('value', date.year + '.' + addZero(date.month) + '.' + addZero(date.day));
            });
            calObj.bind(calObj.EVENTS.FOCUSOUT, function(evt) {
                $(evt.target).parent().removeClass('on');
            });

            //$('.dateSearch>spna:eq(0)').on
            //$('.dateSearch>span:eq(0)').on('click', function(evt) 
            cal.children('a').on('click', function(evt) {
                calendar.css('z-index', 1);
                cal.siblings(".calendar").removeClass("on");
                calendar.find(".calBox").hide();
                cal.css('z-index', 1000);
                cal.toggleClass('on');
                /*
                $.each( calendar , function( idx , value) 
                {
                    if( $(value).data('calrendar') )
                    {
                        $(value).data('calrendar').setVisible( false );
                    }
                });
                */
                calendarFocus(cal.parent());
                //calObj.setVisible(true);

                /*
                if(getVersion()){
                    //fixed, 媛��대뜲�뺣젹
                    box.css({
                        'position':'fixed',
                        'top':(commonJs.HEIGHT-box.outerHeight(true))/2+'px',
                        'width':'94%',
                        'left':'3%'
                    });
                }else{
                    //�섏쐞踰꾩쟾 移대젋�� �명뭼 諛뺤뒪 留덉뒪�� �ㅻ줈 �대룞
                    cal.css('z-index',999);
                }
                */
                cal.css('z-index', 999);
                //setMask(box);
                evt.preventDefault();
            });


            function calendarFocus(target) {
//                target.children('.calBox').css({
//                    'display': 'block'
//                });
            	
            	$(".dateSearch .calendar.on .calBox").show();
                var position = target.children('.calendar').offset();
                //target.children('.calendar').addClass('on');
                // $('html,body').animate({scrollTop:position.top}, 300);
            }

            var top = box.children('div.calTop');

            top.children('.first').on('click', function(evt) {
                evt.preventDefault();
                calObj.first();
            });
            top.children('.prev').on('click', function(evt) {
                evt.preventDefault();
                calObj.prev();
            });
            top.children('.next').on('click', function(evt) {
                evt.preventDefault();
                calObj.next();
            });
            top.children('.end').on('click', function(evt) {
                evt.preventDefault();
                calObj.end();
            });

            // �섎떒 踰꾪듉 �곸뿭
            var btn = box.children('div.btn');
            btn.children('button.close').on('click', function(evt) {
                cal.removeClass('on');
                calObj.setVisible(false);
                //clearMask();
            });
            btn.children('button.today').on('click', function(evt) {
                calObj.today();
            });
        });

        // �꾩껜蹂�寃�
        // $('div.calendar:eq(0)').getCalrendar().setup({
        //      start   : { year : 2015 , month : 1, day : 1 }, 
        //      current : { year : 2016 , month : 4, day : 6 },
        //      end     : { year : 2017 , month : 8, day : 1 }  
        // });
        // �⑥씪媛� 蹂�寃�
        //$('div.calendar:eq(0)').getCalrendar().setToday(
        //  {
        //      year : 2016 , month : 4, day : 3 
        //  }
        //);
        // �⑥씪 �щ젰 �묎렐
        //$('div.calendar:eq(0)').getCalrendar().calrendarOpen();       // �닿린
        //$('div.calendar:eq(0)').getCalrendar().calrendarClose();      // �リ린
    }

    $(document).ready(function() {
    	// �쒗삎 二쇱엫�� �붿껌 �ы빆 - �밸줈洹� 遺꾩꽍 �쒖옉 
        var referrer =  document.referrer;
    	var naver = "search.naver.com";
    	var daum = "search.daum.net";
    	
    	if(referrer.indexOf(naver) > 0 || referrer.indexOf(daum) > 0){
    		setCookie("event0424","1",1);
    	}
    	// �쒗삎 二쇱엫�� �붿껌 �ы빆 - �밸줈洹� 遺꾩꽍 �� 
    	
        //�щ젰 �ㅼ젙
        setCalendar();

        //GNB 硫붾돱 �몄텧
        $.GNB.init();

        //�앹뾽 由ъ궗�댁쭠 
        $(window).on('resize', function() {
            repositionPopup();
        });
        $doc.on('keydown', function(ev) {
            // ESC === 27
            if ((ev || win.event).keyCode === 27) {
                closePopup();
            }
        });
        //硫붾돱 �섎떒 
        $(".footMenu>.selType1>a").on("click", function(ev) {
            ev.preventDefault();
            $(this).next("ul").toggle();
            bottomTitle();
        });
        $(".footMenu>.selType1>ul>li").on("click", function() {
            $(this).closest("ul").toggle();
            bottomTitle();
        });




        function ruleFocus(obj, closeElm) {        	
            var elm = commonJs.findFocusElements(obj),
                firstElm, lastElm;

            if (elm.length > 0) {
                firstElm = $(elm).first();
                lastElm = $(elm).last();
                firstElm = $(elm).first();
                lastElm = $(elm).last();
                firstElm.off("keydown").on("keydown", function(ev) {
                    // back space event
                    if (ev.shiftKey == true && ev.keyCode == 9) {
                        closeElm.hide();
                    }
                });

                lastElm.off("keydown").on("keydown", function(ev) {
                    // tab event
                    if (ev.keyCode == 9) {
                        closeElm.hide();
                    }
                });
            } else {
                obj.off("keydown").on("keydown", function(ev) {
                    // back space event
                    if (ev.shiftKey == true && ev.keyCode == 9) {
                        closeElm.hide();
                    }
                });
            }

        }
        // �� �묎렐�� �ъ빱�� �꾩썐 �좉꼍�� �ロ옒 
        $(".selType1>a").eq(0).off("keydown").on("keydown", function(ev) {
            ruleFocus($(".selType1>a").eq(0), $(this).next("ul"));
            ruleFocus($(".selType1").eq(0).find("ul>li"), $(this).next("ul"));
        });

        
        $(".tableType1 .selType1 ul>li>a").on("click", function(ev) {
            ev.preventDefault();

            var prodStr = $(this).parent().text();
            var prodIndex = $(this).parent().index();
            var lastFocus = $(this).closest("ul").prev("a");

            var popupId = "item_select_" + prodIndex + "_popup";
            if (prodStr !== "�덈ぉ�좏깮") {
                $.popup('open', {
                    id: popupId,
                    onOpen: function() {
                        var popId = $("#" + popupId);
                        var focusIdx = 0;

                        popId.find('.btnType2').off().on('click', function(ev) {
                            ev.preventDefault();
                            alert('�묒닔 遺덇��덈ぉ�� �ы븿�섍굅�� �뚯넀硫댁콉 誘몃룞�� �� 臾쇳뭹�� 諛쒖넚�� �� �놁뒿�덈떎.');
                            lastFocus.focus();
                            $.popup('close');
                        });

                        popId.find('.btnType1').off().on('click', function(ev) {
                            ev.preventDefault();
                            $(".tableType1 .selType1").find('a').eq(0).text(prodStr);
                            $.popup('close');
                            $("#label_price").focus();
                        });

                        popId.find('.icoSearch').off().on('click', function(ev) {
                            ev.preventDefault();
                            $.popup('open', {
                                id: 'item_postal_act_popup',
                                parentPop: popId,
                                lastFocus: $(this)
                            });
                        });
                    },
                    lastFocus: lastFocus

                });
            }
        });

        //�ъ옣�덈궡 �앹뾽 �몄텧
        $(".packagingBlock2>ul>li").find(".btnType3").off("click").on("click", function(ev) {
            ev.preventDefault();
            var prodIndex = $(this).closest('li').index() + 1;

            var popupId = "packaging_" + prodIndex + "_popup";
            $.popup('open', {
                id: popupId,
                onOpen: function() {
                    $("#" + popupId).find('.btnType1').off('click');
                    $("#" + popupId).find('.btnType1').on('click', function(ev) {
                        ev.preventDefault();
                        $.popup('close');
                    });
                }

            });
        });

        //�꾩퐫�붿뼵 硫붾돱 �대┃
        $(".arcodian .accorTit").off("click").on("click", function(ev) {
            ev.preventDefault();
            var currentVal = $(this).closest("li");

            if (currentVal.hasClass("open")) {
                currentVal.removeClass("open");
                $(this).next().hide();
            } else {
                $(".arcodian").find("li").removeClass("open");
                $(".arcodian").find("li > div").hide();
                currentVal.addClass("open");
                $(this).next().show();
            }
        });

        //�명뭼諛뺤뒪 泥댄겕�� 寃쎌슦 �붿옄�� 蹂�寃�
        $('input[type="radio"], input[type="checkbox"]').each(function() {
            if ($(this).attr('checked')) {
                $(this).closest('.formWrap').addClass('on');
                $(this).attr('checked', true);
            }
        });

        $doc.on('change', 'input[type="radio"], input[type="checkbox"]', function() {
            var type = $(this).attr("type");
            var idx = $('input[type="' + type + '"]').index(this);
            var bChked = $(this).is(":checked");
            commonJs.checkBoxCall(type, idx, bChked);
        });

        // 臾쇳뭹 寃��� �앹뾽 
        $('div.selMap').each(function() {
            var arr = [];
            /* �� */
            arr[0] = '';
            /* �� */
            arr[1] = '.state23';
            /* �� */
            arr[2] = '.state25';
            /* �� */
            arr[3] = '.state22';
            /* �� */
            arr[4] = '.state02 , .state03 , .state10';
            /* �� */
            arr[5] = '.state04 , .state11 , .state12 , state17';
            /* �� */
            arr[6] = '.state20 , .state21';
            /* �� */
            arr[7] = '.state27,.state18,.state15,.state13,.state06';
            /* �� */
            arr[8] = '.state14';
            /* �� */
            arr[9] = '.state05';
            /* �� */
            arr[10] = '.state01 , .state19';
            /* �� */
            arr[11] = '.state08';
            /* �� */
            arr[12] = '.state07 , .state16 , .state24 , .state26';
            /* �� */
            arr[13] = '.state09';
            /* 洹몄쇅 */
            arr[14] = '';

            var sel = $(this).children('a');
            var map = $('.mapBox>a');
            sel.on('click', function() {
                map.show();
                tool.hide();
                //硫붾돱 �대옒�� �쒖꽦�� 
                $(this).addClass("on").siblings().removeClass("on");
                $(this).attr("title", "�좏깮��").siblings().attr("title", "�좏깮�덈맖");
                $(this).attr("tabindex", 0).focus();
                $('div.fr>p').show();

                var n = $(this).index();
                if (n > 0) {
                    map.not(arr[n - 1]).hide();
                }
                if (n == (sel.length - 1)) {
                    $('div.fr>p').hide();
                    tool.hide();
                    tool.eq(tool.length - 1).show();
                }
            });
            var tool = $('div.fr>dl');
            map.on('click', function() {
                $('div.fr>p').hide();
                map.removeClass('on');
                $(this).addClass('on');
                tool.hide();
                tool.eq($(this).index()).show();
            });
        });


        /**
         * �몄쓽�� �앸같 �щ씪�대뱶
         */
        var animateSp = 400;

        function openBox(handle, callback) {
            var $button = null,
                $visualWrap = null,
                visualWidth = 0,
                buttonOpt = null;

            if (handle === 'fr') {
                $button = $('.mainBox02 .sect01 .fr');
                $visualWrap = $('.mainBox02 > .sect03');
                buttonOpt = {
                    position: 'absolute',
                    top: 0,
                    right: 0
                };
            } else if (handle === 'fl') {
                $button = $('.mainBox02 .sect01 .fl');
                $visualWrap = $('.mainBox02 > .sect02');
                buttonOpt = {
                    position: 'absolute',
                    top: 0,
                    left: 0
                };
            }

            visualWidth = $visualWrap.children().width() + parseInt($visualWrap.children().css('margin-left'), 10);

            // 踰꾪듉
            $button.css(buttonOpt).stop(true, false).animate({
                width: visualWidth + 'px'
            }, {
                duration: animateSp,
                complete: function() {
                    $visualWrap.removeAttr('style').css({
                        position: 'absolute',
                        top: 0,
                        left: 0,
                        width: '100%'
                    }).hide().stop(true, false).fadeIn({
                        complete: function() {
                            $button.removeAttr('style');
                            //focus
                            $visualWrap.find(".irCont").focus();
                            $('.mainBox02 .sect01').hide();
                        }
                    });

                    if (typeof callback === 'function') {
                        callback();
                    }
                }


            });
        }

        function closeBox(handle, callback) {
            var $button = null,
                $visualWrap = null,
                boxLeft = 0;

            if (handle === 'fr') {
                $button = $('.mainBox02 .sect01 .fr');
                $visualWrap = $('.mainBox02 > .sect03');
                boxLeft = 580;
            } else if (handle === 'fl') {
                $button = $('.mainBox02 .sect01 .fl');
                $visualWrap = $('.mainBox02 > .sect02');
                boxLeft = -580
            }

            // 鍮꾩＜�� �대�吏�
            $visualWrap.css({
                display: 'block',
                position: 'absolute',
                top: 0,
                left: 0,
                width: '100%'
            }).stop(true, false).animate({
                left: boxLeft + 'px'
            }, {
                complete: function() {
                    $(this).stop(true, false).fadeOut({
                        queue: true,
                        complete: function() {
                            $(this).removeAttr('style').hide();
                            //focus
                            if(handle === "fr"){
                            	$(".sect01").find(".fr a").focus();
                            }else if(handle === "fl"){
                            	$(".sect01").find(".fl a").focus();
                            } 
                        }
                    });

                    if (typeof callback === 'function') {
                        callback();
                    }
                }
            });

            $button.fadeIn();
        }

        function changeBox(handle) {
            var $newBox = null,
                $oldBox = null,
                $guide = null,
                guideWidth = 0,
                boxWidth = 0,
                boxBg = null,
                dummyOpts = {
                    position: 'absolute',
                    top: 0,
                    height: '100%',
                    zIndex: 2
                };

            if (handle === 'fr') {
                $newBox = $('.mainBox02 .sect03');
                $oldBox = $('.mainBox02 .sect02');
                $guide = $newBox.find('.guide02');
                boxBg = '#7b4cd3';
                dummyOpts.right = 0;
            } else if (handle === 'fl') {
                $newBox = $('.mainBox02 .sect02');
                $oldBox = $('.mainBox02 .sect03');
                $guide = $newBox.find('.guide01');
                boxBg = '#f8f9fe';
                dummyOpts.left = 0;
            }

            $newBox.show().css('visibility', 'hidden');
            boxWidth = handle === 'fr' ? -parseInt($guide.width(), 10) : parseInt($guide.width(), 10);
            guideWidth = $guide.width() + parseInt($guide.css('margin-left'), 10)

            dummyOpts.width = guideWidth + 'px';
            dummyOpts.background = boxBg;

            // �붾� bg �곸슜
            $('.mainBox02').append($('<div class="dummyBg"/>').css(dummyOpts));

            $newBox.css({
                visibility: 'visible',
                display: 'none',
                position: 'absolute',
                top: 0,
                left: 0,
                width: '100%',
                zIndex: 3
            });

            $oldBox.css({
                display: 'block',
                position: 'absolute',
                top: 0,
                left: 0,
                width: '100%',
                zIndex: 3
            }).stop(true, false).animate({
                left: boxWidth + 'px'
            }, {
                duration: animateSp,
                complete: function() {
                    // �ㅽ��� �쒓굅 �꾩슂
                    $oldBox.fadeOut({
                        queue: false,
                        duration: animateSp
                    });
                    $newBox.fadeIn(animateSp);
                    $newBox.promise().done(function() {
                        $('.dummyBg').remove();
                        //focus
                        $newBox.find(".irCont").focus();
                    });
                }
            });
        }

        $(".mainBox02 .sect01 span a").on("click", function(ev) {
            ev.preventDefault();
            if ($('.mainBox02 > div').is(':animated')) {
                return;
            }
            if ($(this).parent().hasClass("fl")) {
                $('.sect02').show().css({
                    visibility: 'hidden'
                });
                openBox('fl');
            } else {
                $('.sect03').show().css({
                    visibility: 'hidden'
                });
                openBox('fr');
            }
        });

        $(".mainBox02 .sect02 span a").on("click", function(ev) {
            ev.preventDefault();
            if ($('.mainBox02 > div').is(':animated')) {
                return;
            }
            if ($(this).hasClass("fl")) {
                $(".sect01").show();
                closeBox('fl');
            } else {
                changeBox('fr')

            }
        });

        $(".mainBox02 .sect03 span a").on("click", function(ev) {
            ev.preventDefault();
            if ($('.mainBox02 > div').is(':animated')) {
                return;
            }
            if ($(this).hasClass("fl")) {
                changeBox('fl')
            } else {
                $('.sect01').show();
                closeBox('fr');
            }
        });
        // 硫붿씤 �몄쓽�� �앸같

        //蹂몃Ц蹂닿린 �대┃�� �ъ빱�� �대룞 
        // $(".accessbility a").on("keydown", function(ev) {
        //     if (ev.keyCode == 13) {
        //         $("header").find("a").eq(0).focus();
        //     }
        // })


        //硫붿씤 諛곕꼫 
        var img_slider_lock,
            img_nav,
            img_banner,
            timerSlider,
            nextIdx,
            img_slider_index = 1,
            img_slider_num = $('.rollingList>li').length;


        //泥섏쓬 諛곕꼫 �ㅼ젙 
        $('.rollingList>li:first-child').addClass('on');

        // 諛곕꼫 �먮룞 �대룞 
        // 諛곕꼫 �대�吏�媛� 1媛� �댁긽�쇰븣留� �숈옉
        if(img_slider_num > 1){
        	timerSlider = setInterval(rolling, 10000);
        }

        function rolling(idx) {
            img_nav = $('.controlBox .playBox >ul>li.on');
            img_banner = $(".rollingList>li.on");
            if (img_slider_lock == true || idx == img_nav.index()) return;
            img_slider_lock = true;
            if (idx != undefined) {
                img_slider_index = idx;
            }
            nextIdx = img_slider_index + 1;

            $(".rollingList>li:nth-of-type(" + nextIdx + ")").addClass("next");

            $(img_nav).removeClass("on");
            $(".controlBox .playBox >ul>li:nth-of-type(" + nextIdx + ")").addClass("on");
            $(img_banner).clearQueue().stop().animate({
                width: 0
            }, 1000, function() {
                $(this).removeClass('on').css('width', '');

                $(this).parent().find('.next').addClass('on');
                $(this).parent().find('.next').removeClass('next');

                img_slider_index++;
                if (img_slider_index == img_slider_num) {
                    img_slider_index = 0;
                }

                img_slider_lock = false;
            });
        }

        //諛곕꼫 �ㅻ퉬寃뚯씠�� �쒖옉/以묒�
        $('.playBox>a').off('click');
        $('.playBox>a').on('click', function(ev) {
            ev.preventDefault();
            if ($(this).hasClass('play')) {
                $(this).css('display', 'none');
                $(this).siblings(".stop").css('display', '');
                clearInterval(timerSlider);
                timerSlider = null;
            } else {
                $(this).addClass('on');
                $(this).css('display', 'none');
                $(this).siblings(".play").css('display', '');
                
                //諛곕꼫 �대�吏�媛� 1媛� �댁긽�쇰븣留� �숈옉
                if(img_slider_num > 1){
                	timerSlider = setInterval(rolling, 10000);
                }
            }
        });

        // 諛곕꼫 �대┃
        $('.playBox>ul>li>a').off("click");
        $('.playBox>ul>li>a').on("click", function(ev) {
            ev.preventDefault();
            var sliderIdx = $(this).closest("li").index();
            rolling(sliderIdx);
        })

        // �꾨쾭嫄� 踰꾪듉 �대┃
        function showTMenu() {
            $(".totalMenu .tMenuBox").show();
            $(".totalMenu .tMenuBox").next(".dimmed").show();
        }

        function hideTMenu() {
            $(".totalMenu .tMenuBox").hide();
            $(".totalMenu .tMenuBox").next(".dimmed").hide();
        }
        $("nav .totalMenu .btnOpen").off("click").on("click", function() {
            showTMenu();
            $(".tMenuBox").find("a").eq(0).focus();
            commonJs.saveTop = $(window).scrollTop();
            $('body').css({
                position: 'fixed',
                top: -commonJs.saveTop + 'px'
            });
        });
        $("nav .totalMenu .close").off().on("click", function(ev) {
            ev.preventDefault();
            hideTMenu();
            $('body').css({
                position: '',
                top: ''
            });
            $(window).scrollTop(commonJs.saveTop);
        });


        //focus �묎렐�� 
        $(".tMenuBox dd").find("a").eq(0).off().on('keydown', function(ev) {
            // back space event
            if (ev.shiftKey == true && ev.keyCode == 9) {
                hideTMenu();
                $("nav .totalMenu .btnOpen").focus();
                ev.preventDefault();
            }
        });

        $(".totalMenu .close").on('keydown', function(ev) {
            if (ev.keyCode == 9) {
                hideTMenu();
            }
        });

        // 由ъ뒪�� �� �대┃
        // 由ъ뒪�� �� �쒖꽦�� �� 寃쎌슦 �ㅼ뿉 諛곌꼍 留곹겕 諛⑹� 
        function blockLink() {
            $(".rollingList li a").off().on("click", function(ev) {
                ev.preventDefault();
            })
        }
        $(".controlList li>a").off("click");
        $(".controlList li>a").on("click", function(ev) {
            $(this).closest("li").toggleClass("on").siblings("li").removeClass("on");

            if ($(this).closest("li").hasClass("on")) {
                blockLink();
            } else {
                $(".rollingList li a").off("click");
            }
        });

        //focus �묎렐�� 
        $(".controlList li .inBox").each(function(idx) {
            var elmFirst = $(this).find("a").eq(0);
            elmFirst.off().on('keydown', function(ev) {
                // back space event
                if (ev.shiftKey == true && ev.keyCode == 9) {
                    $(this).closest("li").removeClass("on");
                }
            });

            //�몄쓽�� �앸같 蹂대궡湲� 
            if (idx == 0) {
                var elmNext = $(this).find("a.btnType4.type2");
                var toggleMenu = $(".controlList li .inBox").eq(0).find(".addBox");
                elmNext.off().on('keydown', function(ev) {
                    // next event
                    if (ev.keyCode == 9) {
                        toggleMenu.eq(0).hide();
                        toggleMenu.eq(1).show();
                    }
                });
                var elmEnd = $(this).find("a.btnType4.type3");
            } else {
                //諛곗넚議고쉶, 媛꾪렪 �쒕퉬�� 
                elmEnd = $(this).find("a").last();
            }

            //留덉�留� �ъ빱�� �쇨꼍�� �� �リ린 
            elmEnd.off().on('keydown', function(ev) {
                // next event
                if (ev.keyCode == 9) {
                    $(".controlList li").eq(idx).removeClass("on");
                }
            });
        });
        //controll box - 諛곗넚 議고쉶 留덉�留� �쒓렇 tab out close
        $(".controlList li .inBox").eq(0).find('.btn_c >a').off().on('keydown', function(ev){
        	// next event
            if (ev.shiftKey == false && ev.keyCode == 9) {
            	$(".controlList li").eq(1).removeClass("on");
            }        	
        });
        
       //controll box - �쒕퉬�� �덈궡  留덉�留� �쒓렇 tab out close
       $(".controlList li .inBox").eq(1).find('a').last().off().on('keydown', function(ev){
        	// next event
            if (ev.shiftKey == false && ev.keyCode == 9) {
            	$(".controlList li").eq(2).removeClass("on");
            }        	
        });
        
        $(".controlList>li>a").on("keydown", function(ev) {
            if (ev.shiftKey == true && ev.keyCode == 9) {
                $(this).closest("li").removeClass("on");
            }
        })

        //由ъ뒪�� �� - �대� �꾩씠肄� �대┃
        $(".inBox .selBtn a").off("click");
        $(".inBox .selBtn a").on("click", function(ev) {
            //諛곗넚 議고쉶 ��씪 寃쎌슦 
            var tabIndex = $(".inBox .selBtn").index($(this).closest(".selBtn"));
            if (tabIndex != 2) {
                ev.preventDefault();
            }
            $(this).siblings().removeClass("on");
            $(this).addClass("on");
            if (tabIndex == 1) {
                var subCont = $(this).closest(".fl").next(".fr");
                var subContIdx = $(this).index();
                subCont.children("div").hide();
                subCont.children("div").eq(subContIdx).show();
            }
        });
        //�몄쓽�� �앸같蹂대궡湲� - 蹂대궡�� �щ엺 �ㅼ쓬 踰꾪듉 �대┃�� �대룞
        $(".inBox").first().find(".btnType4.type2").on("click", function(ev) {
            ev.preventDefault();
            var frContent = $(".inBox").first().find(".addBox");
            frContent.eq(0).hide();
            frContent.eq(1).show();
        })

        function posYcheck(e) {
            if ((e.originalEvent.wheelDelta && e.originalEvent.wheelDelta > 0) || (e.originalEvent.detail && e.originalEvent.detail < 0)) {
                _isShowScrollTrace = false;
                e.preventDefault();
                gotoPrevCat();
            } else {
                var isEndScroll = (parseInt($(window).scrollTop(), 10) == $(document).height() - $(window).height());
                if (page_num <= 3 && !isEndScroll) {
                    _isShowScrollTrace = false;
                    e.preventDefault();
                    gotoNextCat();
                }
            }
        }

        var page_num = 1;
        var _isShowScrollTrace = true;
        var curIndex;


        $(".mainLink>a").off("click");
        $(".mainLink>a").on("click", function(ev) {
            ev.preventDefault();
            page_num = $(this).index() + 1;
            gotoCat(page_num);
        })



        function gotoPrevCat() {
            page_num = (page_num * 1) - 1;
            if (page_num == 0) page_num = 1;
            gotoCat(page_num);
        }

        function gotoNextCat() {
            page_num = (page_num * 1) + 1;

            if (page_num <= 3) {
                gotoCat(page_num);
            }

        }

        function gotoCat(page_num) {
            var offsetY = $('.mainBox0' + page_num).offset().top;
            _isShowScrollTrace = false;

            if (_isShowScrollTrace == true) return;
            $('html,body').stop().animate({
                scrollTop: offsetY
            }, 500).promise().done(function() {
                _isShowScrollTrace = true;
            });

            $(".mainLink>a").removeClass('on');
            $(".mainLink>a:nth-of-type(" + page_num + ")").addClass("on");
        }
        //硫붿씤 �ㅽ겕由쏀듃 �� 

        // mouse scroll 硫붿씤 �섏씠吏��먯꽌留� �몄텧 
        if ($(location).attr('pathname').indexOf("main") != -1) {
        	
        	//泥섏쓬 濡쒕뵫 �섏뿬 gnb 硫붾돱 �ㅼ젙
        	if ($(document).scrollTop() > 0) {
                $("header").removeClass("main");
            } else {
                $("header").addClass("main");
            }
            $(window).bind('mousewheel DOMMouseScroll', function(e) {
                if ($('html,body').is(':animated')) {
                    return false;
                }

                if (!e.originalEvent) {
                    return false;
                }

                // clearTimeout(tout)
                // var tout = setTimeout(function() {
                //     posYcheck(e);
                // }, 10);
                if ($("body").css("overflow") != "hidden") {
                    posYcheck(e);
                }
            });


            var scrollWindowHandler = function(e) {
                if ($(document).scrollTop() > 0) {
                    $("header").removeClass("main");
                } else {
                    $("header").addClass("main");
                }

                if (_isShowScrollTrace == true) {
                    if (!$('html,body').is(':animated')) {
                        var offset = $('article').offset();
                        var y = $(window).scrollTop() + offset.top + (($(window).height() - offset.top) / 2);
                        $('article').each(function() {
                            if ($(window).scrollTop() == 0) {
                                curIndex = 1;
                            } else if (y >= $(this).offset().top) {
                                curIndex = $(this).index();
                            } else {
                                return false;
                            }
                        });
                        if (curIndex != null) {
                            $('.mainLink a').removeClass('on');
                            $(".mainLink>a:nth-of-type(" + curIndex + ")").addClass("on");
                        }
                    }
                } else {
                    _isShowScrollTrace = true;
                    e.preventDefault();
                    return false;
                }
            };

            $(window).scroll(scrollWindowHandler);

        }


        //�듬찓��
        $("aside .btnQuick").on("click", function(ev) {
            ev.preventDefault();
            $(this).closest(".quick").toggleClass("on");
            quickTitle();
        });
        $("aside .btnTop").on("click", function(ev) {
            ev.preventDefault();
            $('html,body').animate({
                'scrollTop': 0
            }, 500)
        })

        // iframe �믪씠 �ㅼ젙 (.iframeBox �대��� �덈뒗 iframe�먮쭔 �곸슜
        var $iframe = $('.iframeBox > iframe');


        // iframe setHeight event
        $iframe.on('iframe.setHeight', function() {
            var $this = $(this),
                iframeDocument = this.contentDocument || this.contentWindow.document,
                $documentBody = $(iframeDocument).find('body'),
                getHeight = 0;

            $documentBody.css('height', 'auto');
            if ($documentBody.length > 0 && $documentBody.children()[0] != undefined) {
            	getHeight = $documentBody.children()[0].offsetHeight;
                $this.css('height', getHeight);
            }
        });



        // �뚯궗 �뚭컻 HISTORY OF CU POST
        $('.company03').on('click', '.historyTab a', function(e) {
            e.preventDefault();
            var $parent = $(this).closest('li'),
                $siblings = $parent.siblings(),
                $fl = $(this).closest('.fl'),
                $fr = $fl.siblings('.fr'),
                idx = $parent.index();

            $siblings.removeClass('on');
            $parent.addClass('on');

            $fr.hide();
            $fr.eq(idx).show();
        });

        // �뚯궗�뚭컻 STORE
        $('.company04 > .inner').css({
            overflow: 'hidden',
            height: '100%'
        });
        $('.company04').on('click', '.store a', function(e) {
            e.preventDefault();
            var $old = $(this).closest('.store'),
                $new = $(this).hasClass('next') ? $old.next('.store') : $old.prev('.store'),
                oldLeft = $(this).hasClass('next') ? '-100%' : '100%',
                newLeft = $(this).hasClass('next') ? '100%' : '-100%';

            if ($old.is(':animated')) {
                return;
            }


            $old.find('a').hide();
            $old.stop(true, false).animate({
                left: oldLeft
            });

            $new.find('a').show();
            $new.show().css({
                left: newLeft
            }).stop(true, false).animate({
                left: '0'
            }, {
                complete: function() {
                    $old.hide();
                }
            });
        });

        // �뚯궗 �뚭컻 PARTNER
        $('.company06').on('click', '.compTab > ul a', function(e) {
            e.preventDefault();
            var $parent = $(this).parent(),
                $siblings = $parent.siblings(),
                $tabCont = $(this).closest('.compTab').find('.tabCont'),
                idx = $parent.index();

            $siblings.removeClass('on');
            $parent.addClass('on');

            $tabCont.hide();
            $tabCont.eq(idx).show();
        });

        // PR VIDEO �좏뒠釉� �앹뾽
        $('.company07').on('click', '.prBox a', function(e) {
            e.preventDefault();

            if ($(this).hasClass('prev')) {

            } else if ($(this).hasClass('next')) {

            } else {
                var $popup = null,
                    $popTop = null,
                    $popCont = null,
                    $youtube = null,
                    $subtitle = null,
                    idx = $(this).closest('li').index('.prBox ul li'),
                    getTit = $(this).find('> span').text();

                // �앹뾽 �앹꽦
                createLayerPopup({
                    wrapper: 'body',
                    templateId: 'layerPop',
                    appendTop: '',
                    appendCont: $('<div class="youtube" /><div class="subtitle" />')
                });

                $popup = $('#layerPop');
                $popTop = $popup.find('.popTop');
                $popCont = $popup.find('.popCont');
                $youtube = $popCont.find('.youtube');
                $subtitle = $popCont.find('.subtitle');

                // �앹뾽 �④�
                $popup.hide();

                // �앹뾽 ���댄� �곸슜
                $popTop.find('> h1').text(getTit);
                $popCont.addClass('compYoutube');

                if (!$youtube.find('iframe').length) {
                    $youtube.append('<iframe width="540" height="302" frameborder="0" />')
                }

                $subtitle.trigger('pr.setVideo', [{
                    index: idx,
                    iframe: $youtube.find('> iframe'),
                    textarea: $subtitle
                }]);

                // �앹뾽 �ㅽ뵂
                $.popup('open', {
                    id: 'layerPop' // option.id.match濡� �명빐 �먮윭媛� �섏꽌 �뺤떇�곸쑝濡쒕쭔 �ｌ뼱以�
                });
            }
        });

        //�뚮찓�� ���댄� �띿꽦 異붽�
        function quickTitle() {
            if ($("aside .btnQuick").closest("aside").hasClass("on")) {
                var quickTitle = "�リ린";
            } else {
                var quickTitle = "�닿린";
            }
            $("aside .btnQuick").attr("title", quickTitle);
        }

        //�섎떒 ���댄� �띿꽦 異붽� 
        function bottomTitle() {
            if ($(".footMenu .selType1 ul").css("display") == "block") {
                var quickTitle = "�リ린";
            } else {
                var quickTitle = "�닿린";
            }
            $(".footMenu .selType1>a").attr("title", quickTitle);
        }
        


        quickTitle();
        bottomTitle();
        
        
        //援�젣 �뱀넚 �댁뿭 - �댁슜 �덈챸 - �곷Ц �쒓린 �앹뾽 寃���
        $(".selSearch a").off("click").on("click", function(){
        	$(this).addClass("on").siblings().removeClass("on");
        });
        
        (function() {
            var $prBox = $('.prBox'),
                $ul = $prBox.find('ul'),
                $view = $ul.closest('.js-prBox-list'),
                $wrap = $ul.closest('.js-prBox-wrap'),
                $button = $prBox.find('.prev, .next'),
                len = $ul.length,
                currentIndex = $ul.filter('.on').length > 0 ? $ul.filter('.on').index() : 0;

            var init = function() {
                setup();
            };

            var setup = function() {
                if (!$view.length) {
                    $ul.wrapAll('<div class="js-prBox-list" />');
                    $view = $ul.parent('.js-prBox-list');
                }
                if (!$wrap.length) {
                    $view.wrap('<div class="js-prBox-wrap" />');
                    $wrap = $view.parent('.js-prBox-wrap');
                }

                render();
                bindEvents();
                checkArrow();
            };

            var render = function() {
                $wrap.css('overflow', 'hidden');
                $view.css({
                    width: 100 * len + '%'
                });
                $ul.css({
                    float: 'left',
                    width: 100 / len + '%'
                });

                $ul.removeClass('on');
                $ul.eq(currentIndex).addClass('on');
            };

            var checkArrow = function() {
                if (len === 1) {
                    $button.hide();
                } else {
                    if (currentIndex === 0) {
                        $button.filter('.prev').hide();
                    } else {
                        $button.filter('.prev').show();
                    }

                    if (currentIndex === len - 1) {
                        $button.filter('.next').hide();
                    } else {
                        $button.filter('.next').show();
                    }
                }
            };

            var bindEvents = function() {
                $button.off('click.prBoxSlide');
                $button.on('click.prBoxSlide', function(e) {
                    e.preventDefault();
                    if ($view.is(':animated')) {
                        return;
                    }

                    if ($(this).hasClass('next')) {
                        slideTo(currentIndex + 1);
                    } else {
                        slideTo(currentIndex - 1);
                    }
                });
            };

            var slideTo = function(index) {
                if ($view.is(':animated')) {
                    return;
                }
                $view.animate({
                    marginLeft: -index * 100 + '%'
                });

                currentIndex = index;
                checkArrow();
            };

            init();

            commonJs.prVideoSlide = {
                init: init,
                slideTo: slideTo
            };
        }());
    });


    $(window).load(function() {
        var resizeTimer = null;
        //console.log('loda')
        function imgResize() {
            var w = $(window).width();
            $('div.rollingBox>ul.rollingList>li>a>img').each(function() {
                var img = $(this)
                var n = w / 2 - 700;
                img.css({
                    left: n + 'px',
                    position: 'absolute'
                });
            });
        }

        $(window).on('resize', function() {
            clearTimeout(resizeTimer);
            resizeTimer = setTimeout(function() {
                imgResize();
                $('.iframeBox > iframe').trigger('iframe.setHeight');
            }, 0);
        }).trigger('resize');
    });



})(jQuery, window, document);
