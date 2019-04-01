//Added gasoline grades selectable with radio buttons.
//87 - lowest grade, slowest and dumbest rockets. 
//89 - middle grade
//93 - high grade, fastest and smartest rockets.

// Based on The Nature of Code example 
//"Simple Smart Rockets w/ Genetic Algorithms 
//by Daniel Shiffman.
// http://natureofcode.com

// 

// Each Rocket's DNA is an array of p5.Vectors
// Each p5.Vector acts as a force for each frame of animation
// Imagine a booster on the end of the rocket that can point in any direction
// and fire at any strength every frame

// The Rocket's fitness is a function of how close it gets to the target as well as how fast it gets there

// This example is inspired by Jer Thorp's Smart Rockets
// http://www.blprnt.com/smartrockets/

let lifetime; // How long should each generation live

let population; // Population

let lifeCounter; // Timer for cycle of generation

let target; // Target position

let info;

//radio buttons for gasoline grade selection
//vars for imgs
let box87, box89, box93, radio, popRadio;


function setup() {
  createCanvas(640, 360);


  lifetime = height;

  // Initialize variables
  lifeCounter = 0;

  target = createVector(width / 2, 24);
  //gas boxes
  box87 = loadImage('assets/87.png');
  box89 = loadImage('assets/89.png');
  box93 = loadImage('assets/93.png');
  radio = createRadio();
  radio.option("", 1);
  radio.option("", 2);
  radio.option("", 3);
  radio.value(1);
  radio.position(2 * height / 60 + 40, 2 * height / 24);
  radio.style('width', '10px');
  popRadio = 200;

  resetSketch(0.3, 200, 24);

  info = createP("");
  info.position(10, 380);

}

function draw() {
  background(101);
  image(box87, 2 * height / 60, 2 * height / 60, 2 * height / 24, 2 * height / 24);
  image(box89, 2 * height / 60, 8 * height / 60, 2 * height / 24, 2 * height / 24);
  image(box93, 2 * height / 60, 14 * height / 60, 2 * height / 24, 2 * height / 24);
  // Draw the start and target positions
  fill(0);
  stroke(0);
  ellipse(target.x, target.y, 24, 24);


  // If the generation hasn't ended yet
  if (lifeCounter < lifetime) {
    population.live();
    lifeCounter++;
    // Otherwise a new generation
  } else {
    lifeCounter = 0;
    population.fitness();
    population.selection();
    population.reproduction();
  }

  // Display some info
  fill(0);

  info.html("You must click each the button twice.  Clicking the mouse will clear the screen."  + "<br>" + "Generation #: " + population.getGenerations() + "<br>" + "Cycles left: " + (lifetime - lifeCounter));

  if (mouseIsPressed && radio.value() == 1) {
    resetSketch(0.3, 200, 30);
  } else if (mouseIsPressed && radio.value() == 2) {
    resetSketch(0.05, 100, 48);
  } else if (mouseIsPressed && radio.value() == 3) {
    resetSketch(0.01, 50, 60);
  }
}

function resetSketch(mutR, popNum, fRate) {
  frameRate(fRate);
  // Create a population with a mutation rate, and population max
  let mutationRate;
  mutationRate = mutR;
  population = new Population(mutationRate, popNum);
}
