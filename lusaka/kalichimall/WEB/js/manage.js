$(function(){


    //getmarquee
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getmarquee",
        dataType:"json",
        success: function(data){
            if(data.status ==200){
                console.log('getmarquee',data);
                $('#aboutmarquee').html(data.data);
            }

        },
        error:function(error){
            console.log(error);
        }
    });

    //commonPopBox2
    /*
     * $('.commonPopBox2').show();
     $('.commonPopBox2 .commonPop .title').html();
     $('.commonPopBox2 .commonPop .detailTip').html();
     * */
    $('.commonPopBox2').css({
        'width':$(window).width(),
        'height':$(window).height(),
        'top':$(window).scrollTop()
    });
//$('.commonPopBox2').show();
    /*if($('.commonPopBox2').is(':visible')){
     $('body').css('overflow', 'hidden');
     }*/

    function commonPopFun2(dataMsg, title, func){
        $('.commonPopBox2').css({
            'width':$(window).width(),
            'height':$(window).height(),
            'top':$(window).scrollTop()
        });
        $('.commonPopBox2').show();
        $('.commonPopBox2 .commonPop .title').html(title);
        $('.commonPopBox2 .commonPop .detailTip').html(dataMsg);
        if($('.commonPopBox2').is(':visible')){
            $('body').css('overflow', 'hidden');
        }

        $('.commonPopBox2 .commonPop .confirmBox .confirmBtn1').unbind('click').click(function(){
            $('.commonPopBox2').hide();
            $('body').css('overflow', 'auto');
            func();
        });

        $('.commonPopBox2 .commonPop .confirmBox .confirmBtn2').unbind('click').click(function(){
            $('.commonPopBox2').hide();
            $('body').css('overflow', 'auto');
        });
    }


    if(getCookie('showSecondPart') == 1){
        $('.infoBox .info .infoWrap .infoLeft .infoLeftTitle').children("a").removeClass("active").eq(1).addClass('active');
        $('.infoBox .info .infoWrap .infoRight .part').hide().eq(1).show();
        delCookie('showSecondPart');
    }


    //点击图片logo跳转到index页面；
    $('.searchBox .search .searchLeft .logo').click(function () {
        window.location.href = 'index.html' + window.location.search;
    });

    //tab切换
    $('.infoBox .info .infoWrap .infoLeft .infoLeftTitle').click(function () {
        var index = $(this).index();
        $('.infoBox .info .infoWrap .infoLeft .infoLeftTitle').children("a").removeClass("active");
        $(this).children("a").addClass("active");
        $('.infoBox .info .infoWrap .infoRight .part').hide().eq(index).show();
    });

    //跳转到忘记密码页
    $('.infoBox .info .infoWrap .infoRight .part1 .attrBox .forget').click(function(){
        window.location.href = 'reset_password.html';
    });


    var sex = 0;

    //获取用户信息（用于展示修改之前的用户信息）
    var headLogo = '';
    var authInfo = {
        "token":token,
        "timestamp":timestamp
    };
    $.ajax({
        type:"POST",
        url:baseUrl + "/apigateway/getuserinfo",
        dataType:"json",
        data:JSON.stringify(authInfo),
        success:function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得用户信息",data);
                console.log("用户已登陆");


                sex = data.sex;
                //gender
                if(data.sex == 1){
                    $('.infoBox .info .infoWrap .infoRight .part1 .attrBox .genderMale').attr('checked', 'checked');
                }else if(data.sex == 2){
                    $('.infoBox .info .infoWrap .infoRight .part1 .attrBox .genderFemale').attr('checked', 'checked');
                }

                //修改title
                $('#manageTitle').html(data.nickname + "'s home. kalichimall, make money by your second-hand goods.");

                $('.infoBox .info .infoWrap .infoRight .part1 .attrBox .value').html(data.phone);
                $('#nickName').val(data.nickname);

                $('.infoBox .info .infoWrap .infoRight .part1 .headBox .headImg').show().attr('src', baseImgSrc + data.logo);

                //managePopBox原头像
                $('.managePopBox .managePop .imgBox img').attr('src', baseImgSrc + data.logo);


                //点击Edit
                $('.infoBox .info .infoWrap .infoRight .part1 .headBox .goToEdit a').unbind('click').click(function(){
                    $('.managePopBox').show();
                    $('body').css('overflow', 'hidden');
                });

                //右上角X
                $('.managePopBox .managePop .manageCloseBtn').unbind('click').click(function(){
                    $('.managePopBox').hide();
                    $('body').css('overflow', 'auto');
                });




                //初始头像
                headLogo = data.logo;
                //修改用户头像
                $(".a-upload4").on("change","input[type='file']",function(){

                    //goOn
                    $('.managePopBox .managePop .imgBox img').attr('src', 'image/index/loading.gif');
//                        $('.managePopBox .managePop .imgBox .headImgPic').hide();
//                        $('.managePopBox .managePop .imgBox .loadingText').show();
                    $('.uploadLogo4').hide();
                    console.log($(this));
                    console.log($(this).val());
                    var filePath=$(this).val();
                    if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
                        $(".fileerrorTip").html("").hide();
                        var arr=filePath.split('\\');
                        var fileName=arr[arr.length-1];

                        //上传图片
                        var fd = new FormData();
                        fd.append("upload", 1);
                        console.log($("#upfile4").get(0).files[0]);
                        fd.append("upfile", $("#upfile4").get(0).files[0]);
                        $.ajax({
                            url: baseUrl+"/apigateway/upfile",
                            type: "POST",
                            processData: false,
                            contentType: false,
                            data: fd,
                            success: function(imgData) {
                                if(imgData.status == 200) {
                                    console.log(imgData.data);
                                    headLogo = imgData.data;
                                    var thisSrc = baseImgSrc + headLogo;
                                    setTimeout(function(){
                                        $('.managePopBox .managePop .imgBox .headImgPic').attr('src', thisSrc);
                                    }, 1000);
//                                        $('.managePopBox .managePop .imgBox .loadingText').hide();
//                                        $('.managePopBox .managePop .imgBox .headImgPic').show();
                                }
                            }
                        });

                    }else{
                        $(".showFileName4").html("");
                        $(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").show();
                        return false
                    }
                });

                //点击保存
                //var sex = 0;
                $('.managePopBox .managePop .save .saveBtn').unbind('click').click(function(){
                    console.log(baseImgSrc + headLogo);
                    $('.infoBox .info .infoWrap .infoRight .part1 .headBox .headImg').attr('src', baseImgSrc + headLogo);
                    $('.managePopBox').hide();
                    $('body').css('overflow', 'auto');
                });


                //点击推荐的图片
                $('.managePopBox .managePop .recommendBox .choose').unbind('click').click(function(){
                    var index = $(this).index();
                    alert(index);
                });



            }else{
                console.log(data);
                commonPopFun(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });



    //点击保存：SAVE CHANGES
    //var sex = 0;
    $('.infoBox .info .infoWrap .infoRight .part1 .attrBox .saveLink').unbind('click').click(function(){
        if ($('.infoBox .info .infoWrap .infoRight .part1 .attrBox .gender').get(0).checked) {
            sex = 1;
        }
        if ($('.infoBox .info .infoWrap .infoRight .part1 .attrBox .gender').get(1).checked) {
            sex = 2;
        }
        console.log(sex);
        var changeuserinfo = {
            "token":token,
            "sex":sex.toString(),
            "logo":headLogo,
            "nickname":$('#nickName').val()
        };
        $.ajax({
            type:"POST",
            url:baseUrl + "/apigateway/changeuserinfo",
            dataType:"json",
            data:JSON.stringify(changeuserinfo),
            success:function(data){
                console.log(data);
                if(data.status == 200){
                    console.log("修改用户信息",data);
                    console.log("changeuserinfo",changeuserinfo);

                    //修改title
                    $('#manageTitle').html(data.nickname + "'s home. kalichimall, make money by your second-hand goods.");
                    commonPopFun('Your detail has been saved successfully.', 'Successfully');
                }else{
                    console.log(data);
                    commonPopFun('Sorry, failed to save your detail. Please try it later.', 'Failed');
                }
            },
            error:function(error){
                console.log(error);
                commonPopFun('Sorry, failed to save your detail. Please try it later.', 'Failed');
            }
        });
    });

    //重置密码
    var b = new Base64_new();
    var publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC5jmTSO5V9ILlphRYdfFk4M2Rko/Ur22h43SxkFcGcj9Vkuew5P65XJPQtJesvY37UmU7zXWsqT/i4Evo2gaYu9Eu/fgutkP9KE4yKh4Ruk/pYC+hyNFVIK21kl4o8cfV9cKumydj2WXgmuywX8UQiVIfbKuvEAw+RVvPjBt9UqQIDAQAB";
    var encrypt = new JSEncrypt();
    encrypt.setPublicKey(publicKey);
    $('.infoBox .info .infoWrap .infoRight .part1 .attrBox .resetLink').unbind('click').click(function(){
        var oldpass = b.encode($.trim($('#oldpass').val()));
        var newpass = b.encode($.trim($('#newpass').val()));
        var verifypass = b.encode($.trim($('#verifypass').val()));
        if(newpass == verifypass){
            var passwordData = encrypt.encrypt("oldpass="+ oldpass +"&newpass="+ newpass);//获取密钥
            var timestamp=new Date().getTime();//获取时间戳
//            console.log(loginPhone);
//            console.log(loginPassword);
//            console.log(authKey);
            var changePassInfo = {
                "token":token,
                "data":passwordData,
                "timestamp":timestamp
            };
            $.ajax({
                type:"POST",
                url:baseUrl + "/apigateway/changepass",
                dataType:"json",
                data:JSON.stringify(changePassInfo),
                success:function(data){
                    if(data.status == 200){
//                    data = JSON.parse(data.data);
                        console.log("重置密码",data);
                        commonPopFun('Your password is changed successfully', 'Successfully');
                    }else{
                        commonPopFun(data.msg, 'Failed');
                    }
                },
                error:function(error){
                    console.log(error);
                }
            });
        }else{
            commonPopFun('Sorry, failed to change your password. Please try it later.', 'Failed');
        }
    });


    //获得用户的发布信息
    //初始化
    getuserpubinfo('',0,30);
    $(".infoBox .info .infoWrap .infoRight .part2 .form .sell").change(function(){
        var index = $(this).index();
        if(index == 1){
            getuserpubinfo(0,0,30);//status=0表示在线
        }else if(index == 2){
            getuserpubinfo(2,0,30);//status=2表示完成
        }else if(index == 3){
            getuserpubinfo(1,0,30);//status=1表示下线
        }else{
            getuserpubinfo('',0,30);
        }
    });


    function getuserpubinfo(status, start, number){//status=0表示在线，status=1表示下线，status=2表示完成
        console.log('status, start, number',status, start, number);
        $.ajax({
            type: "get",
            url: baseUrl+"/apigateway/getuserpubinfo?token="+token+"&start="+start+"&n="+number+"&status="+status,
//                url: baseUrl+"/apigateway/getuserpubinfo?token="+token+'&start=&n=&status=0',
            dataType:"json",
            success: function(data){
                if(data.status == 200){
                    data = JSON.parse(data.data);
                    console.log("获得用户的发布信息",data);


                    if(status === 0){
                        $('#searchName').html('Published');
                        $('#searchLength').html(data.length);
                    }else if(status == 1){
                        $('#searchName').html('Offline');
                        $('#searchLength').html(data.length);
                    }else if(status == 2){
                        $('#searchName').html('Finished');
                        $('#searchLength').html(data.length);
                    }else{
                        $('#searchName').html('All');
                        $('#searchLength').html(data.length);
                    }

                    $('.infoBox .info .infoWrap .infoRight .part2 .listUl').empty();
                    var statusArr = [];
                    var goodidArr = [];


                    for(var i=0; i<data.length; i++){
                        statusArr.push(data[i].status);
                        goodidArr.push(data[i].id);

                        var str = '';
                        if(data[i].status == 0){//status=0表示在线
                            str = '<a href="javascript:void(0);" class="editBtn">Edit</a><br/><a href="###" style="display: none" class="goodStatus unpublish">Offline</a>&nbsp;&nbsp;<a href="###" style="display: none" class="goodStatus finished">Finished</a>';
                        }else if(data[i].status == 1){//status=1表示下线
                            str = '<a href="javascript:void(0);" class="editBtn">Edit</a><br/><a href="###" style="display: none" class="goodStatus unpublish">Publish</a>&nbsp;&nbsp;<a href="###" style="display: none" class="goodStatus finished">Finished</a>';
                        }else if(data[i].status == 2){//status=2表示完成
                            str = '';
                        }
                        $('.infoBox .info .infoWrap .infoRight .part2 .listUl').append(
                            '<li class="row listLi">' +
                            '<div class="col-xs-2 col-sm-2 left" style="background: url('+baseImgSrc + data[i].cimg+') no-repeat center center;background-size: 100% auto;"><img style="opacity: 0;" src='+baseImgSrc + data[i].cimg+'></div>' +
                            '<div class="col-xs-5 col-sm-5 middle">' +
                            '<p class="title">'+data[i].title+'</p>' +
                            '<div class="count">' +
                            '<img src="image/backManage/view.png">&nbsp;' +
                            '<span class="num view">'+data[i].views+'</span>' +
                            '<img src="image/backManage/wishs.png" class="wishs">&nbsp;' +
                            '<span class="num good">'+data[i].wishs+'</span>' +

                            '</div></div>' +
                            '<div class="col-xs-5 col-sm-5 right">' +
                            str+
//                                '<a href="javascript:void(0);" class="editBtn">Edit</a><br/><a href="###" class="goodStatus published">PUBLISHED</a><a href="###" class="goodStatus unpublish">UNPUBLISH</a><a href="###" class="goodStatus finished">FINISHED</a>' +
                            '</div>' +
                            '</li>'
                        );
                    }
                    $('.infoBox .info .infoWrap .infoRight .part2 .listUl .listLi').hover(
                        function(){
                            $(this).find('.goodStatus').show();
                        },
                        function(){
                            $(this).find('.goodStatus').hide();
                        }
                    );


                    //点击unpublish或者publish
                    $('.infoBox .info .infoWrap .infoRight .part2 .listUl .listLi').delegate('.unpublish', 'click',function(){
                        console.log(statusArr);
                        console.log(goodidArr);
                        var index = $(this).parents('.listLi').index();
                        var needStatus;
                        if(statusArr[index] == 1){//下线
                            needStatus = 0;
                            aboutPublish();
                        }else if(statusArr[index] == 0){
                            needStatus = 1;
                            commonPopFun2('Are you sure to offline this message?', 'Kalichimall',aboutPublish );
                        }

                        //更新发布状态
                        function aboutPublish(){
                            $.ajax({
                                type: "get",
                                url: baseUrl+'/apigateway/updatepubstatus?token='+token+'&status='+needStatus+'&goodid='+goodidArr[index],
                                dataType:"json",
                                success: function(data){
                                    if(data.status ==200){
                                        console.log('更新发布状态',data);
                                        setCookie('showSecondPart', 1, 1);//刷新页面之后显示第二部分内容
                                        window.location.reload();
                                    }else{
                                        commonPopFun(data.data, 'Failed');
                                    }
                                },
                                error:function(error){
                                    console.log(error);
                                }
                            });
                        }
                    });

                    //点击finished
                    $('.infoBox .info .infoWrap .infoRight .part2 .listUl .listLi').delegate('.finished', 'click',function(){
                        console.log(statusArr);
                        console.log(goodidArr);
                        var index = $(this).parents('.listLi').index();

                        commonPopFun2('This message will not be edited later; are you sure to set it to be finished?','Kalichimall', finishedFun);


                        //更新发布状态
                        function finishedFun(){
                            $.ajax({
                                type: "get",
                                url: baseUrl+'/apigateway/updatepubstatus?token='+token+'&status='+2+'&goodid='+goodidArr[index],
                                dataType:"json",
                                success: function(data){
                                    if(data.status ==200){
                                        console.log('更新发布状态',data);
                                        setCookie('showSecondPart', 1, 1);//刷新页面之后显示第二部分内容
                                        window.location.reload();
                                    }else{
                                        commonPopFun(data.data, 'Failed');
                                    }
                                },
                                error:function(error){
                                    console.log(error);
                                }
                            });
                        }
                    });


                    //点击edit
                    $('.infoBox .info .infoWrap .infoRight .part2 .listUl .listLi').delegate('.editBtn', 'click',function(){
                        console.log(statusArr);
                        console.log(goodidArr);
                        var index = $(this).parents('.listLi').index();
                        window.open('publish.html?needUpdate=1&updatepubcontentId='+goodidArr[index]);
                        var updatepubcontentId = goodidArr[index];
                    });

                    //.infoBox .info .infoWrap .infoRight .part2 .listUl .listLi .left
                    $('.infoBox .info .infoWrap .infoRight .part2 .listUl .listLi').delegate('.left','click', function(){
                        var index = $(this).parents('.listLi').index();
                        window.open("detail.html?id="+goodidArr[index]);
                    });
                    //.infoBox .info .infoWrap .infoRight .part2 .listUl .listLi .middle
                    $('.infoBox .info .infoWrap .infoRight .part2 .listUl .listLi').delegate('.middle','click', function(){
                        var index = $(this).parents('.listLi').index();
                        window.open("detail.html?id="+goodidArr[index]);
                    });



                }
            },
            error:function(error){
                console.log(error);
            }
        });
    }



    //更新发布状态
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/updatepubstatus?token="+token+"&status="+1+"&goodid="+14,
        dataType:"json",
        success: function(data){
            if(data.status == 200){
//                    data = JSON.parse(data.data);
                console.log("更新发布状态",data);

            }
        },
        error:function(error){
            console.log(error);
        }
    });




    //添加默认头像
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getreclogos",
        dataType:"json",
        success: function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("添加默认头像",data);
                for(var i=0; i<data.length; i++){
                    $('.managePopBox .managePop .recommendBox').append('<img class="choose" src='+baseImgSrc+data[i].imgid+' />');
                }

                $('.managePopBox .managePop .recommendBox .choose').unbind('click').click(function(){
                    var index = $(this).index();
                    $('.managePopBox .managePop .imgBox img').attr('src', baseImgSrc+data[index].imgid);
                    headLogo = data[index].imgid;
                });


                //点击保存
                $('.managePopBox .managePop .save .saveBtn').unbind('click').click(function(){
                    console.log(baseImgSrc + headLogo);
                    $('.infoBox .info .infoWrap .infoRight .part1 .headBox .headImg').attr('src', baseImgSrc + headLogo);
                    $('.managePopBox').hide();
                    $('body').css('overflow', 'auto');

                    //先保存一遍用户信息
                    if ($('.infoBox .info .infoWrap .infoRight .part1 .attrBox .gender').get(0).checked) {
                        sex = 1;
                    }
                    if ($('.infoBox .info .infoWrap .infoRight .part1 .attrBox .gender').get(1).checked) {
                        sex = 2;
                    }
                    console.log(sex);
                    var changeuserinfo = {
                        "token":token,
                        "sex":sex.toString(),
                        "logo":headLogo,
                        "nickname":$('#nickName').val()
                    };
                    $.ajax({
                        type:"POST",
                        url:baseUrl + "/apigateway/changeuserinfo",
                        dataType:"json",
                        data:JSON.stringify(changeuserinfo),
                        success:function(data){
                            console.log(data);
                            if(data.status == 200){
                                console.log("修改用户信息",data);
                                console.log("changeuserinfo",changeuserinfo);

                                //修改title
                                $('#manageTitle').html(data.nickname + "'s home. kalichimall, make money by your second-hand goods.");
//                                    commonPopFun('Your detail has been saved successfully.', 'Successful');
                            }else{
                                console.log(data);
//                                    commonPopFun('Sorry, failed to save your detail. Please try it later.', 'Failed');
                            }
                        },
                        error:function(error){
                            console.log(error);
//                                commonPopFun('Sorry, failed to save your detail. Please try it later.', 'Failed');
                        }
                    });

                });

            }else{
                console.log(data.msg);
            }
        },
        error:function(error){
            console.log(error);
        }
    });





});