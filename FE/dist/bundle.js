/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./js/main.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./js/common/util.js":
/*!***************************!*\
  !*** ./js/common/util.js ***!
  \***************************/
/*! exports provided: $, $$ */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"$\", function() { return $; });\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"$$\", function() { return $$; });\nconst $ = document.querySelector.bind(document);\n\nconst $$ = document.querySelectorAll.bind(document);\n\n//# sourceURL=webpack:///./js/common/util.js?");

/***/ }),

/***/ "./js/dust/dust.js":
/*!*************************!*\
  !*** ./js/dust/dust.js ***!
  \*************************/
/*! exports provided: getCurrentLocation */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"getCurrentLocation\", function() { return getCurrentLocation; });\n/* harmony import */ var _dustUtil_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./dustUtil.js */ \"./js/dust/dustUtil.js\");\n\n\nfunction getCurrentLocation() {\n    navigator.geolocation.getCurrentPosition((position) => {\n        getStationData(position.coords.latitude, position.coords.longitude);\n    });\n}\n\nasync function getStationData(latitude, longitude) {\n    const options = {\n        method: 'GET'\n    };\n    const response = await fetch(`http://15.165.113.21:8080/location?coordinateWGS84=${longitude},${latitude}`, options);\n    const result = await response.json();\n    const stationName = result.responseMessage[0].stationName;\n    getDustData(stationName);\n}\n\nasync function getDustData(stationName) {\n    const options = {\n        method: 'GET'\n    };\n    const response = await fetch(`http://15.165.113.21:8080/dust-status?stationName=${stationName}`, options);\n    const result = await response.json();\n    render(stationName, result.responseMessage);\n}\n\nfunction render(stationName, dustData) {\n    renderStation(stationName);\n    renderGraph(dustData);\n}\n\nfunction renderStation(stationName) {\n    _dustUtil_js__WEBPACK_IMPORTED_MODULE_0__[\"TARGET\"].location.innerText = stationName;\n}\n\nfunction renderGraph(dustData) {\n    dustData.forEach(dustData => {\n        if (dustData.pm10Grade === \"\") return;\n        console.log(dustData);\n        const widthValue = calculateValue(parseInt(dustData.pm10Value));\n        const li = document.createElement(\"li\");\n        const div = document.createElement(\"div\");\n        const color = ['#017AFF', '#37E030', '#E0AA31', '#CE1817'];\n        const dustColor = parseInt(dustData.pm10Grade) - 1;\n        div.style.background = \"linear-gradient(to right, \" + color[dustColor] + \" \" + widthValue + \"%, #FFFFFF \" + widthValue + \"%)\";\n        const text = document.createTextNode(dustData.pm10Value);\n        div.appendChild(text);\n        li.appendChild(div);\n        document.querySelector('.dust-graph-ul').appendChild(li);\n    });\n    rendurDust(dustData);\n}\n\nfunction calculateValue(pm10Value) {\n    if (pm10Value < 201) return pm10Value / 2;\n    else if (pm10Value > 200) return 100;\n}\n\nfunction rendurDust(data) {\n    const emoji = document.querySelector(\".dust-level-emoji\");\n    const gradeText = document.querySelector(\".dust-level-text\");\n    const dustValue = document.querySelector(\".dust-level-value\");\n    const time = document.querySelector(\".dust-level-time\");\n    const dustTop = document.querySelector(\".dust-top\");\n\n    // 오늘 날짜\n    let today = new Date();\n    let year = today.getFullYear();\n    let month = today.getMonth();\n    let date = today.getDate();\n\n    month = (month + 1);\n\n    if(month < 10) {\n        month = '0' + month;\n    }\n\n    if(date<10) {\n        date = '0' + date;\n    }\n\n    today = year + '-' + month + '-' + date;\n\n        if(data[0].dataTime.indexOf(today)) {\n            let nowTime = data[0].dataTime.substring(10, 16);\n            time.innerHTML = '오늘' + nowTime;\n        }else {\n            time.innerHTML = data[0].dataTime;\n        }\n    \n        switch (data[0].pm10Grade) {\n            case '1' :\n                emoji.innerHTML = '😀';\n                dustTop.style.background = 'linear-gradient(to top, white, #6096D8)';\n                break;\n            case '2' :\n                emoji.innerHTML = '🙂';\n                dustTop.style.background = 'linear-gradient(to top, white, #088A68)';\n                break;\n            case '3' :\n                emoji.innerHTML = '😷';\n                dustTop.style.background = 'linear-gradient(to top, white, #FAAC58)';\n                break;\n            case '4' :\n                emoji.innerHTML = '😱';\n                dustTop.style.background = 'linear-gradient(to top, white, #FA5858)';\n                break;\n            default :\n                emoji.innerHTML = '';\n                break;\n        }\n    \n        gradeText.innerHTML = data[0].pmMessage;\n        dustValue.innerHTML = data[0].pm10Value;\n    \n}\n\n//# sourceURL=webpack:///./js/dust/dust.js?");

/***/ }),

/***/ "./js/dust/dustUtil.js":
/*!*****************************!*\
  !*** ./js/dust/dustUtil.js ***!
  \*****************************/
/*! exports provided: TARGET */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"TARGET\", function() { return TARGET; });\n/* harmony import */ var _common_util_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../common/util.js */ \"./js/common/util.js\");\n\n\nconst TARGET = {\n    location: Object(_common_util_js__WEBPACK_IMPORTED_MODULE_0__[\"$\"])('.dust-location'),\n    graphUl: Object(_common_util_js__WEBPACK_IMPORTED_MODULE_0__[\"$\"])('.dust-graph-ul')\n}\n\n//# sourceURL=webpack:///./js/dust/dustUtil.js?");

/***/ }),

/***/ "./js/main.js":
/*!********************!*\
  !*** ./js/main.js ***!
  \********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _dust_dust_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./dust/dust.js */ \"./js/dust/dust.js\");\n\n\nwindow.addEventListener('DOMContentLoaded', () => {\n    Object(_dust_dust_js__WEBPACK_IMPORTED_MODULE_0__[\"getCurrentLocation\"])();\n});\n\n//# sourceURL=webpack:///./js/main.js?");

/***/ })

/******/ });