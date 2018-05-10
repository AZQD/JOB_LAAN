//点击图片logo跳转到index页面；


//Successfully Failed  Kalichimall  commonPopFun
$('.searchBox .search .searchLeft .logo').click(function () {
    window.open('index.html');
//        window.location.href = 'index.html' + window.location.search;
});

localStorage.removeItem("searchKeyWord");
$('.searchBox .search .searchRight .searchImg').unbind('click').click(function () {
    var searchKeyWord = $.trim($('.searchBox .search .searchRight .ipt').val());
    if(searchKeyWord != ''){
        localStorage.setItem('searchOrTab',"search");
        localStorage.setItem('searchKeyWord',searchKeyWord);
        window.open("category.html?searchOrTab=search&searchKeyWord="+searchKeyWord);
//            window.location.href = "category.html?searchOrTab=search&searchKeyWord="+searchKeyWord;
    }else{
        //alert('请输入搜索关键词！');
    }
});

//点击发布
$('.searchBox .search .searchRight .searchBtn').unbind('click').click(function () {
    window.open('publish.html?searchPart=' + "searchPart");
//        window.location.href = "publish.html";
});