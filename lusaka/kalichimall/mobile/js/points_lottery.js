$(function(){
    /*文字滚动效果*/
    var nowPrize = document.getElementById('nowPrize');

    nowPrize.innerHTML+=nowPrize.innerHTML;//克隆一份一样的内容

//获取html根标签的font-size值
    var fontSize = $('html').css('fontSize');
    startScroll(nowPrize,2.5*parseInt(fontSize),100,1500);


    //重点：点击除div之外的任意位置隐藏div
    $(document).unbind('click').click(function(){
        $('.prizeBox').slideUp();//获奖列表
    });
    $('.showNowPrizeBox .togglePrize').unbind('click').click(function(ev){
        ev.stopPropagation();
        $('.prizeBox').slideToggle();//获奖列表
    });
});

function startScroll(obj,height,speed,delay){
    obj.timer=setInterval(function (){
        if(obj.scrollTop % Math.floor(height)==0){
            clearInterval(obj.timer);
            setTimeout(function (){startScroll(obj,height,speed,delay)},delay);
        }else{
            obj.scrollTop++;
            //console.log(obj.scrollTop);

            if(obj.scrollTop >= obj.scrollHeight/2){
                obj.scrollTop =0;

            }
        }
    },speed);
    obj.scrollTop++;
}