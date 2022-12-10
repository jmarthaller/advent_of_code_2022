// import path from "path";
// import fs from "fs";
const fs = require("fs");

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

let arr = fs
  .readFileSync("day_10_input.txt", "utf8")
  .toString()
  .trim()
  .split("\n");
// .split("\n\n");

// let arr = syncReadFile("./input.txt");
// sample.txt expects 13140 as answer for part 1
// sample.txt expects something rendered as answer for part 2

arr = arr.map((item) => {
  return item.split(" ");
});

let map = new Map();
let cycleCount = 1;
let x = 1;

// creating the map
arr.forEach((item) => {
  let [action, addValue] = item;
  addValue = parseInt(addValue);

  if (action === "noop") {
    map.set(cycleCount, x);
    cycleCount++;
  } else {
    map.set(cycleCount, x);
    cycleCount++;
    map.set(cycleCount, x);
    x += addValue;
    cycleCount++;
  }
});

//part1
let start = 20;
let commonDiff = 40;
let sum = 0;

for (let i = start; i <= cycleCount; i = i + commonDiff) {
  sum += map.get(i) * i;
}

console.log("part1 >> ", sum);

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
