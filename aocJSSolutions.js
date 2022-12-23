// // import path from "path";
// // import fs from "fs";
const fs = require("fs");

// // const CRATE_SIZE = "[X]".length;
// // const raw_stacks_lines = raw_stacks.split("\n");
// // // Remove last line of " 1   2   3   4   5   6   7   8   9 "
// // raw_stacks_lines.pop();

// // const stacks = [];

// // for (let raw_stack_line of raw_stacks_lines) {
// //   for (let i = 0; i < raw_stack_line.length; i += CRATE_SIZE + 1) {
// //     const start = i;
// //     const end = start + CRATE_SIZE;
// //     const crate = raw_stack_line.substring(start, end);

// //     const stack_index = i / (CRATE_SIZE + 1);
// //     if (!stacks[stack_index]) {
// //       stacks[stack_index] = [];
// //     }
// //     if (crate.trim()) {
// //       // "[X]" -> "X"
// //       stacks[stack_index].push(crate.substring(1, 2));
// //     }
// //   }
// // }

// // // Now the "top" item of the stack is the first item within all the arrays.
// // // It's easier to have this at the end so we can `pop` them, so reverse all
// // // our stacks
// // for (let stack of stacks) {
// //   stack.reverse();
// // }

// // // Now parse move instructions
// // const instructions = raw_instructions.split("\n").map((line) => {
// //   // e.g. `move 13 from 3 to 6`
// //   let [, count, from, to] = /move (\d+) from (\d+) to (\d+)/.exec(line);
// //   count = parseInt(count, 10);
// //   // Stacks are 0-indexed
// //   from = parseInt(from, 10) - 1;
// //   to = parseInt(to, 10) - 1;

// //   return { count, from, to };
// // });

// // function partOne() {
// //   const stacks_p1 = JSON.parse(JSON.stringify(stacks));
// //   for (let { count, from, to } of instructions) {
// //     for (let c = 0; c < count; c++) {
// //       let crate = stacks_p1[from].pop();
// //       stacks_p1[to].push(crate);
// //     }
// //   }

// //   return stacks_p1;
// // }

// // function partTwo() {
// //   const stacks_p2 = JSON.parse(JSON.stringify(stacks));
// //   for (let { count, from, to } of instructions) {
// //     // Negative `start` index counts back from the end of the array
// //     let group_crates = stacks_p2[from].splice(-1 * count, count);
// //     stacks_p2[to].push(...group_crates);
// //   }

// //   return stacks_p2;
// // }

// // const top_crates_p1 = partOne()
// //   .map((stack) => stack[stack.length - 1])
// //   .join("");

// // const top_crates_p2 = partTwo()
// //   .map((stack) => stack[stack.length - 1])
// //   .join("");

// // console.log("Part One:", top_crates_p1);
// // console.log("Part Two:", top_crates_p2);
// // import { syncReadFile } from "../utils.js";

// // let arr = fs
// //   .readFileSync("day_10_input.txt", "utf8")
// //   .toString()
// //   .trim()
// //   .split("\n");
// // // .split("\n\n");

// // // let arr = syncReadFile("./input.txt");
// // // sample.txt expects 13140 as answer for part 1
// // // sample.txt expects something rendered as answer for part 2

// // arr = arr.map((item) => {
// //   return item.split(" ");
// // });

// // let map = new Map();
// // let cycleCount = 1;
// // let x = 1;

// // // creating the map
// // arr.forEach((item) => {
// //   let [action, addValue] = item;
// //   addValue = parseInt(addValue);

// //   if (action === "noop") {
// //     map.set(cycleCount, x);
// //     cycleCount++;
// //   } else {
// //     map.set(cycleCount, x);
// //     cycleCount++;
// //     map.set(cycleCount, x);
// //     x += addValue;
// //     cycleCount++;
// //   }
// // });

// // //part1
// // let start = 20;
// // let commonDiff = 40;
// // let sum = 0;

// // for (let i = start; i <= cycleCount; i = i + commonDiff) {
// //   sum += map.get(i) * i;
// // }

// // // console.log("part1 >> ", sum);

// // // part2
// // let str = "";

// // for (let i = 1; i < cycleCount; i++) {
// //   if (isSpriteVisible(i)) {
// //     str += "#";
// //   } else {
// //     str += ".";
// //   }

// //   if (i % 40 === 0) {
// //     str += "\n";
// //   }
// // }

// // // helper function
// // function isSpriteVisible(cycle) {
// //   let diff = (cycle % 40 ? cycle % 40 : 40) - map.get(cycle);

// //   return diff >= 0 && diff <= 2;
// // }

// // console.log("part2 >> ");
// // console.log(str);

// fs = require("fs");
// //   .readFileSync("day_13_input.txt")
// //   .toString()
// //   .split("\r")
// //   .join("")
// //   .split("\n\n")
// //   .map((l) => l.split("\n").map((x) => JSON.parse(x)));

// // function checkValue(a, b) {
// //   if (!Array.isArray(a) && !Array.isArray(b)) return a - b;
// //   else {
// //     if (!Array.isArray(a)) a = [a];
// //     if (!Array.isArray(b)) b = [b];
// //     for (var i = 0; i < Math.min(a.length, b.length); i++)
// //       if ((res = checkValue(a[i], b[i])) != 0) return res;
// //     return a.length - b.length;
// //   }
// // }

// // console.log(
// //   "PART 1:",
// //   input.reduce((sum, l, i) => sum + (checkValue(l[0], l[1]) > 0 ? 0 : i + 1), 0)
// // );

// // input.push([[[2]], [[6]]]);
// // part2 = input
// //   .flat()
// //   .sort((a, b) => checkValue(a, b))
// //   .map((x) => x.toString());
// // console.log("PART 2:", (part2.indexOf("2") + 1) * (part2.indexOf("6") + 1));

// // const lines = fs
// //   .readFileSync("day_14_input.txt", { encoding: "utf-8" }) // read day??.txt content
// //   .replace(/\r/g, "") // remove all \r characters to avoid issues on Windows
// //   .trim() // Remove starting/ending whitespace
// //   .split("\n"); // Split on newline

// // // Return a new object to avoid side effects between part 1 and 2
// // function getInput() {
// //   const map = new Set();

// //   let maxY = 0;

// //   //498,4 -> 498,6 -> 496,6
// //   for (const line of lines) {
// //     const points = line.split(" -> ").map((point) => {
// //       const [x, y] = point.split(",").map(Number);
// //       if (y > maxY) {
// //         maxY = y;
// //       }
// //       return { x, y };
// //     });

// //     let currentPoint = points.shift();
// //     while (points.length) {
// //       let targetPoint = points.shift();

// //       // Draw a line between currentPoint and targetPoint
// //       while (
// //         currentPoint.x !== targetPoint.x ||
// //         currentPoint.y !== targetPoint.y
// //       ) {
// //         map.add(`${currentPoint.x},${currentPoint.y}`);
// //         if (currentPoint.x !== targetPoint.x) {
// //           const delta =
// //             (targetPoint.x - currentPoint.x) /
// //             Math.abs(targetPoint.x - currentPoint.x);
// //           currentPoint.x += delta;
// //         } else {
// //           const delta =
// //             (targetPoint.y - currentPoint.y) /
// //             Math.abs(targetPoint.y - currentPoint.y);
// //           currentPoint.y += delta;
// //         }
// //       }
// //       map.add(`${currentPoint.x},${currentPoint.y}`);
// //     }
// //   }

// //   return { map, maxY };
// // }

// // function part1() {
// //   const { map, maxY } = getInput();

// //   let sandIntoEndlessVoid = false;
// //   let sandUnits = 0;
// //   while (!sandIntoEndlessVoid) {
// //     //spawn sand
// //     let point = { x: 500, y: 0 }; // assume this point is always empty
// //     sandUnits++;

// //     // drop the sand
// //     while (!sandIntoEndlessVoid) {
// //       if (!map.has(`${point.x},${point.y + 1}`)) {
// //         // direct fall
// //         point.y++;
// //       } else if (!map.has(`${point.x - 1},${point.y + 1}`)) {
// //         // diagonal fall to the left
// //         point.y++;
// //         point.x--;
// //       } else if (!map.has(`${point.x + 1},${point.y + 1}`)) {
// //         // diagonal fall to the right
// //         point.y++;
// //         point.x++;
// //       } else {
// //         // can't fall further
// //         map.add(`${point.x},${point.y}`);
// //         break;
// //       }
// //       if (point.y >= maxY) {
// //         sandIntoEndlessVoid = true;
// //         sandUnits--;
// //       }
// //     }
// //   }

// //   console.log(sandUnits);
// // }

// // function part2() {
// //   const { map, maxY } = getInput();

// //   let sandUnits = 0;
// //   while (true) {
// //     if (map.has(`500,0`)) {
// //       break;
// //     }
// //     //spawn sand
// //     let point = { x: 500, y: 0 };
// //     sandUnits++;

// //     // drop the sand
// //     while (true) {
// //       if (point.y === maxY + 1) {
// //         // reached the bottom floor
// //         map.add(`${point.x},${point.y}`);
// //         break;
// //       } else if (!map.has(`${point.x},${point.y + 1}`)) {
// //         // direct fall
// //         point.y++;
// //       } else if (!map.has(`${point.x - 1},${point.y + 1}`)) {
// //         // diagonal fall to the left
// //         point.y++;
// //         point.x--;
// //       } else if (!map.has(`${point.x + 1},${point.y + 1}`)) {
// //         // diagonal fall to the right
// //         point.y++;
// //         point.x++;
// //       } else {
// //         // can't fall further
// //         map.add(`${point.x},${point.y}`);
// //         break;
// //       }
// //     }
// //   }

// //   console.log(sandUnits);
// // }

// // part1();
// // part2();

// //  day 15
// // const lines = fs
// //   .readFileSync("day_15_input.txt")
// //   .toString()
// //   .split("\n")
// //   .filter((el) => el.length)
// //   .map((line) => {
// //     line = line.replace("Sensor at ", "");
// //     const spl = line.split(": closest beacon is at ");
// //     const sensor = [
// //       Number(spl[0].split(", ")[0].replace("x=", "")),
// //       Number(spl[0].split(", ")[1].replace("y=", "")),
// //     ];
// //     const beacon = [
// //       Number(spl[1].split(", ")[0].replace("x=", "")),
// //       Number(spl[1].split(", ")[1].replace("y=", "")),
// //     ];

// //     return {
// //       sensor: { x: sensor[0], y: sensor[1] },
// //       beacon: { x: beacon[0], y: beacon[1] },
// //     };
// //   });

// // const getRadius = (sensor, beacon) => {
// //   return Math.abs(sensor.x - beacon.x) + Math.abs(sensor.y - beacon.y);
// // };

// // const getPointsOnLine = (lineY, sensor, radius) => {
// //   const diff = Math.abs(lineY - sensor.y);
// //   if (radius < diff) return null;

// //   if (diff === radius) return [sensor.x, sensor.x];

// //   const leftX = sensor.x - (radius - diff);
// //   const rightX = sensor.x + (radius - diff);

// //   return [leftX, rightX];
// // };

// // const mergeIntervals = (intervals) => {
// //   intervals.sort((a, b) => a[0] - b[0]);
// //   const merged = [intervals[0]];

// //   for (let i = 1; i < intervals.length; i++) {
// //     const [start, end] = intervals[i];
// //     let prev = merged[merged.length - 1];
// //     if (prev[1] >= start) {
// //       prev[1] = Math.max(prev[1], end);
// //     } else merged.push(intervals[i]);
// //   }
// //   return merged;
// // };

// // const getRangeOnLine = (target) => {
// //   const intervals = [];

// //   lines.forEach((line) => {
// //     const r = getRadius(line.sensor, line.beacon);
// //     const points = getPointsOnLine(target, line.sensor, r);
// //     if (points !== null) {
// //       intervals.push(points);
// //     }
// //   });

// //   const intervalsMerged = mergeIntervals(intervals);
// //   return intervalsMerged;
// // };

// // const first = () => {
// //   const target = 2000000;

// //   const intervalsMerged = getRangeOnLine(target);

// //   const totalLength = intervalsMerged.reduce((acc, i) => {
// //     return acc + (i[1] - i[0]);
// //   }, 0);

// //   console.log("first", totalLength);
// // };

// // const second = () => {
// //   let point;
// //   for (let i = 0; i <= 4000000; i++) {
// //     const intervals = getRangeOnLine(i);
// //     if (intervals.length > 1) {
// //       // Assumes that we need one point which is not at x 0 or x 4000000
// //       point = { x: intervals[0][1] + 1, y: i };
// //       break;
// //     }
// //   }

// //   console.log("second", point.x * 4000000 + point.y);
// // };

// // const main = () => {
// //   first();
// //   second();
// // };

// // main();

// // day 16
// // const input = fs.readFileSync("day_16_input.txt", { encoding: "utf-8" });
// // let nodes = input.split("\n").map((row, id) => {
// //   let tmp = row.split(" ");
// //   return {
// //     id: id,
// //     name: tmp[1],
// //     rate: Number(tmp[4].match(/\d+/g)[0]),
// //     connections: tmp.slice(tmp.indexOf("to") + 2).map((v) => v.substr(0, 2)),
// //   };
// // });

// // let nodeByName = {};
// // nodes.map((n, i) => (nodeByName[n.name] = n));

// // const activeNodes = () => nodes.filter((n) => n.rate > 0);

// // const distanceMap = (startName, distances = {}) => {
// //   if (nodeByName[startName].distanceMap)
// //     return nodeByName[startName].distanceMap;
// //   const spread = (name, steps) => {
// //     if (distances[name] != undefined && distances[name] <= steps) return;
// //     distances[name] = steps;
// //     nodeByName[name].connections.forEach((n) => spread(n, steps + 1));
// //   };
// //   spread(startName, 0);
// //   nodeByName[startName].distanceMap = distances;
// //   return distances;
// // };

// // const computePaths = (timeLeft) => {
// //   console.log("compute paths for time", timeLeft);
// //   let paths = [
// //     {
// //       curr: "AA",
// //       active: activeNodes().map((n) => n.name),
// //       timeLeft: timeLeft,
// //       finished: false,
// //       steps: [],
// //       releasedPressure: 0,
// //     },
// //   ];

// //   let max = 0;

// //   for (let n = 0; n < paths.length; n++) {
// //     let path = paths[n];
// //     if (path.timeLeft <= 0) path.finished = true;
// //     if (path.finished) continue;

// //     let distances = distanceMap(path.curr),
// //       moved = false;
// //     path.active.forEach((act) => {
// //       if (act == path.curr) return true;
// //       if (path.timeLeft - distances[act] <= 1) return true;
// //       moved = true;
// //       paths.push({
// //         curr: act,
// //         active: path.active.filter((v) => v != act),
// //         timeLeft: path.timeLeft - distances[act] - 1,
// //         finished: false,
// //         steps: [...path.steps, act],
// //         releasedPressure:
// //           path.releasedPressure +
// //           (path.timeLeft - distances[act] - 1) * nodeByName[act].rate,
// //       });
// //     });
// //     if (!moved) path.finished = true;
// //     if (path.finished && path.releasedPressure > max)
// //       max = path.releasedPressure;
// //   }

// //   return paths
// //     .filter((p) => p.finished)
// //     .sort((a, b) => b.releasedPressure - a.releasedPressure);
// // };

// // const part2 = () => {
// //   let paths = computePaths(26),
// //     max = 0;

// //   // this needs some memoization / speed-up / rethinking. Runs approx for 2 minutes ;/
// //   for (let i = 0; i < paths.length; i++)
// //     for (let j = i + 1; j < paths.length; j++)
// //       if (paths[i].steps.every((s) => !paths[j].steps.includes(s)))
// //         if (paths[i].releasedPressure + paths[j].releasedPressure > max) {
// //           console.log(
// //             "we have a new p2 max",
// //             paths[i].releasedPressure + paths[j].releasedPressure
// //           );
// //           max = paths[i].releasedPressure + paths[j].releasedPressure;
// //         }
// // };

// // console.log(computePaths(30)[0].releasedPressure); // p1
// // part2();

// // // day 17
// // function d17() {
// //   // let inp = document.body.innerText.trim();
// //   //let inp = ">>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>";
// //   let inp = fs.readFileSync("input_day_17.txt");
// //   let space = [[], [], [], [], [], [], []]; //x is the first dimension, y is the second

// //   let template = [
// //     [
// //       [0, 0],
// //       [1, 0],
// //       [2, 0],
// //       [3, 0],
// //     ],
// //     [
// //       [1, 0],
// //       [1, 1],
// //       [0, 1],
// //       [2, 1],
// //       [1, 2],
// //     ],
// //     [
// //       [2, 2],
// //       [2, 1],
// //       [2, 0],
// //       [1, 0],
// //       [0, 0],
// //     ],
// //     [
// //       [0, 0],
// //       [0, 1],
// //       [0, 2],
// //       [0, 3],
// //     ],
// //     [
// //       [0, 0],
// //       [0, 1],
// //       [1, 0],
// //       [1, 1],
// //     ],
// //   ];

// //   let jetid = 0;
// //   let maxh = -1;
// //   let maxhm = 0;
// //   for (let i = 0; i < 18580; i++) {
// //     //if (i%5==0 && jetid%inp.length<100) console.log(jetid%inp.length,i);

// //     let rock = template[i % 5].map((x) => [x[0] + 2, x[1] + maxh + 4]);

// //     while (true) {
// //       //console.log(rock[0]);
// //       //l/r movement
// //       let jid = inp[jetid++ % inp.length];
// //       let nrock;
// //       if (jid == "<") nrock = rock.map((x) => [x[0] - 1, x[1]]);
// //       else nrock = rock.map((x) => [x[0] + 1, x[1]]);
// //       let repl = true;
// //       for (let c of nrock) {
// //         if (c[0] < 0 || c[0] >= 7 || space[c[0]][c[1]]) repl = false;
// //       }
// //       if (repl) rock = nrock;

// //       nrock = rock.map((x) => [x[0], x[1] - 1]);
// //       let fin = false;
// //       for (let c of nrock) {
// //         if (c[1] < 0 || space[c[0]][c[1]]) fin = true;
// //       }
// //       if (fin) {
// //         for (let c of rock) {
// //           space[c[0]][c[1]] = 1;
// //           if (c[1] > maxh) maxh = c[1];
// //         }
// //         break;
// //       } else rock = nrock;
// //     }
// //     if (maxh > 100) {
// //       space = space.map((x) => x.slice(30));
// //       maxh -= 30;
// //       maxhm++;
// //     }
// //   }
// //   return maxhm * 30 + maxh + 1 + 1560919511228;
// // }
// // console.log(d17());
// // 1560919559536
// // 1527145358991
// // 1514285714288
// // 1524637684121
// // 1525364431487

// // const fs = require("fs");
// // const performance = require("perf_hooks").performance;
// // const eol = require("os").EOL;

// // let startTime = performance.now();
// // let part1 = (part2 = 0);
// // let input = fs
// //   .readFileSync("input_day_17.txt", "utf8")
// //   .split(eol)
// //   .join("")
// //   .split("");
// // let chamber = [["#", "#", "#", "#", "#", "#", "#", "#", "#"]];
// // let segment = ["#", ".", ".", ".", ".", ".", ".", ".", "#"];

// // let bloks = [
// //   [["#", "#", "#", "#"]],
// //   [
// //     [".", "#", "."],
// //     ["#", "#", "#"],
// //     [".", "#", "."],
// //   ],
// //   [
// //     ["#", "#", "#"],
// //     [".", ".", "#"],
// //     [".", ".", "#"],
// //   ],
// //   [["#"], ["#"], ["#"], ["#"]],
// //   [
// //     ["#", "#"],
// //     ["#", "#"],
// //   ],
// // ];
// // let steps = 1000000000000;
// // let blockIndex = 0;
// // let numBlocks = bloks.length;
// // let numjets = input.length;
// // let topIndex = 1;
// // let jetIndex = 0;

// // function colides(block, blockX, blockY) {
// //   return block.some((r, y) => {
// //     return r.some((state, x) => {
// //       return state == "#" && chamber[blockY + y][blockX + x] == "#";
// //     });
// //   });
// // }

// // function checkRepeat() {
// //   let l = topIndex - 1;
// //   let max = ~~(chamber.length / 2) - 5;
// //   let len = max;
// //   for (len; len > input.length / 5; len--) {
// //     let same = true;
// //     for (let i = 0; i < len; i++) {
// //       if (
// //         !chamber[l - i].every((el, ix) => el === chamber[l - (i + len)][ix])
// //       ) {
// //         same = false;
// //         break;
// //       }
// //     }
// //     if (same) {
// //       return len;
// //     }
// //   }
// //   return -1;
// // }
// // let repeatFound = false;
// // let repeatLength = 0;
// // let repeatNext = 0;
// // let repeatStep = 0;
// // let mult = 0;
// // while (steps--) {
// //   let block = bloks[blockIndex];
// //   let blockHeight = block.length;
// //   let blockY = topIndex + 3;
// //   let blockX = 3;
// //   while (blockY + blockHeight > chamber.length) {
// //     chamber.push(segment.slice());
// //   }

// //   while (true) {
// //     let jet = input[jetIndex++ % numjets] == "<" ? -1 : +1;
// //     if (!colides(block, blockX + jet, blockY)) blockX += jet;
// //     if (!colides(block, blockX, blockY - 1)) {
// //       blockY--;
// //     } else {
// //       block.forEach((r, y) => {
// //         r.forEach((state, x) => {
// //           if (state == "#") chamber[blockY + y][blockX + x] = state;
// //         });
// //       });
// //       topIndex = Math.max(blockY + blockHeight, topIndex);
// //       break;
// //     }
// //   }
// //   if (mult === 0) {
// //     if (!repeatFound) {
// //       let repeat = checkRepeat();
// //       if (repeat != -1) {
// //         repeatFound = true;
// //         repeatNext = topIndex + repeat;
// //         repeatLength = repeat;
// //         repeatStep = steps;
// //       }
// //     } else if (repeatNext == topIndex) {
// //       repeatStep = repeatStep - steps;
// //       mult = Math.floor(steps / repeatStep);
// //       let rest = steps % repeatStep;
// //       steps = rest;
// //     }
// //   }
// //   if (1000000000000 - steps == 2022) part1 = topIndex - 1;
// //   if (++blockIndex == numBlocks) blockIndex = 0;
// // }
// // part2 = topIndex - 1 + mult * repeatLength;
// // let time = performance.now() - startTime;
// // console.log(`Part 1: ${part1}\nPart 2: ${part2}\nTimer: ${time} ms`);

// let input = `                                                  ..................#..#..............................##.#......#...##..............#...........#.....
//                                                   ..........#..#...#....#.................#.#......#...##...............#.............#..#......#.....
//                                                   ........#..........#........#......#...#.........................#............#.....................
//                                                   ......................#......#..............#..........##...#.....................#.................
//                                                   ......#.......##..#.....#..........#.............................#.............................#....
//                                                   .........#..#.........#............#.#............#.....................#..#.#....................#.
//                                                   .......#.................................#................#...........#.....#.#...#..........#......
//                                                   ..#..................#..............#...#....................#....#.#......#......#...#............#
//                                                   ......#.........................#........##..#........#........#...#................#..#............
//                                                   .....#........................#....#.........#...........................#.....#....#..........#....
//                                                   #...........#....#...#..#..#.............#........................#............#...................#
//                                                   ..#...........##.................#........#.............#.........#.............................#...
//                                                   ......................##...#........#.............#....#.......#...........#.......#..#..........#..
//                                                   #...................#............#..#...............#............#......#....#.........#.#...#...#..
//                                                   ....................#......#...........#......................................................#.....
//                                                   .....#..............##....#.........#................#.....#......#................#................
//                                                   ..............#..#...#.#..#..#.........#..................#................#........................
//                                                   ..#...............##............................#.......................#....#....##...........#....
//                                                   .............##.................................#...#............................#..................
//                                                   .......#......#....#.............#......#.......#...#.....#..........#.....#...#....#....#..........
//                                                   ....#.....#........#.....#............#..................#..#....#.#........#.#...........#...#.....
//                                                   ........##.#........................#...........#......##.#.......#..#.....................#........
//                                                   ....................#...##.......................#.......#..#...............#...#...................
//                                                   ##.........#....#...#....#......#..#.................##......#.#...#.................##.............
//                                                   ...#.....#.....#............................#..........#...........................#................
//                                                   ...............#.....#.....#.#.....#................#......#......#.#.#................#..........#.
//                                                   ........#.............................#..........................#........#..#..............#.......
//                                                   ..........................#...#......#.........#.........#......#...............#....#..............
//                                                   ......#................................................#....#...#.#...........#...........#..#.....#
//                                                   ....................#........#......#..##.#..........................#....#.........................
//                                                   ..#.#.....###.........#...............#........##.......................................#......#...#
//                                                   ...............#.............................#......................................#..............#
//                                                   .#..#..#..#.#.........................................#....##....#..#.........#.....................
//                                                   ....#...............#.........#.....##......#.....................#......#.#..........#.............
//                                                   .......#..#.....................#............#....#.......#......#.........#.#...#.........#...#....
//                                                   ....................................................#............#....#......#.................#...#
//                                                   ..#....#........#.#.......#...#..#.............#.......#............#...#...........................
//                                                   ..#.......#.#.......##...................###...........................#...#.#......#....#........#.
//                                                   .................#...........#..#.#...#.................................#......#.....#....#.........
//                                                   #..........##.......##.##.................#.......#....#....#..#.........#.#...........#..#.........
//                                                   ...............#.......#....#............##...#.#.............#...##..............#.............#...
//                                                   ..........................##.................##....#...........##......##.#.#...#...#.............#.
//                                                   ..........................................##..........#.........###...##..#....................#....
//                                                   ..#.......#.................#..#..........#.........#......#.#...............#....##........#.......
//                                                   ...................#.........#.............#.....................#................#.##...#..........
//                                                   .............#.....#...#.......#....#........#......#......................#...#....................
//                                                   .....................................#.#.#...#..............#..#..........#...#.........#........#..
//                                                   .............#..................................#.....#.....#........#.........#..........#..##.....
//                                                   ...................#...........#.....#............#.##...###.............................#.......#..
//                                                   ......##.....#.........#.....#.....#...#..............#...............##..........#.................
//                                                   ...........................#................#.....
//                                                   ........#..................#........#..#..........
//                                                   ....................#.....#......#........##......
//                                                   ....#..........##..#.............#................
//                                                   .#..........................#..................#..
//                                                   .###.......#....##..........................#.....
//                                                   ..........#....#....#........#...........#....#...
//                                                   ..................#...#.........#....#............
//                                                   .......#......#.......#........#.....##...........
//                                                   ..#....#..............#.....#.....#.............#.
//                                                   ........#....................................#...#
//                                                   .#..............#......................##.........
//                                                   ......................#............#....#.....#...
//                                                   .........................#...........#...#........
//                                                   ..#...#.....#........#........#...#..............#
//                                                   .#...#...#.#..#.....#..#.#....................#...
//                                                   ...........##................#..##.........#......
//                                                   .........#..............#..........#.........#....
//                                                   .....................##............#..............
//                                                   ..#..........#........................##.........#
//                                                   ...............#.......#....###........#..........
//                                                   ..............#..#............#......#............
//                                                   ...#........#..#........#.#..##.....#.............
//                                                   ...#..#............#..........##..#...............
//                                                   .....................#............................
//                                                   ..#.....#.#....##.......##....#............##...#.
//                                                   .....#.....#.........#.......#........#...........
//                                                   ...........###.....#.....#.....#.............#..#.
//                                                   #..#.##........#.....#.##...#...#..............###
//                                                   ...............#.......#........#.......#....#...#
//                                                   .................#.......#.....................#..
//                                                   #..........#..........#.........#.................
//                                                   .....................#......#..........#..#.......
//                                                   .......#........#.#.......#..#....#.......#.......
//                                                   .##......##...#..............##........#.....#....
//                                                   ....#.....#..#...................................#
//                                                   ..#..###..........................#...............
//                                                   #..#................#.............................
//                                                   ............#..........#....#.....#...............
//                                                   ............#..#...........................#..#..#
//                                                   ..#.#................................#............
//                                                   ...............##..#..............................
//                                                   ..#..........#....................##.##.#.##......
//                                                   ......#.........##.............##..............#..
//                                                   ........#.....#..........#.......#...#............
//                                                   ..#................#................#..#....#.....
//                                                   #..#..#..............#..#...............##........
//                                                   ...................#..............#...#.#.........
//                                                   .......................................#..#.#.....
//                                                   ..#.....##..........#...#.....#...................
// .#.....#........................#...#............................................#.....##..#..#.....
// .........................#..#.....#................#.........#..#.......#..#.....#.......#...#....#.
// ...#..#......................#..........#.............#.#........#....#...............#.............
// ...............................#..............#.......##.......#....................#.#.............
// ..........#........#...#...#...##...........#..................#....#................#.#.........#..
// .#.....#.........................#..#...................#..#..................#....#.........#.#....
// .......#..#..........#................#......##............#......#..#..#.....#..#..........#.......
// .................#...................#.....#...........#.............#...................###....#...
// ...........#.....#...................#..................#........#.#.................#...........#..
// ........#..............................#............#....#..#...#...........#.#.#..............#....
// ............#....#.....#................................#...........#...........###............###..
// ................#...#...................................#....#..#..................#......#.........
// ...#................##....#....#.........##..............#...#..........#.#.......#..#......#.......
// ......#...................#...#.......#.............#.#...#....#.....#.#................#..........#
// .................#...#....#......#......................#.............#.......................#.#...
// ..........................#......#...........#.....#......#..........#.......#.................#..#.
// ...............#..#...............................#..............#......#.......#..................#
// ........#............#.............#.............#..............##.......#..##........#.........#...
// #................##.....#....#.............##.......#.#.......................##....................
// ..............#.##.................#.................#..#......................#..#.............#...
// ...................................#.................#...#.........#...............................#
// .#.......#..................#..........#.....#..............#.......#.....................#.........
// .......#.#..#........#.........................#.#..#............#..........#...............#.......
// ........................................#........#.##....................#...#.........#...#........
// ....##...##...#...........................#.#.......#..........#.....#...................#..##......
// ......#.#......#..............#............#...#......#........................#..#..#.......#..##..
// .#...#....#.......###..............##...........#.#.............#..........#...#...#................
// ..#.................#.....................#..#.................#......#..#...........#..............
// .#............#..............#.#....#..........#....#...#............................#......##..#.#.
// .........###.........#.........#............#........##....#..........#..........................#..
// ........#......#..##..............#...#..........##....#........#...................................
// .................#............#..............#............#...#.#...#..##......................#....
// .......#.................#.........................#...#.#.........#...........#.#........#....#....
// ............#...................................#..........#..................#......#..#...#.#.....
// .......................#..#...#........#..............#.......#..............#..#........#..........
// .....#.......................#...............................#..#.#.........#..........#............
// .#.......##......#..#...............#.......#....###.......#....#.........#....#..#.................
// .#.#.............................#...................##..................................#....#.#...
// ......................#.....#.#...........#...............#..............#......#.....#..........#..
// ..#.#.....#.....##.##........#.#.............#.....#...#.#........#.............#.#..#............#.
// ...........#.....#..............#.....................#..#.....................#...#......###...#...
// ............................##.......#.........................................................#....
// ...#.....................#..........................#..#.##..............#.....#....##.#.....#......
// .#.............#..#....#...#.......#.....#.##.......#........................................#...#..
// ........#.....#..............#...................#........#....#.##.#............#............#.....
// ...........................#..#............#.............#..........................#....#..........
// ......#.................#...#...#.......#......#....................................................
// ...................#..................................#................#.......#.....#.#.......#....
// ..........................#................#..........#.....##..##........................##...#.#..
// ......................#..#...#....##........................................#...#........#...#......
// ..............#..................###..#...........
// .......#...#..#..#...........................#....
// ..#.................#........#.#.....#......#.....
// .....#.............#......#.................#.....
// ........#..............#.................#.....#..
// .............#.#...#..............#...............
// .......#......#...................................
// .........##................................#......
// .#.....##.......................##..##..#.#.......
// .....#....#........#......#............#..........
// ........#..#.......#..............#......#........
// ...................#..............................
// .........#.#.......#.#....................#.......
// .............#.......#...##....#..#.#.............
// .....................#.#.#................#..#....
// ............................................#.....
// ....#.##.................#...#....##.#......#.....
// ..#.....#..........#.##......#.......#.....#......
// ..............#.....#.................##........#.
// ......................#....................#......
// #...............##.........#....#.........#..#....
// #..#...#.#..#....................##..#............
// ......#.......##..............##.#.....#.........#
// #..#........#..#.........#.#..#........#.......#..
// .#.................#..#.#............#...#........
// ..#....#........#..........#..............#......#
// ..#.#...........#.....#...........................
// ............#.............#...................#...
// #......##...................#...............#.....
// #.....#................................#..#.......
// ............##....................................
// #......#.#.......##..#.................#.......#..
// ......#.....#.........#.........#...#.............
// ...#.......#...............#............#..#.#....
// #..........#......................................
// ..................#...............................
// ................#....#..........#.....#...........
// ...........#...#.......#...................#..#...
// ................#....#.....##.......#.............
// ...........#..#................#..................
// .........#.#.#...#................................
// .....#....#...........#................#..........
// ........#.........#....#..............#.....#...#.
// .....##..............#......#............#........
// ....#..........#................##...##....#..#...
// ..........##.#......#..#....#.....................
// ...#........#.###.........#.......................
// ............#.......................#............#
// .........#......................#............##...
// ..........................................#....#..`;
// let inputPath =
//   "9R30L4R39R30R41L20L17R49L35L4L43L47R15L18L7L28L21R24R3L1L46L15R4R25R7R38R7L6L3R48R16R25R16R11L50L27R11R38R20L1L41R44L13L28R37L23R16R35R47R42L4R27L47R29R44L49R31R21R15L22R17L13R24R50L29R32R11L21L40R34R43R30R23L31L42L48R33R14L32L12R10R37R3R39R26R36R15L3R14L2R6L41L8R27L12R9R29R45R39L28R23L40R2L14R34R12L25L25L34L37L45R1L18L23L35R7R14L9L1R22R16L4R11L7L6R24L19R2R13R47L6L32L44L47R2L37R6L44R31R10R42R19R8L44R1L44R49L34L19L42L12R14L8R42L19R44R6L45L7R40R32L11L2L39L11R2L10R48R14L32L24R7R16R49R9R30L20R46R25L7L20L49L1R27R33R11R2R35L8L22R35L37L4L11R17R38L49R15R30L38R43L29L44L17L26L14R2L43R46L3R7R17R19L35R6L28L43L49L1L20R26L25L48L26R48L6R25R16R13R41L41R25R30R49L46R32L8R3L46L27L47L6L1L35R4L20R40L50L33R1L26R2R4L15L25L20R31R34L40L1R9R7R8L5R9L39R8R7L47L20R22R14R39R19R32R7R30R41L7L43L2L3L16R15R49L20L48L5L23L24R29R7R25R18L40R12L21L22L50L26L8R11L40L14R2L42L16L4L7L47L21L42L16R25L12R7R22R14L18L29R20R20L39R43L30L11R26L44R38R42R7R1L36L3L31R20R3R44L39R42R3R22L40L3R38R28L47R37R45L15R5R18R21R9L36R37R34L35R20R47R49L30R32R12R24R6L35L17L39R45R10R8R11R12L16L41R18L29L40R26L21R39L35R38R30L25R6R21L7R33R49R18R8R25R42R30R28R24R11L15R33L30L14L3R24L18R3R36L4R39R14L34R12L26R14L38R9R3R25R29L13L41L26L14R44L16L41R34R16L37R4L34L1L4R31R46L29R4L31R3R50L50L11L37R34R17R48R40L47L4L29R6L11L1L29R27R34R42R48L9L5L37R28R13R30L29L26R40L6R6L39L20R2R46L37L24R15L3L32L47R47R49L6L34L8R32L44L22L39L48R40L36L35R29R9L16R11R10L39R1L45L22L22R25L37L21R5R1R9L34L50L21L17L14L2L11R33L16R17L33R3L20R8R15L33L47L43L20L45L47R46L1R25L45R43R16L17L7R49R15R29L33R40R10L29L44L28R6R24R50R20L29L12R13L24L36R9L28L14L44R6R7R29L18L1R26R4R25L8R23R49L33L41R38L17R45L39R17L44L13L19R2L32R35L18R8R18R16R50R5L28R9L16R43L9L7R10R34L30L43R7R27L12L38R21L39L11L2R20R38L44R28R18L39R25L21R24R21L28R5R36L6R4R50R33L44L41L25R35R41R19L16R35R36R28L35R19R41R20R21L4L29L10L33L7L9L23L49L32L30R49R42L9L17L32L45L5L31L24L27R34L9R48L2R41R10R27L20R44R33L19L38L45R40L26R41L38R42R13R36L6L9R50L41L19R11R44R2R31L27R23R16L26R1R50R35R21R40L4L15L7R18R41R35R33R22L4R11L25R13L30L30L41L34R9L17L13R37R42L15L40L33L46R9L50R45R43R8L41L11R4R11R26R15L8L45L30R12R28R18L8R8L41L43R1L38L4R49L8R19L46L25R27L19R47R21R26L12L33L16R39R15L24R22R43R10R37L26L15L28L47L36L19L20R3R4R19L45R15R32R7L25L48L1R4L29L32R2R34L11R21L11L18L38R21L11R7L31R1R43R40L28R1L40L21R38R29L17R3L50L45L13R40R37L32L28L18R43L25L41R3L43R25R20R22L48R38R15L17L27R4L12R50R37R37L16L1R16L14R40R13L20L49L23R13R46L7R9R22R9L10R35R17L18R14L25L12L4R40R46L28L17L20L16L16L23R7L28R29R40R28R16L43L12R26L29R23R1R49R31R17R32L19R16R29L33L11R9R4R27R13R44R19L46R41R16R32L2R15L10R32R19R19R29R25L43R24L49R26L23R10L43L1L27L43L42R34R20R44R6R32R27R23L47L24L5R44R44R18R42R34R11L27R29R29L8L32R27L12L24L30L32L33R43R36R33L6L6L19L42R25R24R4R50R44R25R24L15L12R42R44R38L30L3L16L29R24R9L7L31R2R13L44R36L39L35R20L47R41R42L5L20L34L25R43L32L41L23R6R23L27L27L10L45R6R10R46L30R33R47R46L29L49R38L38L34L19R38R30L7L43R17R20R3R13R14R20R20L21R18R30L7L15L5R43L25L50R34L33R34L2R45L47L34R3L48L17L26L40R19R19L50R25L11L25R17L28L48R10L3L44R39L9R49L13R12L3R8L2L11L42L29L10R49R20L34R26R48R12L47R13L29L32L28R34L28L2R19L42R5R13R3L44R50R2L16R41R4L3L10R30R17L35L4R50R49R9R39L22L34R27R46R29L9R34R34L43R10R9R11R48R11R29R35R21R43L22L8L45L19L42R22L18R43L32R22L16R19L31R47L34R46L50R48R48L49L46L42L38L17L45R23R19L36L2L23L33R47R4L12R41R48L49L5L22L26R31R1L10L14L21R17R43L30R32L11R11R23L44L13L32L15R25L2L15R47L23L34L15L44L34R27R33R18L42R48R30L3L38R21R5R31R43R9L38L15L20L6R4R23R31L10L36R36R26R20L5L28L49R18R45R5R44L42R37R37R49R43R43L14L24R26L28R36L15L29R50R49L6R3R43L14L3R23L36L39L34R41L6L10L29R20R38L34R18L36R18L6L36R17L11R33L22R3L46L48L42R49R37L5R46R26R18L48R45L14R46R41L13L48L26R15L50R42R38R22R11R32R41L35L5L29R36R45L6R18L22R40L16R25R46R36R25R17R48R42L31R18R13R10R31L36L25R7L36L29R34L19L26L19R35R33R3R30R39L49R24L12R33L2L27R38L26L10L2L9R1R18L33R10R37R16L1L21L39L18R21L12L33L18L13R37L16R48L38L37R35R16L43R14R44R12R32L46R13R42L5R20R27R3R4R29L6L49R33L49L13L20R24R12L44L44L21R17R27R29L15L14R21R13L7L11L4L24R48L40R16L46R47R49L1L50R13R25R41R49R1R36R47R24R42R14R31L18L18R45R38L47L29R19L30R38L14L40L44L18L42R26R28L1R47R45R27R7L45R7L4L45L19L50R11R32R4R41R19L20L21L27R9L29R23R17R47R15L42R31R49L12R47R9R41R24L19R32L14L14L18R12R19R11R31R23L10R10R41L3R24L26R41R25L15R2R8L48L31R9L2R21L33R36R33L44R27R10L21L48L2L50L7R32R6R31L17R16L27L10R9L3R35L49R37L4R33R3R46L16R10R44R44L27L31R18L43R48L29R31R17R46R6R4R35R2R24R31L3R47R13R22R37R5L13L49L36L35R46R1L44R28L30R42R31L30R1R32R42L25R18L2R4L8R27L45L19L9L35R15L44R36L1L23R28L12L6R2R12L17L2R29R11L14R19R18R19R26L44R15L27R4L10L3L47L23L17L19R42L3L16L23L12L8L27L50L27R17R19L29R31R14L40L31R32L40L16L42R7L36R27R34L47R40R46L22L26L26L15R46R20L25R2R49L48R11R14R25L50L1R50R45R7L44R32R21L43L46R10R11R46R30L30L30R44L24L34L3L6R48R34L38R50L1L25L13R28L45R23R4L26L10L45R14L20R42R27L2L34R44L41L33R7L11L45R10R49L11L6R8L1L31L27L25R1R44R23L11R42L4L7L27L50R29R1R17L46L28R19L5L50L26L16R27R20L17L44R17R40L5L34L47L23L6L48R46R39R17R14L14R31R34R39R42L4L31L46L38L3L39L21L27L16L34L33R32R15R29R8L46R19L10R10R12L22R29R40R50L42R15L28L33R45R45L42L29R30R31L23L5R2L26L1R47R17R49L25R29L38R45L16L37R44R44R39L32L1L36L23R13R49L3R49R3L3L44L41L47L28L4R39R48L21R13L36R44R40R35R8R28R15R17R50L19R31L11R46R32R44R3R8L11L3R19R29R22L24R28R18R40L7L19R27R20L32R14R23L30L40R47R48R14L42R49L13R29R11R42R40L12R50L30L8L16L19R44L4L1R16R36R39L1L50R30L19L27L49L17L3L47L1L8L37R8L28R7R4L29R5L42L47L33L32R19R28L44L11L23R32L39L29R18R35R9L50R35R31R25L25R33L1R26R22L37L31L39R5R45L11R45L9L4L2R22L31R38R1R22L26R13R33R44R21L15L1R15R45L41R18L24L32R48L27L8R14R1L7R32L50R38R14R18L42L36R3R29L40L24L3R12R1L30R2L28L34R49R5R3R25R1R28L10R33L48L36L27R5L22R21R1R20L33R50L17R10L43L30R8L42R17L14R7L22R20L29R12L37L30R13L3R1L1R28L28R29L48R6L8L9L50R39R13L45L8L45L6L20R33L24R5L7L47R6L27";
// let map = [],
//   cols = false,
//   rows,
//   size;
// let pos = { row: 0, col: 0, dir: ">" };

// const inc = { ">": [1, 0], v: [0, 1], "<": [-1, 0], "^": [0, -1] };
// const dirValue = { ">": 0, v: 1, "<": 2, "^": 3 };
// const rotate = {
//   L: { ">": "^", v: ">", "<": "v", "^": "<" },
//   R: { ">": "v", v: "<", "<": "^", "^": ">" },
// };

// const val = (pos) =>
//   (pos.row + 1) * 1000 + (pos.col + 1) * 4 + dirValue[pos.dir];
// const mapVal = (pos) => map[pos.row][pos.col];
// const sideVal = (pos) =>
//   sideMap[Math.floor(pos.row / size)][Math.floor(pos.col / size)];

// // this can definitely be simplified / made a lot more generic ¯\_(ツ)_/¯
// const nextPosP2 = (p) => {
//   let i = inc[p.dir];
//   let pos = { ...p };

//   let sideFrom = sideVal(p);

//   pos.row += i[1];
//   pos.col += i[0];

//   // check bounds as well
//   let sideTo =
//     pos.row < 0 || pos.col < 0 || pos.row >= rows || pos.col >= cols
//       ? undefined
//       : sideVal(pos);

//   // no transition
//   if (sideTo == sideFrom) return pos;

//   // naturally supported transitions
//   if (sideTo) return pos;

//   // and now the fun part, this is tied to the specific shape of the cube map, check the image in the repo for better understanding
//   // possible todo: locate sideFrom and sideTo on the minimap, use their col, row indices to replace the 50, 100, 150 numbers below
//   if (sideFrom == 1 && pos.dir == "^") {
//     // 1 to 6
//     pos.dir = ">";
//     pos.row = 150 + p.col - 50;
//     pos.col = 0;
//   } else if (sideFrom == 1 && pos.dir == "<") {
//     // 1 to 4
//     pos.dir = ">";
//     pos.row = 100 + 49 - p.row;
//     pos.col = 0;
//   }

//   if (sideFrom == 2 && pos.dir == "^") {
//     pos.col = p.col - 100;
//     pos.row = 199;
//   } else if (sideFrom == 2 && pos.dir == ">") {
//     // 2 to 5
//     pos.dir = "<";
//     pos.col = 99;
//     pos.row = 100 + 49 - p.row;
//   } else if (sideFrom == 2 && pos.dir == "v") {
//     pos.dir = "<";
//     pos.col = 99;
//     pos.row = p.col - 100 + 50;
//   }

//   if (sideFrom == 3 && pos.dir == ">") {
//     // 3 -> 2
//     pos.dir = "^";
//     pos.col = p.row - 50 + 100;
//     pos.row = 49;
//   } else if (sideFrom == 3 && pos.dir == "<") {
//     // 3 -> 4
//     pos.dir = "v";
//     pos.col = p.row - 50 + 0;
//     pos.row = 100;
//   }

//   if (sideFrom == 4 && pos.dir == "<") {
//     // 4 -> 1
//     pos.dir = ">";
//     pos.col = 50;
//     pos.row = 149 - p.row;
//   } else if (sideFrom == 4 && pos.dir == "^") {
//     // 4 -> 3
//     pos.dir = ">";
//     pos.col = 50;
//     pos.row = p.col + 50;
//   }

//   if (sideFrom == 5 && pos.dir == ">") {
//     // 5 -> 2
//     pos.dir = "<";
//     pos.col = 149;
//     pos.row = 149 - p.row;
//   } else if (sideFrom == 5 && pos.dir == "v") {
//     // 5 -> 6
//     pos.dir = "<";
//     pos.col = 49;
//     pos.row = p.col - 50 + 150;
//   }

//   if (sideFrom == 6 && pos.dir == "v") {
//     // 6 to 2
//     pos.col = p.col + 100;
//     pos.row = 0;
//   } else if (sideFrom == 6 && pos.dir == ">") {
//     // 6 -> 5
//     pos.dir = "^";
//     pos.col = p.row - 150 + 50;
//     pos.row = 149;
//   } else if (sideFrom == 6 && pos.dir == "<") {
//     // 6 -> 1
//     pos.dir = "v";
//     pos.col = p.row - 150 + 50;
//     pos.row = 0;
//   }

//   return pos;
// };

// const nextPosP1 = (p) => {
//   let i = inc[p.dir];
//   let pos = { ...p };
//   const step = () => {
//     pos.row += i[1];
//     pos.col += i[0];
//     if (pos.col >= cols) pos.col = 0;
//     if (pos.row >= rows) pos.row = 0;
//     if (pos.col < 0) pos.col = cols - 1;
//     if (pos.row < 0) pos.row = rows - 1;
//   };
//   step();
//   while (mapVal(pos) == undefined) step();
//   return pos;
// };

// const move = (steps, nextPos) => {
//   while (mapVal(nextPos(pos)) == "." && steps) {
//     steps--;
//     pos = nextPos(pos);
//   }
// };

// const genSideMap = () => {
//   let div = rows > cols ? [3, 4] : [4, 3]; // cols, rows
//   size = cols / div[0];
//   let miniMap = Array.from({ length: div[1] }, () => Array(div[0])),
//     side = 1;
//   for (let row = 0; row < div[1]; row++)
//     for (let col = 0; col < div[0]; col++)
//       if (map[row * size][col * size] != undefined) miniMap[row][col] = side++;
//   return miniMap;
// };

// const run = (nextPosFnc) => {
//   pos = { dir: ">", col: map[0].indexOf("."), row: 0 };
//   for (let i = 0; i <= forwards.length + rotations.length - 1; i++) {
//     if (i % 2 == 0) move(forwards[i / 2], nextPosFnc);
//     if (i % 2 == 1) pos.dir = rotate[rotations[(i - 1) / 2]][pos.dir];
//   }
//   return val(pos);
// };

// input.split("\n").map((line, row) => {
//   cols = Math.max(cols, line.length);
//   let tmp = Array(cols);
//   line.split("").forEach((v, col) => {
//     if ([".", "#"].includes(v)) tmp[col] = v;
//   });
//   map.push(tmp);
// });

// rows = map.length;

// let forwards = inputPath.match(/\d+/g).map(Number);
// let rotations = inputPath.match(/[RL]/g);
// let sideMap = genSideMap();

// console.log(run(nextPosP1)); // p1
// console.log(run(nextPosP2)); // p2

// day 23
// const fs = require("fs");

const input = fs.readFileSync("day_23_input.txt", "utf8").trimEnd();

const neighbors = [
  [-1, -1],
  [-1, 0],
  [-1, 1],
  [0, -1],
  [0, 1],
  [1, -1],
  [1, 0],
  [1, 1],
];

const addProposal = [
  (map, x, y, proposals) => {
    if (!map[y - 1]?.[x] && !map[y - 1]?.[x - 1] && !map[y - 1]?.[x + 1]) {
      return proposals.push([[x, y].join(), [x, y - 1].join()]);
    }
  },
  (map, x, y, proposals) => {
    if (!map[y + 1]?.[x] && !map[y + 1]?.[x - 1] && !map[y + 1]?.[x + 1]) {
      return proposals.push([[x, y].join(), [x, y + 1].join()]);
    }
  },
  (map, x, y, proposals) => {
    if (!map[y - 1]?.[x - 1] && !map[y][x - 1] && !map[y + 1]?.[x - 1]) {
      return proposals.push([[x, y].join(), [x - 1, y].join()]);
    }
  },
  (map, x, y, proposals) => {
    if (!map[y - 1]?.[x + 1] && !map[y][x + 1] && !map[y + 1]?.[x + 1]) {
      return proposals.push([[x, y].join(), [x + 1, y].join()]);
    }
  },
];

function solve(input, part) {
  const map = input
    .split("\n")
    .map((line) => line.split("").map((char) => +(char === "#")));
  const nElves = map.flat().filter(Boolean).length;

  let round = 0;
  while (part === 2 || round < 10) {
    round++;
    let proposals = [];
    for (let y in map) {
      y = +y;
      for (let x in map[y]) {
        x = +x;
        if (map[y][x]) {
          if (neighbors.every(([dx, dy]) => !map[y + dy]?.[x + dx])) {
            continue;
          }
          for (let i = round; i < round + 4; i++) {
            if (addProposal[(i - 1) % 4](map, x, y, proposals)) {
              break;
            }
          }
        }
      }
    }

    const counts = proposals.reduce((acc, [from, to]) => {
      acc[to] = (acc[to] ?? 0) + 1;
      return acc;
    }, {});

    proposals = proposals.filter(([from, to]) => counts[to] === 1);

    if (!proposals.length) {
      break;
    }

    for (let [from, to] of proposals) {
      const [x1, y1] = from.split(",").map(Number);
      const [x2, y2] = to.split(",").map(Number);
      map[y1][x1] = 0;
      map[y2] = map[y2] ?? [];
      map[y2][x2] = 1;
    }
  }

  if (part === 2) {
    console.log(round);
  } else {
    let yMin = 0;
    let yMax = 0;
    let xMin = 0;
    let xMax = 0;
    for (let y in map) {
      y = +y;
      for (let x in map[y]) {
        x = +x;
        if (map[y][x]) {
          yMin = Math.min(y, yMin);
          yMax = Math.max(y, yMax);
          xMin = Math.min(x, xMin);
          xMax = Math.max(x, xMax);
        }
      }
    }
    console.log((yMax - yMin + 1) * (xMax - xMin + 1) - nElves);
  }
}
solve(input, 1);
solve(input, 2);
