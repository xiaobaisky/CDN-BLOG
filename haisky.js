"use strict";

categoriesBarActive()
topCategoriesBarScroll()

//分类条
function categoriesBarActive() {
    var urlinfo = window.location.pathname;
    urlinfo = decodeURIComponent(urlinfo)
    console.log(urlinfo);
    //判断是否是首页
    if (urlinfo == '/') {
        if (document.querySelector('#category-bar')) {
            document.getElementById('首页').classList.add("select")
        }
    } else {
        // 验证是否是分类链接
        var pattern = /\/categories\/.*?\//;
        var patbool = pattern.test(urlinfo);
        console.log(patbool);
        // 获取当前的分类
        if (patbool) {
            var valuegroup = urlinfo.split("/");
            console.log(valuegroup[2]);
            // 获取当前分类
            var nowCategorie = valuegroup[2];
            if (document.querySelector('#category-bar')) {
                document.getElementById(nowCategorie).classList.add("select");
            }
        }
    }

}
//鼠标控制横向滚动
function topCategoriesBarScroll() {
    if (document.getElementById("category-bar-items")) {
        let xscroll = document.getElementById("category-bar-items");
        xscroll.addEventListener("mousewheel", function(e) {
            //计算鼠标滚轮滚动的距离
            let v = -e.wheelDelta / 2;
            xscroll.scrollLeft += v;
            //阻止浏览器默认方法
            e.preventDefault();
        }, false);
    }
}
//musictips
setInterval(function() {
    const show = document.querySelector('span[data-show]')
    const next = show.nextElementSibling || document.querySelector('.first-tips')
    const up = document.querySelector('span[data-up]')

    if (up) {
        up.removeAttribute('data-up')
    }

    show.removeAttribute('data-show')
    show.setAttribute('data-up', '')

    next.setAttribute('data-show', '')
}, 2000)

function coverColor() {
    var t = null === (t = document.getElementById("post-cover")) || void 0 === t ? void 0 : t.src;
    void 0 !== t ? RGBaster.colors(t, {
        paletteSize: 30,
        exclude: ["rgb(255,255,255)", "rgb(0,0,0)", "rgb(254,254,254)"],
        success: function (t) {
            document.styleSheets[0].addRule(":root", "--wds-main:" + t.dominant + "!important"), document.getElementById("coverdiv").classList.add("loaded")
        },
        error: function () {
            document.styleSheets[0].addRule(":root", "--wds-main: #057748 !important")
        }
    }) : document.styleSheets[0].addRule(":root", "--wds-main: #057748 !important")
}
