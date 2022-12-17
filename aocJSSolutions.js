// import path from "path";
// import fs from "fs";
// const fs = require("fs");

// const CRATE_SIZE = "[X]".length;
// const raw_stacks_lines = raw_stacks.split("\n");
// // Remove last line of " 1   2   3   4   5   6   7   8   9 "
// raw_stacks_lines.pop();

// const stacks = [];

// for (let raw_stack_line of raw_stacks_lines) {
//   for (let i = 0; i < raw_stack_line.length; i += CRATE_SIZE + 1) {
//     const start = i;
//     const end = start + CRATE_SIZE;
//     const crate = raw_stack_line.substring(start, end);

//     const stack_index = i / (CRATE_SIZE + 1);
//     if (!stacks[stack_index]) {
//       stacks[stack_index] = [];
//     }
//     if (crate.trim()) {
//       // "[X]" -> "X"
//       stacks[stack_index].push(crate.substring(1, 2));
//     }
//   }
// }

// // Now the "top" item of the stack is the first item within all the arrays.
// // It's easier to have this at the end so we can `pop` them, so reverse all
// // our stacks
// for (let stack of stacks) {
//   stack.reverse();
// }

// // Now parse move instructions
// const instructions = raw_instructions.split("\n").map((line) => {
//   // e.g. `move 13 from 3 to 6`
//   let [, count, from, to] = /move (\d+) from (\d+) to (\d+)/.exec(line);
//   count = parseInt(count, 10);
//   // Stacks are 0-indexed
//   from = parseInt(from, 10) - 1;
//   to = parseInt(to, 10) - 1;

//   return { count, from, to };
// });

// function partOne() {
//   const stacks_p1 = JSON.parse(JSON.stringify(stacks));
//   for (let { count, from, to } of instructions) {
//     for (let c = 0; c < count; c++) {
//       let crate = stacks_p1[from].pop();
//       stacks_p1[to].push(crate);
//     }
//   }

//   return stacks_p1;
// }

// function partTwo() {
//   const stacks_p2 = JSON.parse(JSON.stringify(stacks));
//   for (let { count, from, to } of instructions) {
//     // Negative `start` index counts back from the end of the array
//     let group_crates = stacks_p2[from].splice(-1 * count, count);
//     stacks_p2[to].push(...group_crates);
//   }

//   return stacks_p2;
// }

// const top_crates_p1 = partOne()
//   .map((stack) => stack[stack.length - 1])
//   .join("");

// const top_crates_p2 = partTwo()
//   .map((stack) => stack[stack.length - 1])
//   .join("");

// console.log("Part One:", top_crates_p1);
// console.log("Part Two:", top_crates_p2);
// import { syncReadFile } from "../utils.js";

// let arr = fs
//   .readFileSync("day_10_input.txt", "utf8")
//   .toString()
//   .trim()
//   .split("\n");
// // .split("\n\n");

// // let arr = syncReadFile("./input.txt");
// // sample.txt expects 13140 as answer for part 1
// // sample.txt expects something rendered as answer for part 2

// arr = arr.map((item) => {
//   return item.split(" ");
// });

// let map = new Map();
// let cycleCount = 1;
// let x = 1;

// // creating the map
// arr.forEach((item) => {
//   let [action, addValue] = item;
//   addValue = parseInt(addValue);

//   if (action === "noop") {
//     map.set(cycleCount, x);
//     cycleCount++;
//   } else {
//     map.set(cycleCount, x);
//     cycleCount++;
//     map.set(cycleCount, x);
//     x += addValue;
//     cycleCount++;
//   }
// });

// //part1
// let start = 20;
// let commonDiff = 40;
// let sum = 0;

// for (let i = start; i <= cycleCount; i = i + commonDiff) {
//   sum += map.get(i) * i;
// }

// // console.log("part1 >> ", sum);

// // part2
// let str = "";

// for (let i = 1; i < cycleCount; i++) {
//   if (isSpriteVisible(i)) {
//     str += "#";
//   } else {
//     str += ".";
//   }

//   if (i % 40 === 0) {
//     str += "\n";
//   }
// }

// // helper function
// function isSpriteVisible(cycle) {
//   let diff = (cycle % 40 ? cycle % 40 : 40) - map.get(cycle);

//   return diff >= 0 && diff <= 2;
// }

// console.log("part2 >> ");
// console.log(str);

fs = require("fs");
//   .readFileSync("day_13_input.txt")
//   .toString()
//   .split("\r")
//   .join("")
//   .split("\n\n")
//   .map((l) => l.split("\n").map((x) => JSON.parse(x)));

// function checkValue(a, b) {
//   if (!Array.isArray(a) && !Array.isArray(b)) return a - b;
//   else {
//     if (!Array.isArray(a)) a = [a];
//     if (!Array.isArray(b)) b = [b];
//     for (var i = 0; i < Math.min(a.length, b.length); i++)
//       if ((res = checkValue(a[i], b[i])) != 0) return res;
//     return a.length - b.length;
//   }
// }

// console.log(
//   "PART 1:",
//   input.reduce((sum, l, i) => sum + (checkValue(l[0], l[1]) > 0 ? 0 : i + 1), 0)
// );

// input.push([[[2]], [[6]]]);
// part2 = input
//   .flat()
//   .sort((a, b) => checkValue(a, b))
//   .map((x) => x.toString());
// console.log("PART 2:", (part2.indexOf("2") + 1) * (part2.indexOf("6") + 1));

// const lines = fs
//   .readFileSync("day_14_input.txt", { encoding: "utf-8" }) // read day??.txt content
//   .replace(/\r/g, "") // remove all \r characters to avoid issues on Windows
//   .trim() // Remove starting/ending whitespace
//   .split("\n"); // Split on newline

// // Return a new object to avoid side effects between part 1 and 2
// function getInput() {
//   const map = new Set();

//   let maxY = 0;

//   //498,4 -> 498,6 -> 496,6
//   for (const line of lines) {
//     const points = line.split(" -> ").map((point) => {
//       const [x, y] = point.split(",").map(Number);
//       if (y > maxY) {
//         maxY = y;
//       }
//       return { x, y };
//     });

//     let currentPoint = points.shift();
//     while (points.length) {
//       let targetPoint = points.shift();

//       // Draw a line between currentPoint and targetPoint
//       while (
//         currentPoint.x !== targetPoint.x ||
//         currentPoint.y !== targetPoint.y
//       ) {
//         map.add(`${currentPoint.x},${currentPoint.y}`);
//         if (currentPoint.x !== targetPoint.x) {
//           const delta =
//             (targetPoint.x - currentPoint.x) /
//             Math.abs(targetPoint.x - currentPoint.x);
//           currentPoint.x += delta;
//         } else {
//           const delta =
//             (targetPoint.y - currentPoint.y) /
//             Math.abs(targetPoint.y - currentPoint.y);
//           currentPoint.y += delta;
//         }
//       }
//       map.add(`${currentPoint.x},${currentPoint.y}`);
//     }
//   }

//   return { map, maxY };
// }

// function part1() {
//   const { map, maxY } = getInput();

//   let sandIntoEndlessVoid = false;
//   let sandUnits = 0;
//   while (!sandIntoEndlessVoid) {
//     //spawn sand
//     let point = { x: 500, y: 0 }; // assume this point is always empty
//     sandUnits++;

//     // drop the sand
//     while (!sandIntoEndlessVoid) {
//       if (!map.has(`${point.x},${point.y + 1}`)) {
//         // direct fall
//         point.y++;
//       } else if (!map.has(`${point.x - 1},${point.y + 1}`)) {
//         // diagonal fall to the left
//         point.y++;
//         point.x--;
//       } else if (!map.has(`${point.x + 1},${point.y + 1}`)) {
//         // diagonal fall to the right
//         point.y++;
//         point.x++;
//       } else {
//         // can't fall further
//         map.add(`${point.x},${point.y}`);
//         break;
//       }
//       if (point.y >= maxY) {
//         sandIntoEndlessVoid = true;
//         sandUnits--;
//       }
//     }
//   }

//   console.log(sandUnits);
// }

// function part2() {
//   const { map, maxY } = getInput();

//   let sandUnits = 0;
//   while (true) {
//     if (map.has(`500,0`)) {
//       break;
//     }
//     //spawn sand
//     let point = { x: 500, y: 0 };
//     sandUnits++;

//     // drop the sand
//     while (true) {
//       if (point.y === maxY + 1) {
//         // reached the bottom floor
//         map.add(`${point.x},${point.y}`);
//         break;
//       } else if (!map.has(`${point.x},${point.y + 1}`)) {
//         // direct fall
//         point.y++;
//       } else if (!map.has(`${point.x - 1},${point.y + 1}`)) {
//         // diagonal fall to the left
//         point.y++;
//         point.x--;
//       } else if (!map.has(`${point.x + 1},${point.y + 1}`)) {
//         // diagonal fall to the right
//         point.y++;
//         point.x++;
//       } else {
//         // can't fall further
//         map.add(`${point.x},${point.y}`);
//         break;
//       }
//     }
//   }

//   console.log(sandUnits);
// }

// part1();
// part2();

//  day 15
// const lines = fs
//   .readFileSync("day_15_input.txt")
//   .toString()
//   .split("\n")
//   .filter((el) => el.length)
//   .map((line) => {
//     line = line.replace("Sensor at ", "");
//     const spl = line.split(": closest beacon is at ");
//     const sensor = [
//       Number(spl[0].split(", ")[0].replace("x=", "")),
//       Number(spl[0].split(", ")[1].replace("y=", "")),
//     ];
//     const beacon = [
//       Number(spl[1].split(", ")[0].replace("x=", "")),
//       Number(spl[1].split(", ")[1].replace("y=", "")),
//     ];

//     return {
//       sensor: { x: sensor[0], y: sensor[1] },
//       beacon: { x: beacon[0], y: beacon[1] },
//     };
//   });

// const getRadius = (sensor, beacon) => {
//   return Math.abs(sensor.x - beacon.x) + Math.abs(sensor.y - beacon.y);
// };

// const getPointsOnLine = (lineY, sensor, radius) => {
//   const diff = Math.abs(lineY - sensor.y);
//   if (radius < diff) return null;

//   if (diff === radius) return [sensor.x, sensor.x];

//   const leftX = sensor.x - (radius - diff);
//   const rightX = sensor.x + (radius - diff);

//   return [leftX, rightX];
// };

// const mergeIntervals = (intervals) => {
//   intervals.sort((a, b) => a[0] - b[0]);
//   const merged = [intervals[0]];

//   for (let i = 1; i < intervals.length; i++) {
//     const [start, end] = intervals[i];
//     let prev = merged[merged.length - 1];
//     if (prev[1] >= start) {
//       prev[1] = Math.max(prev[1], end);
//     } else merged.push(intervals[i]);
//   }
//   return merged;
// };

// const getRangeOnLine = (target) => {
//   const intervals = [];

//   lines.forEach((line) => {
//     const r = getRadius(line.sensor, line.beacon);
//     const points = getPointsOnLine(target, line.sensor, r);
//     if (points !== null) {
//       intervals.push(points);
//     }
//   });

//   const intervalsMerged = mergeIntervals(intervals);
//   return intervalsMerged;
// };

// const first = () => {
//   const target = 2000000;

//   const intervalsMerged = getRangeOnLine(target);

//   const totalLength = intervalsMerged.reduce((acc, i) => {
//     return acc + (i[1] - i[0]);
//   }, 0);

//   console.log("first", totalLength);
// };

// const second = () => {
//   let point;
//   for (let i = 0; i <= 4000000; i++) {
//     const intervals = getRangeOnLine(i);
//     if (intervals.length > 1) {
//       // Assumes that we need one point which is not at x 0 or x 4000000
//       point = { x: intervals[0][1] + 1, y: i };
//       break;
//     }
//   }

//   console.log("second", point.x * 4000000 + point.y);
// };

// const main = () => {
//   first();
//   second();
// };

// main();

// day 16
// const input = fs.readFileSync("day_16_input.txt", { encoding: "utf-8" });
// let nodes = input.split("\n").map((row, id) => {
//   let tmp = row.split(" ");
//   return {
//     id: id,
//     name: tmp[1],
//     rate: Number(tmp[4].match(/\d+/g)[0]),
//     connections: tmp.slice(tmp.indexOf("to") + 2).map((v) => v.substr(0, 2)),
//   };
// });

// let nodeByName = {};
// nodes.map((n, i) => (nodeByName[n.name] = n));

// const activeNodes = () => nodes.filter((n) => n.rate > 0);

// const distanceMap = (startName, distances = {}) => {
//   if (nodeByName[startName].distanceMap)
//     return nodeByName[startName].distanceMap;
//   const spread = (name, steps) => {
//     if (distances[name] != undefined && distances[name] <= steps) return;
//     distances[name] = steps;
//     nodeByName[name].connections.forEach((n) => spread(n, steps + 1));
//   };
//   spread(startName, 0);
//   nodeByName[startName].distanceMap = distances;
//   return distances;
// };

// const computePaths = (timeLeft) => {
//   console.log("compute paths for time", timeLeft);
//   let paths = [
//     {
//       curr: "AA",
//       active: activeNodes().map((n) => n.name),
//       timeLeft: timeLeft,
//       finished: false,
//       steps: [],
//       releasedPressure: 0,
//     },
//   ];

//   let max = 0;

//   for (let n = 0; n < paths.length; n++) {
//     let path = paths[n];
//     if (path.timeLeft <= 0) path.finished = true;
//     if (path.finished) continue;

//     let distances = distanceMap(path.curr),
//       moved = false;
//     path.active.forEach((act) => {
//       if (act == path.curr) return true;
//       if (path.timeLeft - distances[act] <= 1) return true;
//       moved = true;
//       paths.push({
//         curr: act,
//         active: path.active.filter((v) => v != act),
//         timeLeft: path.timeLeft - distances[act] - 1,
//         finished: false,
//         steps: [...path.steps, act],
//         releasedPressure:
//           path.releasedPressure +
//           (path.timeLeft - distances[act] - 1) * nodeByName[act].rate,
//       });
//     });
//     if (!moved) path.finished = true;
//     if (path.finished && path.releasedPressure > max)
//       max = path.releasedPressure;
//   }

//   return paths
//     .filter((p) => p.finished)
//     .sort((a, b) => b.releasedPressure - a.releasedPressure);
// };

// const part2 = () => {
//   let paths = computePaths(26),
//     max = 0;

//   // this needs some memoization / speed-up / rethinking. Runs approx for 2 minutes ;/
//   for (let i = 0; i < paths.length; i++)
//     for (let j = i + 1; j < paths.length; j++)
//       if (paths[i].steps.every((s) => !paths[j].steps.includes(s)))
//         if (paths[i].releasedPressure + paths[j].releasedPressure > max) {
//           console.log(
//             "we have a new p2 max",
//             paths[i].releasedPressure + paths[j].releasedPressure
//           );
//           max = paths[i].releasedPressure + paths[j].releasedPressure;
//         }
// };

// console.log(computePaths(30)[0].releasedPressure); // p1
// part2();

// // day 17
// function d17() {
//   // let inp = document.body.innerText.trim();
//   //let inp = ">>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>";
//   let inp = fs.readFileSync("input_day_17.txt");
//   let space = [[], [], [], [], [], [], []]; //x is the first dimension, y is the second

//   let template = [
//     [
//       [0, 0],
//       [1, 0],
//       [2, 0],
//       [3, 0],
//     ],
//     [
//       [1, 0],
//       [1, 1],
//       [0, 1],
//       [2, 1],
//       [1, 2],
//     ],
//     [
//       [2, 2],
//       [2, 1],
//       [2, 0],
//       [1, 0],
//       [0, 0],
//     ],
//     [
//       [0, 0],
//       [0, 1],
//       [0, 2],
//       [0, 3],
//     ],
//     [
//       [0, 0],
//       [0, 1],
//       [1, 0],
//       [1, 1],
//     ],
//   ];

//   let jetid = 0;
//   let maxh = -1;
//   let maxhm = 0;
//   for (let i = 0; i < 18580; i++) {
//     //if (i%5==0 && jetid%inp.length<100) console.log(jetid%inp.length,i);

//     let rock = template[i % 5].map((x) => [x[0] + 2, x[1] + maxh + 4]);

//     while (true) {
//       //console.log(rock[0]);
//       //l/r movement
//       let jid = inp[jetid++ % inp.length];
//       let nrock;
//       if (jid == "<") nrock = rock.map((x) => [x[0] - 1, x[1]]);
//       else nrock = rock.map((x) => [x[0] + 1, x[1]]);
//       let repl = true;
//       for (let c of nrock) {
//         if (c[0] < 0 || c[0] >= 7 || space[c[0]][c[1]]) repl = false;
//       }
//       if (repl) rock = nrock;

//       nrock = rock.map((x) => [x[0], x[1] - 1]);
//       let fin = false;
//       for (let c of nrock) {
//         if (c[1] < 0 || space[c[0]][c[1]]) fin = true;
//       }
//       if (fin) {
//         for (let c of rock) {
//           space[c[0]][c[1]] = 1;
//           if (c[1] > maxh) maxh = c[1];
//         }
//         break;
//       } else rock = nrock;
//     }
//     if (maxh > 100) {
//       space = space.map((x) => x.slice(30));
//       maxh -= 30;
//       maxhm++;
//     }
//   }
//   return maxhm * 30 + maxh + 1 + 1560919511228;
// }
// console.log(d17());
// 1560919559536
// 1527145358991
// 1514285714288
// 1524637684121
// 1525364431487

// const fs = require("fs");
const performance = require("perf_hooks").performance;
const eol = require("os").EOL;

let startTime = performance.now();
let part1 = (part2 = 0);
let input = fs
  .readFileSync("input_day_17.txt", "utf8")
  .split(eol)
  .join("")
  .split("");
let chamber = [["#", "#", "#", "#", "#", "#", "#", "#", "#"]];
let segment = ["#", ".", ".", ".", ".", ".", ".", ".", "#"];

let bloks = [
  [["#", "#", "#", "#"]],
  [
    [".", "#", "."],
    ["#", "#", "#"],
    [".", "#", "."],
  ],
  [
    ["#", "#", "#"],
    [".", ".", "#"],
    [".", ".", "#"],
  ],
  [["#"], ["#"], ["#"], ["#"]],
  [
    ["#", "#"],
    ["#", "#"],
  ],
];
let steps = 1000000000000;
let blockIndex = 0;
let numBlocks = bloks.length;
let numjets = input.length;
let topIndex = 1;
let jetIndex = 0;

function colides(block, blockX, blockY) {
  return block.some((r, y) => {
    return r.some((state, x) => {
      return state == "#" && chamber[blockY + y][blockX + x] == "#";
    });
  });
}

function checkRepeat() {
  let l = topIndex - 1;
  let max = ~~(chamber.length / 2) - 5;
  let len = max;
  for (len; len > input.length / 5; len--) {
    let same = true;
    for (let i = 0; i < len; i++) {
      if (
        !chamber[l - i].every((el, ix) => el === chamber[l - (i + len)][ix])
      ) {
        same = false;
        break;
      }
    }
    if (same) {
      return len;
    }
  }
  return -1;
}
let repeatFound = false;
let repeatLength = 0;
let repeatNext = 0;
let repeatStep = 0;
let mult = 0;
while (steps--) {
  let block = bloks[blockIndex];
  let blockHeight = block.length;
  let blockY = topIndex + 3;
  let blockX = 3;
  while (blockY + blockHeight > chamber.length) {
    chamber.push(segment.slice());
  }

  while (true) {
    let jet = input[jetIndex++ % numjets] == "<" ? -1 : +1;
    if (!colides(block, blockX + jet, blockY)) blockX += jet;
    if (!colides(block, blockX, blockY - 1)) {
      blockY--;
    } else {
      block.forEach((r, y) => {
        r.forEach((state, x) => {
          if (state == "#") chamber[blockY + y][blockX + x] = state;
        });
      });
      topIndex = Math.max(blockY + blockHeight, topIndex);
      break;
    }
  }
  if (mult === 0) {
    if (!repeatFound) {
      let repeat = checkRepeat();
      if (repeat != -1) {
        repeatFound = true;
        repeatNext = topIndex + repeat;
        repeatLength = repeat;
        repeatStep = steps;
      }
    } else if (repeatNext == topIndex) {
      repeatStep = repeatStep - steps;
      mult = Math.floor(steps / repeatStep);
      let rest = steps % repeatStep;
      steps = rest;
    }
  }
  if (1000000000000 - steps == 2022) part1 = topIndex - 1;
  if (++blockIndex == numBlocks) blockIndex = 0;
}
part2 = topIndex - 1 + mult * repeatLength;
let time = performance.now() - startTime;
console.log(`Part 1: ${part1}\nPart 2: ${part2}\nTimer: ${time} ms`);
