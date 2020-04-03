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
}

function renderStation(stationName) {
    TARGET.location.innerText = stationName;
}