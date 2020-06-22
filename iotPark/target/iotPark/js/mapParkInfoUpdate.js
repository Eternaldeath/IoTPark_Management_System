window.onLoad = function(){
    var j=0;

    var normalCar = 0;
    var vipCar = 0;

    function update() {
        $.ajax({
            url:"test",
            type:"post",
            data:{"parkName":"桂系生态公园园内停车场"},
            cache: "false",   //设置为false将不会从浏览器中加载请求信息
            async: "true",    //true所有请求均为异步请求
            success:function (result,testStatus) {
                // 初始化信息
                normalCar = 0;
                vipCar = 0;
                j=0;
                alert(result);

                // 遍历 result
                for(j=0;j<result.length;j++){
                    if(j<10)
                        normalCar++;
                    else  if (j>=10)
                        vipCar++;
                }


            }
        })
    }
    update();

    setInterval(update,1000*60);

}
