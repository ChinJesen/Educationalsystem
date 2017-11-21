function _init(){
	setCurrentDaye();
}

function setCurrentDaye(){
	var _currentTime = $("#currentTime");
	_currentTime.text(getCurDate());
	setTimeout('setCurrentDaye()', 1000);
}

function getCurDate(){
	var date = new Date();
	var years = date.getFullYear();
	var month = addZero(date.getMonth()+1);
	var days = addZero(date.getDate());
	//var hours = addZero(date.getHours());
	//var minutes = addZero(date.getMinutes());
	//var seconds = addZero(date.getSeconds());
	var weekDay;
	var n = date.getDay();
	switch(n){
		case 0:
			weekDay = "日";
			break;
		case 1:
			weekDay = "一";
			break;
		case 2:
			weekDay = "二";
			break;
		case 3:
			weekDay = "三";
			break;
		case 4:
			weekDay = "四";
			break;
		case 5:
			weekDay = "五";
			break;
		case 6:
			weekDay = "六";
			break;
	}
	
	var nowDate = years+"年"+month+"月"+days+"日    星期" + weekDay;
	return nowDate;
}

function addZero(temp){
	if(temp < 10){
		return "0"+temp;
	}else{
		return temp;
	}
}