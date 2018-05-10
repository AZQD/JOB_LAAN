//搜索 (category.html, profile.html不需要此js，需要单独写)
localStorage.removeItem("searchKeyWord");


function searchBoxRightFun(){
    var searchKeyWord = $.trim($('.searchBox .search .searchRight .ipt').val());
    if(searchKeyWord != ''){
        localStorage.setItem('searchOrTab',"search");
        localStorage.setItem('searchKeyWord',searchKeyWord);
        window.location.href = "category.html?searchOrTab=search&searchKeyWord="+searchKeyWord;
        //    window.location.href = "category.html?searchOrTab=tab&cid="+cid;
    }else{
        //alert('请输入搜索关键词！');
    }
}
var searchStatus = 0;
$('.searchBox .search .searchRight .ipt').on('focus',function () {
    searchStatus = 1;
});
$('.searchBox .search .searchRight .ipt').on('blur',function () {
    searchStatus = 0;
});

$('.searchBox .search .searchRight .searchImg').unbind('click').click(function () {
    searchBoxRightFun();
});


document.onkeydown = function(ev){
    ev = ev || event;
    console.log(ev.keyCode);
    if(ev.keyCode == 13){
        if(searchStatus == 1){ //按enter搜索
            searchBoxRightFun();
        }
        return false;
    }
};


//点击发布
$('.searchBox .search .searchRight .searchBtn').unbind('click').click(function () {
    window.location.href = "publish.html";
});