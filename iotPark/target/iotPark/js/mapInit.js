//----------初始化地图
var map = new BMap.Map("container");
// 创建地图实例


var point = new BMap.Point(104.0647735000, 30.5702183700);
// 创建点坐标

map.centerAndZoom(point, 15);
// 初始化地图，设置中心点坐标和地图级别


//-------- 大部分工作请在地图初始化完成后执行
//-------- 加载地图样式
// 地图样式
map.setMapStyleV2({
    styleId: '3d927ac49782df2f61e88deb8442669f'
});

//------------ 加载相关控件
// 控件参数设置
var opts = {type: BMAP_NAVIGATION_CONTROL_SMALL};


map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
map.addControl(new BMap.NavigationControl(opts)); //平移缩放
map.addControl(new BMap.OverviewMapControl());  // 缩略图控件
map.setHeading(64.5);
map.setTilt(73);

// --------------- 地图定位
// IP 地址获取
//   function myFun(result){
//       var cityName = result.name;
//       map.setCenter(cityName);
//       // alert("当前定位城市:"+cityName);
//   }
//   var myCity = new BMap.LocalCity();
//   myCity.get(myFun);




