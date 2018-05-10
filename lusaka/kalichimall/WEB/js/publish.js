$(function(){


    //JavaScript通过元素的索引号删除数组中的元素
    function RemoveValByIndex(arr, index) {
        arr.splice(index, 1);
    }

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


    //用户未登录时弹窗
    $('.publishPopBox .tipOffBox .confirmBox .loginNowBtn').unbind('click').click(function(){
        window.location.href = "login.html?goLogin="+1;
    });
    $('.publishPopBox .tipOffBox .confirmBox .laterBtn').unbind('click').click(function(){
        $('.publishPopBox').hide();
        $('body').css('overflow', 'auto');
        if(getParamByUrl('searchPart') == 'searchPart'){
            window.close();
        }else{
            window.history.go(-1);
        }
    });

    var imgIdAll1 = '';
    var imgIdAll2 = '';
    var imgIdAll3 = '';
    var imgIdAll4 = '';
    var totalImgIdAll = '';
    var updateOldImgArr = [];
    var updateNewImgArr = [];
    var uploadSuccess1 = true;
    var uploadSuccess2 = true;
    var uploadSuccess3 = true;
    var uploadSuccess4 = true;
    $(".a-upload1").on("change","input[type='file']",function(){
        uploadSuccess1 = false;
        $(".a-upload2").show();
        $('.uploadLogo1').hide();
        var filePath=$(this).val();
        if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
            $(".fileerrorTip").html("").hide();
            var arr=filePath.split('\\');
            var fileName=arr[arr.length-1];
            $(".showFileName1").html("uploading");

            //上传图片
            var fd = new FormData();
            fd.append("upload", 1);
            console.log($("#upfile1").get(0).files[0]);
            fd.append("upfile", $("#upfile1").get(0).files[0]);
            $.ajax({
                url: baseUrl+"/apigateway/upfile",
                type: "POST",
                processData: false,
                contentType: false,
                data: fd,
                success: function(imgData) {
                    if(imgData.status == 200) {
                        uploadSuccess1 = true;
                        var extdata1 = imgData.extdata;
                        $('.a-upload .closeImg1').show().unbind('click').click(function(){
                            uploadSuccess1 = true;
                            $.ajax({
                                type: "get",
                                url: baseUrl+"/apigateway/dimg?id="+extdata1,
                                dataType:"json",
                                success: function(data){
                                    console.log("删除图片1成功！",data);
                                },
                                error:function(error){
                                    console.log(error);
                                }
                            });

                            $(".a-upload2").hide();
                            $('.uploadLogo1').show();
                            $(".showFileName1").html('');
                            $('.a-upload1Add').hide();
                            totalImgIdAll = '';
                            console.log("totalImgIdAll="+totalImgIdAll);

                            RemoveValByIndex(updateNewImgArr, 0);
                            console.log('updateNewImgArr',updateNewImgArr);
                        });
                        $(".showFileName1").html(fileName);
                        console.log(imgData);
                        console.log(imgData.data);
                        imgIdAll1 = imgData.data;
                        totalImgIdAll = imgIdAll1;
                        console.log("totalImgIdAll="+totalImgIdAll);

                        updateNewImgArr.push(imgData.data);
                        console.log('updateNewImgArr',updateNewImgArr);


                        //新增（显示上传的图片）
                        $('.a-upload1Add').show().attr('src', baseImgSrc+imgData.data);


                        $(".a-upload2").on("change","input[type='file']",function(){
                            uploadSuccess2 = false;
                            $(".a-upload3").show();
                            $('.uploadLogo2').hide();
                            var filePath=$(this).val();
                            if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
                                $(".fileerrorTip").html("").hide();
                                var arr=filePath.split('\\');
                                var fileName=arr[arr.length-1];
                                $(".showFileName2").html("uploading");

                                //上传图片
                                var fd = new FormData();
                                fd.append("upload", 1);
                                console.log($("#upfile2").get(0).files[0]);
                                fd.append("upfile", $("#upfile2").get(0).files[0]);
                                $.ajax({
                                    url: baseUrl+"/apigateway/upfile",
                                    type: "POST",
                                    processData: false,
                                    contentType: false,
                                    data: fd,
                                    success: function(imgData) {
                                        if(imgData.status == 200) {
                                            uploadSuccess2 = true;
                                            var extdata2 = imgData.extdata;
                                            $('.a-upload .closeImg2').show().unbind('click').click(function(){
                                                uploadSuccess2 = true;
                                                $.ajax({
                                                    type: "get",
                                                    url: baseUrl+"/apigateway/dimg?id="+extdata2,
                                                    dataType:"json",
                                                    success: function(data){
                                                        console.log("删除图片2成功！",data);
                                                    },
                                                    error:function(error){
                                                        console.log(error);
                                                    }
                                                });

                                                $(".a-upload3").hide();
                                                $('.uploadLogo2').show();
                                                $(".showFileName2").html('');
                                                $('.a-upload2Add').hide();
                                                imgIdAll2 = '';
                                                totalImgIdAll = imgIdAll1;
                                                console.log("totalImgIdAll="+totalImgIdAll);

                                                RemoveValByIndex(updateNewImgArr, 1);
                                                console.log('updateNewImgArr',updateNewImgArr);

                                            });

                                            $(".showFileName2").html(fileName);
                                            console.log(imgData);
                                            console.log(imgData.data);
                                            imgIdAll2 = imgData.data;
                                            totalImgIdAll = imgIdAll1+','+imgIdAll2;
                                            console.log("totalImgIdAll="+totalImgIdAll);

                                            updateNewImgArr.push(imgData.data);
                                            console.log('updateNewImgArr',updateNewImgArr);

                                            //新增（显示上传的图片）
                                            $('.a-upload2Add').show().attr('src', baseImgSrc+imgData.data);


                                            $(".a-upload3").on("change","input[type='file']",function(){
                                                uploadSuccess3 = false;
                                                $(".a-upload4").show();
                                                $('.uploadLogo3').hide();
                                                var filePath=$(this).val();
                                                if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
                                                    $(".fileerrorTip").html("").hide();
                                                    var arr=filePath.split('\\');
                                                    var fileName=arr[arr.length-1];
                                                    $(".showFileName3").html("uploading");

                                                    //上传图片
                                                    var fd = new FormData();
                                                    fd.append("upload", 1);
                                                    console.log($("#upfile3").get(0).files[0]);
                                                    fd.append("upfile", $("#upfile3").get(0).files[0]);
                                                    $.ajax({
                                                        url: baseUrl+"/apigateway/upfile",
                                                        type: "POST",
                                                        processData: false,
                                                        contentType: false,
                                                        data: fd,
                                                        success: function(imgData) {
                                                            if(imgData.status == 200) {
                                                                uploadSuccess3 = true;
                                                                var extdata3 = imgData.extdata;
                                                                $('.a-upload .closeImg3').show().unbind('click').click(function(){
                                                                    uploadSuccess3 = true;
                                                                    $.ajax({
                                                                        type: "get",
                                                                        url: baseUrl+"/apigateway/dimg?id="+extdata3,
                                                                        dataType:"json",
                                                                        success: function(data){
                                                                            console.log("删除图片3成功！",data);
                                                                        },
                                                                        error:function(error){
                                                                            console.log(error);
                                                                        }
                                                                    });

                                                                    $(".a-upload4").hide();
                                                                    $('.uploadLogo3').show();
                                                                    $(".showFileName3").html('');
                                                                    $('.a-upload3Add').hide();
                                                                    imgIdAll3 = '';
                                                                    totalImgIdAll = imgIdAll1+','+imgIdAll2;
                                                                    console.log("totalImgIdAll="+totalImgIdAll);

                                                                    RemoveValByIndex(updateNewImgArr, 2);
                                                                    console.log('updateNewImgArr',updateNewImgArr);

                                                                });

                                                                $(".showFileName3").html(fileName);
                                                                console.log(imgData);
                                                                console.log(imgData.data);
                                                                imgIdAll3 = imgData.data;
                                                                totalImgIdAll = imgIdAll1+','+imgIdAll2+','+imgIdAll3;
                                                                console.log("totalImgIdAll="+totalImgIdAll);

                                                                updateNewImgArr.push(imgData.data);
                                                                console.log('updateNewImgArr',updateNewImgArr);

                                                                //新增（显示上传的图片）
                                                                $('.a-upload3Add').show().attr('src', baseImgSrc+imgData.data);


                                                                $(".a-upload4").on("change","input[type='file']",function(){
                                                                    uploadSuccess4 = false;
                                                                    $('.uploadLogo4').hide();
                                                                    var filePath=$(this).val();
                                                                    if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
                                                                        $(".fileerrorTip").html("").hide();
                                                                        var arr=filePath.split('\\');
                                                                        var fileName=arr[arr.length-1];
                                                                        $(".showFileName4").html("uploading");

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
                                                                                    uploadSuccess4 = true;
                                                                                    var extdata4 = imgData.extdata;
                                                                                    $('.a-upload .closeImg4').show().unbind('click').click(function(){
                                                                                        uploadSuccess4 = true;
                                                                                        $.ajax({
                                                                                            type: "get",
                                                                                            url: baseUrl+"/apigateway/dimg?id="+extdata4,
                                                                                            dataType:"json",
                                                                                            success: function(data){
                                                                                                console.log("删除图片4成功！",data);
                                                                                            },
                                                                                            error:function(error){
                                                                                                console.log(error);
                                                                                            }
                                                                                        });

                                                                                        $('.uploadLogo4').show();
                                                                                        $(".showFileName4").html('');
                                                                                        $('.a-upload4Add').hide();
                                                                                        imgIdAll4 = '';
                                                                                        totalImgIdAll = imgIdAll1+','+imgIdAll2+','+imgIdAll3;
                                                                                        console.log("totalImgIdAll="+totalImgIdAll);

                                                                                        RemoveValByIndex(updateNewImgArr, 3);
                                                                                        console.log('updateNewImgArr',updateNewImgArr);

                                                                                    });

                                                                                    $(".showFileName4").html(fileName);
                                                                                    console.log(imgData);
                                                                                    console.log(imgData.data);
                                                                                    imgIdAll4 = imgData.data;
                                                                                    totalImgIdAll = imgIdAll1+','+imgIdAll2+','+imgIdAll3+','+imgIdAll4;
                                                                                    console.log("totalImgIdAll="+totalImgIdAll);

                                                                                    updateNewImgArr.push(imgData.data);
                                                                                    console.log('updateNewImgArr',updateNewImgArr);


                                                                                    //新增（显示上传的图片）
                                                                                    $('.a-upload4Add').show().attr('src', baseImgSrc+imgData.data);
                                                                                }
                                                                            }
                                                                        });

                                                                    }else{
                                                                        $(".showFileName4").html("");
                                                                        $(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").show();
                                                                        return false
                                                                    }
                                                                });


                                                            }
                                                        }
                                                    });

                                                }else{
                                                    $(".showFileName3").html("");
                                                    $(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").show();
                                                    return false
                                                }
                                            });


                                        }
                                    }
                                });

                            }else{
                                $(".showFileName2").html("");
                                $(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").show();
                                return false
                            }
                        });


                    }
                }
            });

        }else{
            $(".showFileName1").html("");
            $(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").show();
            return false
        }
    });


    //点击图片logo跳转到index页面；
    $('.searchBox .search .searchLeft .logo').click(function () {
        window.location.href = 'index.html' + window.location.search;
    });




    /*点击发布按钮*/

    var cid;
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/categorys",
        dataType:"json",
        success: function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得产品分类",data);
                var str = '';
                var categorysNameArr = [];
                var categorysCidArr = [];
                for (var sort in data){
                    categorysNameArr.push(data[sort].name);
                    categorysCidArr.push(data[sort].cid);
                    $('.sortBox .sort .partInner1 .partInner1Left').append('<div class="title">'+data[sort].name+'</div>');
                }

                //初始化
                var chushiSubArr = data[0].sub;
                console.log("chushiSubArr", chushiSubArr);
                for(var i=0; i<chushiSubArr.length; i++){
                    $('.sortBox .sort .partInner1 .partInner1Right').append('<div class="secondCidName">'+chushiSubArr[i].name+'</div>');
                }
//                    cid = chushiSubArr[0].cid;
                $('.sortBox .sort .partInner1 .partInner1Left .title').eq(0).addClass('isActive');
                //初始化：没有点击一级菜单时，直接点击二级菜单
                $('.sortBox .sort .partInner1 .partInner1Right .secondCidName').unbind('click').click(function(){
                    var secondIndex = $(this).index();
                    cid = chushiSubArr[secondIndex].cid;
                    console.log('cid='+cid);
                    $('.sortBox .sort .part').removeClass("active").eq(1).addClass("active");
                    $('.sortBox .sort .partInner').hide().eq(1).show();
                    $('.sortBox .sort .space .changeCid').show();
                });

                //点击一级菜单
                var firstIndex = 0;
                $('.sortBox .sort .partInner1 .partInner1Left .title').unbind('click').click(function(){
                    var categoryName = '';
                    var index = $(this).index();
                    $('.sortBox .sort .partInner1 .partInner1Left .title').removeClass('isActive').eq(index).addClass('isActive');
                    var nowSubArr = data[index].sub;
                    $('.sortBox .sort .partInner1 .partInner1Right').empty();
                    for(var i=0; i<nowSubArr.length; i++){
                        $('.sortBox .sort .partInner1 .partInner1Right').append('<div class="secondCidName">'+nowSubArr[i].name+'</div>');
                    }

                    categoryName = data[index].name;
                    $('.sortBox .sort .space .left .categoryName').empty().html(categoryName);

                    //点击二级菜单
                    $('.sortBox .sort .partInner1 .partInner1Right .secondCidName').unbind('click').click(function(){
                        var categoryName2 = '';
                        var secondIndex = $(this).index();
                        cid = nowSubArr[secondIndex].cid;
                        console.log('cid='+cid);
                        $('.sortBox .sort .part').removeClass("active").eq(1).addClass("active");
                        $('.sortBox .sort .partInner').hide().eq(1).show();
                        $('.sortBox .sort .space .changeCid').show();
                        categoryName2 = (">"+nowSubArr[secondIndex].name);

                        $('.sortBox .sort .space .left .categoryName').empty().html(categoryName + categoryName2);
                    });
                });

                //点击change修改cid
                $('.sortBox .sort .space .changeCid').unbind('click').click(function () {
                    $('.sortBox .sort .part').removeClass("active").eq(0).addClass("active");
                    $('.sortBox .sort .partInner').hide().eq(0).show();
                    $('.sortBox .sort .space .changeCid').hide();
                });



                /*$('#selectCid').on('change', function(){
                 for(var i=0; i<categorysNameArr.length; i++){
                 //                            console.log(categorysNameArr[i]);
                 if($('#selectCid option:selected').html() == categorysNameArr[i]){
                 //                                alert(categorysNameArr[i]);
                 cid = categorysCidArr[i];

                 }
                 }
                 //                        alert(cid);
                 });*/
//                    alert(cid);




            }else{
                commonPopFun(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }

    });



    //获取地址id
//        $('#location1')
    var addr_l1;
    var addr_l2;
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/areas",
        dataType:"json",
        success: function(data){
            if (data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得区域信息2", data);
                var str1 = '';
                var str2 = '';
                var str3 = '';
                var locationArr1 = [];
                var locationArr1Id = [];
                var locationArr2 = [];
                for (var sort in data){
                    locationArr1.push(data[sort].name);
                    locationArr1Id.push(data[sort].id);
                    locationArr2.push(data[sort].sub);
                    str1 += "<option>"+data[sort].name+"</option>";
                }
                console.log('locationArr1',locationArr1);
                console.log('locationArr2',locationArr2);
                $('#location1').append(str1);

                //不显示默认地址
                $('#location1 option').each(function (index) {
                    if($('#location1 option').eq(index).html() == ''){
                        $(this).hide();
                    }
                });

                addr_l1 = locationArr1Id[0];
                addr_l2 = locationArr2[0][0].id;
                console.log(addr_l1);
                console.log(addr_l2);
                for(var i=0; i<locationArr2[0].length; i++){
                    str2 += "<option>"+locationArr2[0][i].name+"</option>";
                }
                console.log(str2);
                $('#location2').append(str2);

                $('#location1').change(function (){
                    str3 = '';
                    $('#location2').empty();
                    for(let i=0; i<locationArr1.length; i++){
                        if($('#location1 option:selected').html() == locationArr1[i]){
                            console.log(i);
                            addr_l1 = locationArr1Id[i];
                            console.log('addr_l1='+addr_l1);

                            for(var j=0; j<locationArr2[i].length; j++){
                                str3 = "<option>"+locationArr2[i][j].name+"</option>";
                                $('#location2').append(str3);
                                if($('#location2 option:selected').html() == locationArr2[i][j].name){
                                    addr_l2 = locationArr2[i][j].id;
                                    console.log('addr_l2='+addr_l2);
                                }
                            }


                        }
                    }
                });
                var clickBtn = 0;
                $('#location2').change(function (){

                    for(let i=0; i<locationArr1.length; i++){
                        if($('#location1 option:selected').html() == locationArr1[i]){
                            addr_l1 = locationArr1Id[i];
                            console.log('addr_l1='+addr_l1);

//                                $('#location2').empty();
                            for(let j=0; j<locationArr2[i].length; j++){

                                str3 = "<option>"+locationArr2[i][j].name+"</option>";
                                if(clickBtn == 0){
                                    clickBtn++;
                                    $('#location2').append(str3);
                                }
                                if($('#location2 option:selected').html() == locationArr2[i][j].name){
                                    addr_l2 = locationArr2[i][j].id;
                                    console.log('addr_l2='+addr_l2);
                                }
                            }


                        }
                    }
                });
            }
        },
        error: function (error) {
            console.log(error);
        }
    });


    //issell
    var issell = "1";//"1"为出售，"0"为需求
    $('.sortBox .sort .partInner2 .partInner2Box .right .issell').click(function(){
        $('.sortBox .sort .partInner2 .partInner2Box .right .issell').removeClass('active');
        $(this).addClass('active');
        $('.sortBox .sort .partInner2 .partInner2Box .right .issell').each(function(index){
            if($('.sortBox .sort .partInner2 .partInner2Box .right .issell').eq(index).hasClass('active')){
                if(index == 0){
                    issell = 1;
                }else if(index == 1){
                    issell = 0;
                }
            }
        });
        issell = issell.toString();
//            alert(issell);
    });


    //goodstatus
    var goodstatus = "0";
    $('.sortBox .sort .partInner2 .partInner2Box .right .goodstatus').click(function(){
        $('.sortBox .sort .partInner2 .partInner2Box .right .goodstatus').removeClass('active');
        $(this).addClass('active');
        $('.sortBox .sort .partInner2 .partInner2Box .right .goodstatus').each(function(index){
            if($('.sortBox .sort .partInner2 .partInner2Box .right .goodstatus').eq(index).hasClass('active')){
                goodstatus = index;
            }
        });
        console.log(goodstatus);
        goodstatus = goodstatus.toString();
    });



    //处理price
    var priceText = 0;
    var priceRight = false;
    $('.sortBox .sort .partInner2 .partInner2Box .right .priceText').blur(function(){
        priceText = $.trim($('.sortBox .sort .partInner2 .partInner2Box .right .priceText').val());
        if(priceText>=0 && priceText <=100000000){
            priceRight = true;
            if(priceText == ''){
                priceText = 0;
            }
        }else{
            priceRight = false;

            commonPopFun("The price should be in the range of 0 to 100000000", 'Failed');

            priceText = 0;
            $('.sortBox .sort .partInner2 .partInner2Box .right .priceText').val('');
        }
        console.log(priceText);
    });
    $('.sortBox .sort .partInner2 .partInner2Box .right .negotiated').click(function(){

        priceRight = true;
        priceText = 0;
        if($('.sortBox .sort .partInner2 .partInner2Box .right .priceText').is(':hidden')){
            $('.sortBox .sort .partInner2 .partInner2Box .right .priceText').val('').show();
            $(this).removeClass('active');
        }else{
            $(this).addClass('active');
//            $('.sortBox .sort .partInner2 .partInner2Box .right .priceText').hide();
            $('.sortBox .sort .partInner2 .partInner2Box .right .priceText').val('').hide();
        }



        console.log(priceText);
    });


    //如果是用户编辑发布，则保存相应信息
    var needUpdate = getParamByUrl('needUpdate');
    var updateOldNum = [];//已有图片的下标
    var updatepubcontentId = getParamByUrl('updatepubcontentId');
    if(needUpdate == 1){
        $.ajax({
            type: "get",
            url: baseUrl+"/apigateway/getgood?id="+updatepubcontentId,
            dataType:"json",
            success: function(data){
                if(data.status == 200){
                    data = JSON.parse(data.data);
                    console.log("获得指定产品的产品信息",data);

                    //获取用户已发布的图片信息
                    updateOldImgArr = data.imgs.split(',');
                    for(var i=0; i<updateOldImgArr.length; i++){
                        $('.sortBox .sort .partInner2 .partInner2Box .right .imagesBox').prepend(
                            '<div class="nowHaveImg" style="background: url('+baseImgSrc+updateOldImgArr[i]+') no-repeat center center"><img class="closeNowHaveImg" src="image/publish/close.png"/></div>'
                        );
                    }

                    $('.sortBox .sort .partInner2 .partInner2Box .right .imagesBox .nowHaveImg').delegate('.closeNowHaveImg','click', function(){
                        var index = $(this).parents('.nowHaveImg').index();
                        updateOldNum.push(index);
                        updateOldNum = updateOldNum.sort(function(a, b){
//                                return a - b; //正序
                            //return 0; //不改变顺序
                            return b - a; //逆序
                        });
                        console.log('updateOldNum',updateOldNum);
                        $('.sortBox .sort .partInner2 .partInner2Box .right .imagesBox .nowHaveImg').eq(index).hide();
                    });

//                     ;



                    issell = data.issell;
                    if(issell == 0){
                        $('.sortBox .sort .partInner2 .partInner2Box .right .issell').removeClass('active').eq(1).addClass('active');
                    }
                    if(issell == 1){
                        $('.sortBox .sort .partInner2 .partInner2Box .right .issell').removeClass('active').eq(0).addClass('active');
                    }

                    goodstatus = data.goodstatus;
                    $('.sortBox .sort .partInner2 .partInner2Box .right .goodstatus').removeClass('active').eq(goodstatus).addClass('active');

                    if(data.price == 0){
                        $('.sortBox .sort .partInner2 .partInner2Box .right .priceText').hide();
                        $('.sortBox .sort .partInner2 .partInner2Box .right .negotiated').addClass('active');
                    }else{
                        $('.sortBox .sort .partInner2 .partInner2Box .right .priceText').val(data.price);
                    }
                    $('.sortBox .sort .partInner2 .partInner2Box .right .titleText').val(data.title);
                    $('.sortBox .sort .partInner2 .partInner2Box .right .locationText').val(data.addr_l4);
                    $('.sortBox .sort .partInner2 .partInner2Box .right .detailText').val(data.details);
                }else{
                    commonPopFun(data.msg, 'Failed');
                }
            },
            error:function(error){
                console.log(error);
            }
        });
    }


    //detailText:回车换行
    $('#detailText').bind('input propertychange', function(){
        document.onkeydown = function(ev){
            ev = ev || event;
            console.log(ev.keyCode);
            if(ev.keyCode == 13){
                //换行转回车
                var haha=document.getElementById("detailText").value;
                haha=haha.replace('<br />','/n');
                document.getElementById("detailText").value=haha;
            }
        };
    });


    var publishClick = true;
    $('.sortBox .sort .partInner2 .partInner2Box .publishBtn').click(function(){
        if((needUpdate == 1 || priceRight) && ($('.sortBox .sort .partInner2 .partInner2Box .right .titleText').val() !='')
            && ($('.sortBox .sort .partInner2 .partInner2Box .right .locationText').val() !='')
            && ($('.sortBox .sort .partInner2 .partInner2Box .right .detailText').val() !='')
            && ($('.sortBox .sort .partInner2 .partInner2Box .right .contactName').val() !='')
            && ($('.sortBox .sort .partInner2 .partInner2Box .right .contactPhone').val() !='')
            && uploadSuccess1
            && uploadSuccess2
            && uploadSuccess3
            && uploadSuccess4
        ){


            if(($('.sortBox .sort .partInner2 .partInner2Box .right .locationText').val() == '')){
                $('.sortBox .sort .partInner2 .partInner2Box .right .locationText').css('border','1px solid #f00');
            }
            if(($('.sortBox .sort .partInner2 .partInner2Box .right .detailText').val() == '')){
                $('.sortBox .sort .partInner2 .partInner2Box .right .detailText').css('border','1px solid #f00');
            }
            if(($('.sortBox .sort .partInner2 .partInner2Box .right .contactName').val() == '')){
                $('.sortBox .sort .partInner2 .partInner2Box .right .contactName').css('border','1px solid #f00');
            }
            if(($('.sortBox .sort .partInner2 .partInner2Box .right .contactPhone').val() == '')){
                $('.sortBox .sort .partInner2 .partInner2Box .right .contactPhone').css('border','1px solid #f00');
            }


            var token = localStorage.getItem("token");
            console.log('localStorage.getItem("token")',localStorage.getItem("token"));
            token=(token == null)?"":token;


            //执行提交
            if(needUpdate == 1){//编辑商品

                for(var i=0; i<updateOldNum.length; i++){
                    RemoveValByIndex(updateOldImgArr, i);
                }
                var updateTotalImgIdAll = updateOldImgArr.concat(updateNewImgArr);
                console.log('updateTotalImgIdAll',updateTotalImgIdAll);
                var updateTotalImgIdStr = '';
                for(var i=0; i<updateTotalImgIdAll.length; i++){
                    var aa = updateTotalImgIdAll[i]+',';
                    updateTotalImgIdStr+=aa;
                }
                updateTotalImgIdStr = updateTotalImgIdStr.slice(0, -1);
                console.log('updateTotalImgIdStr', updateTotalImgIdStr);

                if(publishClick){
                    publishClick = false;
                    var updateGoodInfo = {
                        "token":token, 			//用户登录凭证，如果是匿名发布则留空""
                        "id":updatepubcontentId, //需要编辑的商品的id
                        "cid":cid.toString(),				//产品分类ID (需调整)
                        "issell":issell,		//是否是出售，"1"为出售，"0"为需求
                        "goodstatus":goodstatus,		//产品新旧,"0","1","2","3","4","5"...
                        "price":priceText.toString(),			//价格
                        "title":$('.sortBox .sort .partInner2 .partInner2Box .right .titleText').val(),		//标题
                        "details":$('.sortBox .sort .partInner2 .partInner2Box .right .detailText').val(),	//产品详情
                        "addr_l1":addr_l1.toString(),			//一级地址 ID
                        "addr_l2":addr_l2.toString(),			//二级地址 ID
                        "addr_l3":"0",			//三级地址 ID
                        "addr_l4":$('.sortBox .sort .partInner2 .partInner2Box .right .locationText').val(),			//详细地址
                        "contactname":$('.sortBox .sort .partInner2 .partInner2Box .right .contactName').val(),	//联系人姓名
                        "phone":$('.sortBox .sort .partInner2 .partInner2Box .right .contactPhone').val(),		//联系人手机
                        "imgs":updateTotalImgIdStr				//产品图片ID，图片ID通过图片上传接口获得
                    };
                    console.log("updateGoodInfo", updateGoodInfo);

                    $.ajax({
                        type:"POST",
                        url:baseUrl + "/apigateway/updatepubcontent",
                        dataType:"json",
                        data:JSON.stringify(updateGoodInfo),
                        success:function(data){
                            console.log(data);
                            if(data.status == 200){
//                                alert(data.status);
                                //保存id，点击CLICK IT 进入该商品详情页
                                localStorage.setItem('goodIdFromCategory',data.data);
                                $('.sortBox .sort .part').removeClass("active").eq(2).addClass("active");
                                $('.sortBox .sort .partInner').hide().eq(2).show();
                                $('.sortBox .sort .space .changeCid').hide();

                                $('.sortBox .sort .partInner3 .completeBtn').click(function(){
                                    window.open("detail.html?id="+updatepubcontentId);
//                                window.location.href = "detail.html?id="+data.data;
                                });
                            }else{
                                commonPopFun(data.msg, 'Failed');
                            }
                        },
                        error:function(error){
                            console.log(error);
                        }
                    });
                }

            }else{//发布商品
                var pubGoodInfo = {
                    "token":token, 			//用户登录凭证，如果是匿名发布则留空""
                    "cid":cid.toString(),				//产品分类ID (需调整)
                    "issell":issell,		//是否是出售，"1"为出售，"0"为需求
                    "goodstatus":goodstatus,		//产品新旧,"0","1","2","3","4","5"...
                    "price":priceText.toString(),			//价格
                    "title":$('.sortBox .sort .partInner2 .partInner2Box .right .titleText').val(),		//标题
                    "details":$('.sortBox .sort .partInner2 .partInner2Box .right .detailText').val(),	//产品详情
                    "addr_l1":addr_l1.toString(),			//一级地址 ID
                    "addr_l2":addr_l2.toString(),			//二级地址 ID
                    "addr_l3":"0",			//三级地址 ID
                    "addr_l4":$('.sortBox .sort .partInner2 .partInner2Box .right .locationText').val(),			//详细地址
                    "contactname":$('.sortBox .sort .partInner2 .partInner2Box .right .contactName').val(),	//联系人姓名
                    "phone":$('.sortBox .sort .partInner2 .partInner2Box .right .contactPhone').val(),		//联系人手机
                    "imgs":totalImgIdAll				//产品图片ID，图片ID通过图片上传接口获得
                };
                console.log("pubGoodInfo", pubGoodInfo);

                $.ajax({
                    type:"POST",
                    url:baseUrl + "/apigateway/pubgood",
                    dataType:"json",
                    data:JSON.stringify(pubGoodInfo),
                    success:function(data){
                        console.log(data);
                        if(data.status == 200){
//                                alert(data.status);
                            //保存id，点击CLICK IT 进入该商品详情页
                            localStorage.setItem('goodIdFromCategory',data.data);
                            $('.sortBox .sort .part').removeClass("active").eq(2).addClass("active");
                            $('.sortBox .sort .partInner').hide().eq(2).show();
                            $('.sortBox .sort .space .changeCid').hide();

                            $('.sortBox .sort .partInner3 .completeBtn').click(function(){
                                window.open("detail.html?id="+data.data);
//                                window.location.href = "detail.html?id="+data.data;
                            });
                        }else{
                            commonPopFun(data.msg, "Failed");
                        }
                    },
                    error:function(error){
                        console.log(error);
                    }
                });
            }




        }else{
            if(($('.sortBox .sort .partInner2 .partInner2Box .right .titleText').val() == '')){
                $('.sortBox .sort .partInner2 .partInner2Box .right .titleText').css('border','1px solid #f00');
            }
            if(($('.sortBox .sort .partInner2 .partInner2Box .right .locationText').val() == '')){
                $('.sortBox .sort .partInner2 .partInner2Box .right .locationText').css('border','1px solid #f00');
            }
            if(($('.sortBox .sort .partInner2 .partInner2Box .right .detailText').val() == '')){
                $('.sortBox .sort .partInner2 .partInner2Box .right .detailText').css('border','1px solid #f00');
            }
            if(($('.sortBox .sort .partInner2 .partInner2Box .right .contactName').val() == '')){
                $('.sortBox .sort .partInner2 .partInner2Box .right .contactName').css('border','1px solid #f00');
            }
            if(($('.sortBox .sort .partInner2 .partInner2Box .right .contactPhone').val() == '')){
                $('.sortBox .sort .partInner2 .partInner2Box .right .contactPhone').css('border','1px solid #f00');
            }
            if((($('.sortBox .sort .partInner2 .partInner2Box .right .priceText').val() == '') && (priceRight == false))){
                $('.sortBox .sort .partInner2 .partInner2Box .right .priceText').css('border','1px solid #f00');
            }
            commonPopFun("Please complete all of the details to publish","Failed");
        }

    });


});