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
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
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
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 15);
/******/ })
/************************************************************************/
/******/ ({

/***/ 15:
/*!**************************************!*\
  !*** ./app/javascript/packs/game.js ***!
  \**************************************/
/*! dynamic exports provided */
/*! all exports used */
/***/ (function(module, exports) {

const robotPiece = document.querySelector('.curi');
const btns = document.querySelectorAll(".race-btns");

// check if a tile have an empty neighbour
function canMove(direction) {
  // Propiedades del tile
  let robot = document.querySelector('.robot');

  // Direction
  switch (direction) {
    case 'left':
      // LEFT
      if (robot.cellIndex == 0) return false;
      let left = robot.previousElementSibling.className.includes('obstaculo');
      return !left;
      break;
    case 'up':
      // UP
      if (robot.parentElement.rowIndex == 0) return false;
      let up = robot.parentElement.previousElementSibling.children[robot.cellIndex].className.includes('obstaculo');
      return !up;
      break;
    case 'right':
      // RIGHT
      if (!robot.nextElementSibling) return false;
      let right = robot.nextElementSibling.className.includes('obstaculo');
      return !right;
      break;

    case 'down':
      // DOWN
      if (!robot.parentElement.nextElementSibling) return false;
      let down = robot.parentElement.nextElementSibling.children[robot.cellIndex].className.includes('obstaculo');
      return !down;
      break;
    default:
      console.log('Something went wrong');
  }
}

// Move the tile
function moveTile(direction) {
  // Propiedades del tile
  let robot = document.querySelector('.robot');
  let move;
  let x;
  let y;

  // Direction
  switch (direction) {
    case 'left':

      move = robot.previousElementSibling;
      x = move.offsetLeft;
      y = move.offsetTop;
      // Change absolute position of the robot to the
      robot.classList.toggle("robot");
      move.classList.add("robot");
      // LEFT
      // Add #robot to previousSibling && remove #robot to Actual cell
      // Return boolean

      break;

    case 'up':
      move = robot.parentElement.previousElementSibling.children[robot.cellIndex];
      x = move.offsetLeft;
      y = move.offsetTop;
      // Change absolute position of the robot to the
      robot.classList.toggle("robot");
      move.classList.add("robot");

      // UP
      // Get actual row by Parent Element && previousRow && cell by CellIndex
      break;

    case 'right':
      move = robot.nextElementSibling;
      x = move.offsetLeft;
      y = move.offsetTop;
      // Change absolute position of the robot to the
      robot.classList.toggle("robot");
      move.classList.add("robot");

      // RIGHT
      // Add #robot to nextElementSibling && remove #robot to Actual cell
      break;

    case 'down':
      move = robot.parentElement.nextElementSibling.children[robot.cellIndex];
      x = move.offsetLeft;
      y = move.offsetTop;
      // Change absolute position of the robot to the
      robot.classList.toggle("robot");
      move.classList.add("robot");
      // DOWN
      // Get actual row by Parent Element && nextRow && cell by CellIndex
      break;
    default:
      console.log('Something went wrong');
  }
  setPiecePosition();
}

let playerMoves = [];

function queueMove() {
  const inputID = this.getAttribute('data-input');
  const times = document.getElementById(inputID).value;
  const direction = this.id;
}

//function printMoves() {};

function moveToDirection() {
  const inputID = this.getAttribute('data-input');
  const times = document.getElementById(inputID).value;
  const direction = this.id;

  multipleMoves(direction, times);
}

btns.forEach(btn => {
  btn.onclick = moveToDirection;
});

var multipleMoves = function (direction, times) {
  return new Promise(function (resolve) {
    for (let i = 0; i < times; i++) {
      if (canMove(direction)) {
        moveTile(direction);
      }
    }
    setTimeout(_ => {
      resolve(window);
    }, 1000);
  });
};

window.multipleMoves = multipleMoves;

function setPiecePosition() {
  console.log('Set piece');
  let robot = document.querySelector('.robot');
  robotPiece.style.left = robot.offsetLeft + 'px';
  robotPiece.style.top = robot.offsetTop + 'px';
}

// Initial Game State
setPiecePosition();

/***/ })

/******/ });
//# sourceMappingURL=game-144d08784f3f9060684b.js.map