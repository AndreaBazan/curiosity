const robotPiece = document.querySelector('.robot-piece');
const btns = document.querySelectorAll(".race-btns");
const playQueueButton = document.querySelector("#play-queue");
const clearQueueButton = document.querySelector("#clear-queue");
const queueInterface = document.querySelector('#queue-interface');
const actionsInput = document.querySelector('#play_session_actions');

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
  robotPiece.classList.value = 'robot-piece';
  robotPiece.classList.add(direction);
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

const queueInterfaceElement = (type, executions) => `
  <li data-type="${type}" data-executions="${executions}">${type} ${executions}</li>
`

// Button Actions
function addMovesToQueueInterface() {
  const inputID = this.getAttribute('data-input');
  const times = document.getElementById(inputID).value;
  const direction = this.id;
  queueInterface.insertAdjacentHTML('beforeend', queueInterfaceElement(direction, times))
}

function playQueueInterface() {
  let string_of_movements = "window.multipleMoves()"
  queueInterface.querySelectorAll('li').forEach(action => {
    const action_type = action.dataset.type;
    const times = parseInt(action.dataset.executions);
    string_of_movements += `.then(
      robot => robot.multipleMoves('${action_type}', ${times})
    )`
  })
  eval(string_of_movements)
}

function convertToAction(input) {
  if (input === 'left' || input === 'right') return `turn_${input}`;
  if (input === 'up') return 'move';
  return 'move';
}

function getActionsFromInterface() {
  actions = []
  queueInterface.querySelectorAll('li').forEach(action => {
    const action_type = convertToAction(action.dataset.type);
    const times = parseInt(action.dataset.executions);
    actions.push({ type: action_type, executions: times });
  })
  return actions;
}

function sendInterface() {
  resetPiecePosition();
  const actions = getActionsFromInterface();
  actionsInput.value = JSON.stringify(actions);
  Rails.fire(actionsInput.form, 'submit');
}

function clearQueueInterface() {
  queueInterface.innerHTML = '';
}

function resetPiecePosition() {
  // robotPiece.style.transitionDuration = '0s';
  document.querySelector('.robot').classList.remove('robot');
  document.querySelector('td').classList.add('robot');
  robotPiece.style.display = 'none'
  setPiecePosition(1, 1);
  setTimeout(_ => { robotPiece.style.display = 'block' }, 3);
}

function restartGame() {
  clearQueueInterface();
  resetPiecePosition();
}

// Buttons Listeners
btns.forEach(btn => {
  btn.onclick = addMovesToQueueInterface;
});
playQueueButton.onclick = sendInterface;
clearQueueButton.onclick = restartGame;

var multipleMoves = function(direction, times) {
  const delay = times ? 700 : 0;
  return new Promise(function(resolve) {
    for (let i = 0; i < times; i++){
      if (canMove(direction)) {
        moveTile(direction);
      }
    }
    setTimeout( _ => {
      resolve(window);
    }, delay);
  });
}

var displayErrors = function(errors) {
  const delay = 700;
  return new Promise(function(resolve) {
    alert(errors);
    setTimeout( _ => {
      resolve(window);
    }, delay);
  });
}

var displaySuccess = function(message) {
  const delay = 700;
  return new Promise(function(resolve) {
    alert(message);
    setTimeout( _ => {
      resolve(window);
    }, delay);
  });
}

function setPiecePosition(x, y) {
  let robot = document.querySelector('.robot');
  x = x || robot.offsetLeft
  y = y || robot.offsetTop
  console.log('Set piece')
  robotPiece.style.left = x + 'px'
  robotPiece.style.top = y + 'px'
}

// Initial Game State
setPiecePosition();

window.multipleMoves = multipleMoves;
window.displayErrors = displayErrors;
window.displaySuccess = displaySuccess;
window.clearQueueInterface = clearQueueInterface;
window.restartGame = restartGame;
