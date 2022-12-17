# import timeit

# rocks = [[(0,0), (1,0), (2,0), (3,0)],        # horiz line
#          [(0,1), (1,1), (2,1), (1,0), (1,2)], # plus
#          [(0,0), (1,0), (2,0), (2,1), (2,2)], # backwards L
#          [(0,0), (0,1), (0,2), (0,3)],        # vert line
#          [(0,0), (0,1), (1,0), (1,1)]]        #square

# def get_rock_width(rock):
#     width = 0
#     for coord in rock:
#         width = max(width, coord[0]) 
#     return width + 1

# def check_collision(tower, rock, rockleft, rockbottom, towerbottom, rockwidth):
#     if rockbottom < towerbottom:
#         return True
#     if rockleft < 0 or rockleft + rockwidth > 7:
#         return True
#     for coord in rock:
#         if (coord[0] + rockleft, coord[1] + rockbottom) in tower:
#             return True
#     return False

# def print_tower(tower, towerheight):
#     h = towerheight + 5
#     w = 7
#     grid = [['.' for x in range(w)] for y in range(h)]
#     for key in tower:
#         grid[key[1]][key[0]] = "#"
#     for y in range(len(grid)-1, -1, -1):
#         s = "".join(grid[y])
#         print(str(y), s)
#     print()

# def print_tower_rock(tower, rock, rockbottom, rockleft, towerheight):
#     h = towerheight + 8
#     w = 7
#     grid = [['.' for x in range(w)] for y in range(h)]
#     for coord in rock:
#         grid[coord[1]+rockbottom][coord[0]+rockleft] = "@"
#     for key in tower:
#         grid[key[1]][key[0]] = "#"
#     for y in range(len(grid)-1, -1, -1):
#             print(*grid[y])
#     print()

# def run():
#     wind = open('input_day_17.txt', 'r').read().rstrip()

#     # Part 1
#     windpos = 0
#     newrock = 0
#     tower = set()
#     MAX_ROCKS = 1000000000000
#     rockcount = 0
#     towerheight = 0
#     towerbottom = 0
#     while rockcount < MAX_ROCKS:
#         rock = rocks[newrock]
#         w = get_rock_width(rock)
#         rockbottom = towerheight + 3 
#         rockleft = 2
#         moving = True
#         while moving:
#             #print_tower_rock(tower, rock, rockbottom, rockleft, towerheight)
#             # move rock. First, jet of gas
#             oldrockleft = rockleft
#             if wind[windpos] == ">":
#                 rockleft += 1
#             elif rockleft > 0:
#                 rockleft -= 1
#             if check_collision(tower, rock, rockleft, rockbottom, towerbottom, w): #whoops
#                 rockleft = oldrockleft
#             windpos = (windpos + 1) % len(wind)
#             # then fall
#             rockbottom -= 1
#             if check_collision(tower, rock, rockleft, rockbottom, towerbottom, w):
#                 rockbottom += 1
#                 moving = False
#                 for coord in rock:
#                     tower.add((coord[0] + rockleft, coord[1] + rockbottom))
#                     towerheight = max(towerheight, coord[1] + rockbottom + 1)
#         newrock = (newrock + 1) % 5
#         rockcount += 1

#     #print_tower(tower, towerheight)
#     print("pt 1:", towerheight )

#     # Part 2

#     windpos = 0
#     newrock = 0
#     tower = set()
#     MAX_ROCKS = 1000000000000
#     # calculated input file baselines for rockcount and starting tower height based on 
#     # observed repeating tower heights every 345*5=1725 times through the input length of 10091
#     rockcount = 999995899800
#     towerheight = 1524631429840
#     towerbottom = 1524631429840

#     # calculated test file baselines for rockcount and starting tower height based on 
#     # observed repeating tower heights every 7 times through the input length of 40
#     #rockcount = 999999999880
#     #towerheight = 1514285714104
#     #towerbottom = 1514285714104
    
#     lastheight = 0
#     while rockcount < MAX_ROCKS:
#         rock = rocks[newrock]
#         w = get_rock_width(rock)
#         rockbottom = towerheight + 3
#         rockleft = 2
#         moving = True
#         while moving:
#             #print_tower_rock(tower, rock, rockbottom, rockleft, towerheight)
#             # move rock. First, jet of gas
#             oldrockleft = rockleft
#             if wind[windpos] == ">":
#                 rockleft += 1
#             elif rockleft > 0:
#                 rockleft -= 1
#             if check_collision(tower, rock, rockleft, rockbottom, towerbottom, w): #whoops
#                 rockleft = oldrockleft
#             windpos = (windpos + 1) % len(wind)
#             # then fall
#             rockbottom -= 1
#             if check_collision(tower, rock, rockleft, rockbottom, towerbottom, w):
#                 rockbottom += 1
#                 moving = False
#                 for coord in rock:
#                     tower.add((coord[0] + rockleft, coord[1] + rockbottom))
#                     towerheight = max(towerheight, coord[1] + rockbottom + 1)
#         newrock = (newrock + 1) % 5
#         rockcount += 1

#     print("pt 2:", towerheight )

# if __name__ == "__main__":
#     print("\nDay 17: Pyroclastic Flow")
#     starttime = timeit.default_timer()
#     run()
#     print("elapsed time: %fms\n" % ((timeit.default_timer()-starttime)*1000))


from __future__ import annotations
 
from itertools import chain
from itertools import cycle
from itertools import repeat
 
 
def parse_input(filepath) -> str:
    with open(filepath, "r") as f:
        return f.read().strip()
 
 
class Rock:
    def __init__(self):
        self.coordinates = set()
 
    def __str__(self):
        return f"{self.__class__.__name__}({self.coordinates})"
 
    def __repr__(self):
        return str(self)
 
    def max_height(self):
        max_height = 0
        for coordinate in self.coordinates:
            max_height = max(max_height, coordinate.imag)
        return max_height
 
    def move_left(self) -> Rock:
        rock = Rock()
        for coordinate in self.coordinates:
            rock.coordinates.add(coordinate + complex(-1, 0))
        return rock
 
    def move_right(self) -> Rock:
        rock = Rock()
        for coordinate in self.coordinates:
            rock.coordinates.add(coordinate + complex(1, 0))
        return rock
 
    def move_down(self) -> Rock:
        rock = Rock()
        for coordinate in self.coordinates:
            rock.coordinates.add(coordinate + complex(0, -1))
        return rock
 
    @classmethod
    def flat(cls, start_x, start_y) -> Rock:
        rock = Rock()
        initial_configuration = [
            complex(0, 0),
            complex(1, 0),
            complex(2, 0),
            complex(3, 0),
        ]
        for position in initial_configuration:
            position += complex(start_x, start_y)
            rock.coordinates.add(position)
        return rock
 
    @classmethod
    def cross(cls, start_x, start_y):
        rock = Rock()
        initial_configuration = [
            complex(1, 0),
            complex(0, 1),
            complex(1, 1),
            complex(2, 1),
            complex(1, 2),
        ]
        for position in initial_configuration:
            position += complex(start_x, start_y)
            rock.coordinates.add(position)
        return rock
 
    @classmethod
    def corner(cls, start_x, start_y):
        rock = Rock()
        initial_configuration = [
            complex(0, 0),
            complex(1, 0),
            complex(2, 0),
            complex(2, 1),
            complex(2, 2),
        ]
        for position in initial_configuration:
            position += complex(start_x, start_y)
            rock.coordinates.add(position)
        return rock
 
    @classmethod
    def tall(cls, start_x, start_y):
        rock = Rock()
        initial_configuration = [
            complex(0, 0),
            complex(0, 1),
            complex(0, 2),
            complex(0, 3),
        ]
        for position in initial_configuration:
            position += complex(start_x, start_y)
            rock.coordinates.add(position)
        return rock
 
    @classmethod
    def square_rock(cls, start_x, start_y):
        rock = Rock()
        initial_configuration = [
            complex(0, 0),
            complex(1, 0),
            complex(0, 1),
            complex(1, 1),
        ]
        for position in initial_configuration:
            position += complex(start_x, start_y)
            rock.coordinates.add(position)
        return rock
 
 
class Cave:
    rock_shapes = (Rock.flat, Rock.cross, Rock.corner, Rock.tall, Rock.square_rock)
 
    def __init__(self, width: int, moves: str):
        self.moves = moves  # <><><<<>><>
        self.width = width
        self.rock_shapes_index = 0
        self.height = 1
        self._drop_height = 3
        self.start_x = 2
        self.rock_positions = set()
        self.jet_generator = chain.from_iterable(zip(cycle(self.moves), repeat(None)))
 
    @property
    def start_y(self):
        return self.height + self._drop_height
 
    def get_next_rock(self) -> Rock:
        r = self.rock_shapes[self.rock_shapes_index](self.start_x, self.start_y)
        self.update_rock_shape_index()
        return r
 
    def update_rock_shape_index(self):
        self.rock_shapes_index = (self.rock_shapes_index + 1) % len(self.rock_shapes)
 
    def clear_of_collision_check(self, rock: Rock) -> bool:
        if self.rock_positions & rock.coordinates:
            return False
        else:
            for coordinate in rock.coordinates:
                if (coordinate.real == -1) or (coordinate.real == self.width):
                    return False
                if coordinate.imag == 0:
                    return False
        return True
 
    def drop_rock(self):
        rock = self.get_next_rock()
 
        for direction in self.jet_generator:
            match direction:
                case "<":
                    next_position = rock.move_left()
                    if self.clear_of_collision_check(next_position):
                        rock = next_position
                case ">":
                    next_position = rock.move_right()
                    if self.clear_of_collision_check(next_position):
                        rock = next_position
                case _:
                    next_position = rock.move_down()
                    if self.clear_of_collision_check(next_position):
                        rock = next_position
                    else:
                        self.rock_positions.update(rock.coordinates)
                        height_diff = rock.max_height() + 1 - self.height
                        self.height = max(self.height, rock.max_height() + 1)
                        return 0 if height_diff < 1 else height_diff
 
 
def find_pattern(heights: list[int]):
    max_pattern_length = len(heights) // 2
    for pattern_length in range(2, max_pattern_length):
        for i in range(0, len(heights) - pattern_length):
            window = heights[i : i + pattern_length]
            duplicates = 0
            next_start = i + pattern_length
            next_stop = next_start + pattern_length
            while window == heights[next_start:next_stop]:
                duplicates += 1
                if duplicates >= 3:
                    return i, window
                next_start, next_stop = (
                    next_start + pattern_length,
                    next_stop + pattern_length,
                )
 
 
def part_one(filepath) -> int:
    moves = parse_input(filepath)
    cave = Cave(width=7, moves=moves)
    for i in range(2022):
        cave.drop_rock()
    return int(cave.height - 1)
 
 
def part_two(filepath) -> int:
    moves = parse_input(filepath)
    height_changes = []
    cave = Cave(width=7, moves=moves)
    for i in range(20000):
        height_changes.append(int(cave.drop_rock()))
 
    start, window = find_pattern(height_changes)
    print(f"start: {start}\twindow length: {len(window)}")
    left = sum(height_changes[:start])
    middle, right = divmod(1000000000000 - start, len(window))
    middle = middle * sum(window)
    right = sum(window[:right])
 
    return int(left + middle + right)


print(part_two('input_day_17.txt'))