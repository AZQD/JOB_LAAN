/*.searchBox .search .menuUl .menuLi .menuLiLink*/
/*跳转到index页面*/



$('.searchBox .search .searchLeft .fist').click(function(){
    window.location.href = 'index.html';
});
var getCid;
//二级菜单 数据交互
$.ajax({
    type: "get",
    url: baseUrl+"/apigateway/categorys",
    dataType:"json",
    success: function(data){
        if(data.status == 200){
            data = JSON.parse(data.data);
            console.log("获得产品分类",data);

            var cidIdArr = [];
            var cidNameArr = [];
            var totalStr = "";
            for (var sort in data) {
                cidIdArr.push(data[sort].cid);
                cidNameArr.push(data[sort].name);
                //二级菜单
                var str = '';
                var listStr = '';
                var details = data[sort].sub;
				
				str += '<li class="twoLi" cid='+data[sort].cid+' cidName='+data[sort].name+'><a href="###" class="twoLiLink">ALL</a></li>';
                //console.log('000000000', data[sort].name);
                for (var detail in details){
                    str += '<li class="twoLi" cid='+details[detail].cid+' cidName='+details[detail].name+'><a href="###" class="twoLiLink">'+details[detail].name+'</a></li>';
                }
                
                listStr = '<li class="menuLi"><a href="#" class="menuLiLink">'+data[sort].name+'</a><ul class="twoUl" style="display: none;">'+str+'</ul></li>';
                $('.searchBox .search .menuUl').append(listStr);
            }
            //$('.searchBox .search .searchLeft .second').html(cidNameArr[0]);
            console.log('cidIdArr='+cidIdArr);

            /*phone切换菜单*/
            $('.searchBox .search .searchLeft .second').css({

                paddingBottom:'40px',
                paddingRight:'20px'
            });
            var search = $('.searchBox .search').offset().left;
            var searchUlLeft = $('.searchBox .search .searchLeft .second').offset().left;
            //$('.searchBox .search .menuUl').css('left', searchUlLeft-76);
            $('.searchBox .search .searchLeft .second').hover(function () {
                $('.searchBox .search .menuUl').show();
            },function(){
                $('.menuUl').hide();
            });
            $('.searchBox .search .menuUl').hover(function () {
                $('.searchBox .search .menuUl').show();
            },function () {
                $('.searchBox .search .menuUl').hide();
            });

            //调整
            $('.searchBox .search .menuUl .menuLi').click(function(){
                /*var index = $(this).index();
                getCid = cidIdArr[index];
                $('.searchBox .search .menuUl').hide();
                $('.searchBox .search .searchLeft .second').text($(this).children('.menuLiLink').text());
                localStorage.setItem('cid',cidIdArr[index]);
                localStorage.setItem('cidName',cidNameArr[index]);*/














            });

            //二级菜单

            if(getParamByUrl('searchOrTab') != 'false'){//hover可以显示category.html的二级类别

            }
            $('.searchBox .search .menuUl .menuLi').hover(
                function(){
                    $(this).children('.twoUl').show();
                    $(this).find('.twoLi').unbind('click').click(function (event) {
                        event.stopPropagation();
                        //alert($(this).attr('cidName'));
                        $('.searchBox .search .menuUl').hide();
                        //alert(data[sort].name);
						if(data[sort].name == 'Others'){
                            //alert($(this).attr('cidName'));
                            var cidName = $(this).attr('cidName');
                            if(cidName == 'Life'){
                                cidName = 'Life Goods';
                            }
                            if(cidName == 'Family'){
                                cidName = 'Family House';
                            }
                            $('.searchBox .search .searchLeft .second').text(cidName);
						}else {
                            $('.searchBox .search .searchLeft .second').text($(this).children('.twoLiLink').text());
                        }

                        //在category.html页面有个定时器，实时监听变化
                        categoryErJiCid = $(this).attr('cid');
                        categoryErJiCidBtn = true;


                        localStorage.setItem('cid',$(this).attr('cid'));
                        localStorage.setItem('cidName',$(this).attr('cidName'));

                        //detail.html页面点击之后跳转到category.html
                        if((getParamByUrl('id')) != 'false'){
                            window.open("category.html?searchOrTab=tab&cid="+$(this).attr('cid'));
                        }

                    });
                },
                function(){
                    $(this).children('.twoUl').hide();
                }
            );

        }else{
            commonPopFun(data.msg, "Failed");
        }
    },
    error:function(error){
        console.log(error);
    }
});