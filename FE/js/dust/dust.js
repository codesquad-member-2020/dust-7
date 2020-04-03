import { TARGET } from "./dustUtil.js";

export function getCurrentLocation() {
    navigator.geolocation.getCurrentPosition((position) => {
        getStationData(position.coords.latitude, position.coords.longitude);
    });
}

async function getStationData(latitude, longitude) {
    const options = {
        method: 'GET'
    };
    const response = await fetch(`http://15.165.113.21:8080/location?coordinateWGS84=${longitude},${latitude}`, options);
    const result = await response.json();
    const stationName = result.responseMessage[0].stationName;
    getDustData(stationName);
}

async function getDustData(stationName) {
    const options = {
        method: 'GET'
    };
    const response = await fetch(`http://15.165.113.21:8080/dust-status?stationName=${stationName}`, options);
    const result = await response.json();
    render(stationName, result.responseMessage);
}

function render(stationName, dustData) {
    renderStation(stationName);
    renderGraph(dustData);
}

function renderStation(stationName) {
    TARGET.location.innerText = stationName;
}

function renderGraph(dustData) {
    dustData.forEach(dustData => {
        if (dustData.pm10Grade === "") return;
        console.log(dustData);
        const widthValue = calculateValue(parseInt(dustData.pm10Value));
        const li = document.createElement("li");
        const div = document.createElement("div");
        const color = ['#017AFF', '#37E030', '#E0AA31', '#CE1817'];
        const dustColor = parseInt(dustData.pm10Grade) - 1;
        div.style.background = "linear-gradient(to right, " + color[dustColor] + " " + widthValue + "%, #FFFFFF " + widthValue + "%)";
        const text = document.createTextNode(dustData.pm10Value);
        div.appendChild(text);
        li.appendChild(div);
        document.querySelector('.dust-graph-ul').appendChild(li);
    });
    rendurDust(dustData);
}

function calculateValue(pm10Value) {
    if (pm10Value < 201) return pm10Value / 2;
    else if (pm10Value > 200) return 100;
}

function rendurDust(data) {
    const emoji = document.querySelector(".dust-level-emoji");
    const gradeText = document.querySelector(".dust-level-text");
    const dustValue = document.querySelector(".dust-level-value");
    const time = document.querySelector(".dust-level-time");
    const dustTop = document.querySelector(".dust-top");

    // 오늘 날짜
    let today = new Date();
    let year = today.getFullYear();
    let month = today.getMonth();
    let date = today.getDate();

    month = (month + 1);

    if(month < 10) {
        month = '0' + month;
    }

    if(date<10) {
        date = '0' + date;
    }

    today = year + '-' + month + '-' + date;

        if(data[0].dataTime.indexOf(today)) {
            let nowTime = data[0].dataTime.substring(10, 16);
            time.innerHTML = '오늘' + nowTime;
        }else {
            time.innerHTML = data[0].dataTime;
        }
    
        switch (data[0].pm10Grade) {
            case '1' :
                emoji.innerHTML = '😀';
                dustTop.style.background = 'linear-gradient(to top, white, #6096D8)';
                break;
            case '2' :
                emoji.innerHTML = '🙂';
                dustTop.style.background = 'linear-gradient(to top, white, #088A68)';
                break;
            case '3' :
                emoji.innerHTML = '😷';
                dustTop.style.background = 'linear-gradient(to top, white, #FAAC58)';
                break;
            case '4' :
                emoji.innerHTML = '😱';
                dustTop.style.background = 'linear-gradient(to top, white, #FA5858)';
                break;
            default :
                emoji.innerHTML = '';
                break;
        }
    
        gradeText.innerHTML = data[0].pmMessage;
        dustValue.innerHTML = data[0].pm10Value;
    
}