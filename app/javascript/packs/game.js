const robotPiece = document.querySelector('.robot-piece');
const btns = document.querySelectorAll(".race-btns");

// check if a tile have an empty neighbour
function canMove(direction) {
  // Propiedades del tile
  let robot = document.querySelector('.robot');

  // Direction
  switch (direction) {
    case 'left' :
      // LEFT
      if(robot.cellIndex == 0) return false;
      let left = robot.previousElementSibling.className.includes('obstaculo');
      return !left;
      break;
    case 'up' :
      // UP
      if (robot.parentElement.rowIndex == 0) return false;
      let up = robot.parentElement.previousElementSibling.children[robot.cellIndex].className.includes('obstaculo');
      return !up;
      break;
    case 'right':
      // RIGHT
      if(!robot.nextElementSibling) return false;
      let right = robot.nextElementSibling.className.includes('obstaculo');
      return !right;
      break;

    case 'down' :
      // DOWN
      if (!robot.parentElement.nextElementSibling ) return false;
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
    case 'left' :

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

    case 'up' :
      move = robot.parentElement.previousElementSibling.children[robot.cellIndex];
      x = move.offsetLeft;
      y = move.offsetTop;
      // Change absolute position of the robot to the
      robot.classList.toggle("robot");
      move.classList.add("robot")

      // UP
      // Get actual row by Parent Element && previousRow && cell by CellIndex
      break;

    case 'right' :
      move = robot.nextElementSibling;
      x = move.offsetLeft;
      y = move.offsetTop;
      // Change absolute position of the robot to the
      robot.classList.toggle("robot");
      move.classList.add("robot");

      // RIGHT
      // Add #robot to nextElementSibling && remove #robot to Actual cell
      break;

    case 'down' :
      move = robot.parentElement.nextElementSibling.children[robot.cellIndex];
      x = move.offsetLeft;
      y = move.offsetTop;
      // Change absolute position of the robot to the
      robot.classList.toggle("robot");
      move.classList.add("robot")
      // DOWN
      // Get actual row by Parent Element && nextRow && cell by CellIndex
      break;
    default:
      console.log('Something went wrong');
  }
  setPiecePosition();
}


let playerMoves = [];

function moveToDirection() {
  const inputID = this.getAttribute('data-input');
  const times = document.getElementById(inputID).value;
  const direction = this.id;

  multipleMoves(direction, times);
}

const queueInterfaceElement = (type, executions) => `
  <li data-type="${type}" data-executions="${executions}">${type} ${executions}</li>
`

function addMovesToQueueInterface() {
  const inputID = this.getAttribute('data-input');
  const times = document.getElementById(inputID).value;
  const direction = this.id;

  const queueInterface = document.querySelector('#queue-interface');
  queueInterface.insertAdjacentHTML('beforeend', queueInterfaceElement(direction, times))
}


// Buttons Listeners
btns.forEach(btn => {
  btn.onclick = addMovesToQueueInterface;
});

var multipleMoves = function(direction, times) {
  return new Promise(function(resolve) {
    for (let i = 0; i < times; i++){
      if (canMove(direction)) {
        moveTile(direction);
      }
    }
    setTimeout( _ => {
      resolve(window);
    }, 1000);
  });
}

window.multipleMoves = multipleMoves;

function setPiecePosition() {
  console.log('Set piece')
  let robot = document.querySelector('.robot');
  robotPiece.style.left = robot.offsetLeft + 'px'
  robotPiece.style.top = robot.offsetTop + 'px'
}

// Initial Game State
setPiecePosition();
