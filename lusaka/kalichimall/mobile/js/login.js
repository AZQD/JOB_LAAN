$(function(){


    //登陆/注册切换
    $('#goToRegister').unbind('click').click(function(){
        $('.loginRegisterBox .loginRegister .loginWrap').hide();
        $('.loginRegisterBox .loginRegister .registerWrap').show();
    });
    $('#goToLogin').unbind('click').click(function(){
        $('.loginRegisterBox .loginRegister .loginWrap').show();
        $('.loginRegisterBox .loginRegister .registerWrap').hide();
    });

    //新增  //opera mini 兼容
    if(isOperaMiniLow){
        $('.loginRegisterBox .loginRegister .registerDragNew').hide();
    }

    var b = new Base64_new();
    var publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC5jmTSO5V9ILlphRYdfFk4M2Rko/Ur22h43SxkFcGcj9Vkuew5P65XJPQtJesvY37UmU7zXWsqT/i4Evo2gaYu9Eu/fgutkP9KE4yKh4Ruk/pYC+hyNFVIK21kl4o8cfV9cKumydj2WXgmuywX8UQiVIfbKuvEAw+RVvPjBt9UqQIDAQAB";
    var encrypt = new JSEncrypt();
    encrypt.setPublicKey(publicKey);



    function loginFun(){
        var loginPhone = b.encode($.trim($('#loginPhone').val()));
        var loginPassword = b.encode($.trim($('#loginPassword').val()));
        var authKey = encrypt.encrypt("user="+ loginPhone +"&pass="+ loginPassword);//获取密钥
//            console.log(loginPhone);
//            console.log(loginPassword);
//            console.log(authKey);
        var authInfo = {
            "auth":authKey,
            "timestamp":timestamp
        };
        $.ajax({
            type:"POST",
            url:baseUrl + "/apigateway/login",
            dataType:"json",
            data:JSON.stringify(authInfo),
            success:function(data){
                console.log("登陆",data);
                if(data.status == 200){
                    data = JSON.parse(data.data);
                    console.log("登陆",data);
                    var token = data.token;
                    //localStorage.setItem('token',token);//设置本地存储
                    setCookie('token',token, 1);//设置本地存储



                    //兼容opera mini
                    if(getParamByUrl('goLogin') == 1){
                        try {
                            window.localStorage.foobar = "foobar";
                            //跳转到上个页面
                            window.history.go(-1);
                        } catch (_) {
                            window.location.href = "index.html";
                        }
                    }else{
                        window.location.href = "index.html";
                    }
                }else{
                    commonPopFun1("Sorry,the cellphone number or password is wrong. Please check.", "Failed");
                }
            },
            error:function(error){
                console.log(error);
            }
        });
    }


    //注册
    /*#drag*/
    $('.registerDragNew #drag').drag();
    var timer = setInterval(function(){
        //opera mini 兼容
        if($('#drag .drag_text').text() == "OK" || isOperaMiniLow){
            clearInterval(timer);
        }
    }, 500);


    //登陆
    $('#loginBtn').unbind('click').click(function () {
        loginFun();
    });
    var loginRegisterStatus;
    $('#loginPhone, #loginPassword').on('focus',function () {
        loginRegisterStatus = 0;
//            console.log(loginRegisterStatus);
    });
    $('#registerPhone, #registerPassword').on('focus',function () {
        loginRegisterStatus = 1;
//            console.log(loginRegisterStatus);
    });
    //正则验证注册的手机号
    var myReg = /^((9|09)+\d{8})$/;
    var canRegister = true;
    $('#registerPhone').on('blur', function () {
        var regText = $.trim($('#registerPhone').val());
        if(!myReg.test(regText)){
            canRegister = false;
            $('#registerTip').show();

            $('#registerPhone').unbind('blur').bind('input propertychange', function () {
                var regText = $.trim($('#registerPhone').val());
                if(!myReg.test(regText)){
                    canRegister = false;
                    $('#registerTip').show();
                }else{
                    canRegister = true;
                    $('#registerTip').hide();
                }

            });

        }else{
            canRegister = true;
        }

    });
    document.onkeydown = function(ev){
        ev = ev || event;
        console.log(ev.keyCode);
        if(ev.keyCode == 13){
            if(loginRegisterStatus == 0){ //登陆
                loginFun();
            }else if(loginRegisterStatus == 1){//注册
                registerFun();
            }
            return false;
        }
    };

    $('#registerBtn').unbind('click').click(function () {
        registerFun();
    });
    function registerFun(){
        var dragText = $('#drag .drag_text').text();
        var registerPhone = b.encode($.trim($('#registerPhone').val()));
        var registerPassword = b.encode($.trim($('#registerPassword').val()));
        var registerName = b.encode($.trim($('#registerName').val()));
        var reg = encrypt.encrypt("user="+ registerPhone +"&pass="+ registerPassword +"&nickname="+ registerName);//获取密钥
        var timestamp=new Date().getTime();//获取时间戳
//            console.log(registerPhone);
//            console.log(registerPassword);
//            console.log(reg);
        var authInfo = {
            "reg":reg,
            "timestamp":timestamp
        };
        //opera mini 兼容
        if(dragText == 'OK' || isOperaMiniLow){
            $.ajax({
                type:"POST",
                url:baseUrl + "/apigateway/reg",
                dataType:"json",
                data:JSON.stringify(authInfo),
                success:function(data){
                    console.log("注册",data);
                    if(data.status == 200){
                        console.log("注册成功",data);


                        var registerPhone = b.encode($.trim($('#registerPhone').val()));
                        var registerPassword = b.encode($.trim($('#registerPassword').val()));
                        var authKey = encrypt.encrypt("user="+ registerPhone +"&pass="+ registerPassword);//获取密钥
                        var timestamp=new Date().getTime();//获取时间戳
                        var authInfo = {
                            "auth":authKey,
                            "timestamp":timestamp
                        };
                        $.ajax({
                            type:"POST",
                            url:baseUrl + "/apigateway/login",
                            dataType:"json",
                            data:JSON.stringify(authInfo),
                            success:function(data){
                                console.log("登陆",data);
                                if(data.status == 200){
                                    data = JSON.parse(data.data);

                                    var token = data.token;
                                    //localStorage.setItem('token',token);//设置本地存储
                                    setCookie('token',token, 1);//设置本地存储
                                    if(getParamByUrl('goLogin') == 1){


                                        try {
                                            window.localStorage.foobar = "foobar";
                                            //跳转到上个页面
                                            window.history.go(-1);
                                        } catch (_) {
                                            window.location.href = "index.html";
                                        }

                                    }else{
                                        window.location.href = "index.html";
                                    }
                                }else{
                                    commonPopFun1("Sorry,the cellphone number or password is wrong. Please check.", "Failed");
                                }
                            },
                            error:function(error){
                                console.log(error);
                            }
                        });


                    }else if(data.status == 500){
                        commonPopFun1("Sorry,this cellphone number was registered. Please use anther one.", "Failed");
                    }else{
                        commonPopFun1("Sorry,failed to register. Please try to register later.", "Failed");
                    }
                },
                error:function(error){
                    console.log(error);
                    commonPopFun1("Sorry,failed to register. Please try to register later.", "Failed");
                }
            });
        }else{
//                alert("请拖拽滑块~");
            $('#drag').css('backgroundColor', 'red');
        }
    }
});