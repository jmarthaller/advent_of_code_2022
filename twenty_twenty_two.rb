#! /usr/bin/env ruby

# day one
# calorie_list = File.readlines 'calorie_list.rb' 
# def find_most_calories(list)
#     each_elf_backpack_arr = []
#     individual_elf_pack = 0
#     list.each do |calorie|
#         if calorie.length == 1
#             each_elf_backpack_arr.push(individual_elf_pack)
#             individual_elf_pack = 0
#         else
#             individual_elf_pack += calorie.to_i
#         end
#     end
#     max_value = each_elf_backpack_arr.max(3).reduce(:+)
#     return max_value
# end
# puts find_most_calories(calorie_list)

# day two 
# moves_list = File.readlines 'strategy_list.rb' 
# def calculate_score(list)
#     total_score = 0
#     list.each do |round|
#         splitted = round.split(" ")
#         round_moves = splitted[0] + "-" + splitted[1]
#         ### first round conditional logic 
#         # case round_moves
#         # when "A-X"
#         #     total_score += 4 
#         # when "A-Y"
#         #     total_score += 8 
#         # when "A-Z"
#         #     total_score += 3 
#         # when "B-X"
#         #     total_score += 1 
#         # when "B-Y" 
#         #     total_score += 5 
#         # when "B-Z"
#         #     total_score += 9 
#         # when "C-X"
#         #     total_score += 7 
#         # when "C-Y"
#         #     total_score += 2 
#         # when "C-Z"
#         #     total_score += 6 
#         # else
#         #     invalid_input += 1
#         # end
#         ### second round conditional logic
#         case round_moves
#         when "A-X"
#             total_score += 3 #
#         when "A-Y"
#             total_score += 4 #
#         when "A-Z"
#             total_score += 8 #
#         when "B-X"
#             total_score += 1 #
#         when "B-Y" 
#             total_score += 5 #
#         when "B-Z"
#             total_score += 9 #
#         when "C-X"
#             total_score += 2 #
#         when "C-Y"
#             total_score += 6 #
#         when "C-Z"
#             total_score += 7 #
#         else
#             puts "invalid move"
#         end
#     end
#     return total_score
# end
# puts calculate_score(moves_list)

# day 3 
# rucksack_list = File.readlines 'rucksack_list.rb'
# def find_priority_score(rucksack)
#     score = 0
#     rucksack.each do |sack|
#         first_half = sack[0, sack.size.to_f / 2]
#         second_half = sack[-(sack.size.to_f / 2) - 1, sack.size - 1]
#         common_letter = first_half.split("") & second_half.split("")
#         char_points = common_letter[0].ord
#         if char_points > 96 
#             score += char_points - 96
#         elsif char_points < 91
#             score += char_points - 38
#         end

#     end
#     return score
# end
# puts find_priority_score(rucksack_list)

# def locate_badge_score(rucksack)
#     score = 0
#     rucksack.each_slice(3) do |sack|
#         common_letter_points = (sack[0].split("") & sack[1].split("") & sack[2].split(""))[0].ord
#         if common_letter_points > 96 
#             score += common_letter_points - 96
#         else
#             score += common_letter_points - 38
#         end
#     end
#     return score
# end
# puts locate_badge_score(rucksack_list)


# day 4
# assignments = File.readlines 'assignment_list.rb'
# def rearrange_assignments(list)
#     count = 0

#     list.each_with_index do |assignment, idx|
#         splitted = assignment.split(",")
#         first_asst = splitted[0].split("-")
#         second_asst = splitted[1].split("-")

#         if (first_asst[0].to_i..first_asst[1].to_i).include?(second_asst[0].to_i)
#             count += 1
#         elsif (second_asst[0].to_i..second_asst[1].to_i).include?(first_asst[0].to_i)
#             count += 1
#         end
#     end

#     return count
# end
# puts rearrange_assignments(assignments)


# day 5
rearrangements = File.readlines 'rearrangement_list.rb'
# require 'net/http'
# require 'uri'

# uri = URI.parse('https://gist.githubusercontent.com/matass/82a9650befe14104f2bb5766cbbcf848/raw/12b86f119502585c88daa5fc2b2e87d3f4424b40/day_5')

# request = Net::HTTP::Get.new(uri)
# response = Net::HTTP.start(uri.hostname, uri.port, { use_ssl: uri.scheme == 'https' }) { |http| http.request(request) }

# mapped_data = response.body.each_line.take(8).each_with_object({}) do |item, memo|
#     arrays = item.chars.each_slice(4).map(&:join)

#     (1..9).each do |counter|
#       memo[counter] ||= []
#       memo[counter].unshift(arrays[counter - 1][1]) unless arrays[counter - 1][1] == ' '
#     end
# end

# mapped_movers = response.body.each_line.drop(10).each_with_object([]) do |item, memo|
#     memo << item.split.map(&:to_i).delete_if(&:zero?)
# end

# mapped_movers.each do |mover|
#     move, from, to = mover

#     mapped_data[from].pop(move).reverse.each { |item| mapped_data[to] << item }
#     # for second part remove `reverse`
# end

# result = (1..9).each_with_object([]) { |item, memo| memo << mapped_data[item].last }.join

# pp result
# "SPFMVDTZT"

# def report_rearrangements(list)
#     original_arrangment = list[0..7]
#     new_arr =  Array.new(9, "")
#     original_arrangment.each do |row|
#         row.each_char.with_index do |item, idx|
#             if (item != " " and item != "[" and item != "]" and item != "\n")
#                 if idx == 1
#                     new_arr[0] += item
#                 elsif idx == 5
#                     new_arr[1] += item
#                 elsif idx == 9
#                     new_arr[2] += item
#                 elsif idx == 13
#                     new_arr[3] += item
#                 elsif idx == 17
#                     new_arr[4] += item
#                 elsif idx == 21
#                     new_arr[5] += item
#                 elsif idx == 25
#                     new_arr[6] += item
#                 elsif idx == 29
#                     new_arr[7] += item
#                 elsif idx == 33
#                     new_arr[8] += item
#                 end
                
#             end
#         end
#     end
#     puts "#{new_arr}"
#     commands_arr = list[10..-1]
#     commands_arr.each_with_index do |command, idx|
#         num_to_move = command.split("move ")[1].split(" from")[0].to_i
#         from_column = command.split("from ")[1].split(" to")[0].to_i - 1
#         to_column = command.split("to ")[1].to_i - 1
#         sliced_letters = new_arr[from_column].slice(num_to_move  * -1, new_arr[from_column].length).reverse
#         puts "------------------------------------------"
#         puts command
#         puts "NUM TO MOVE #{num_to_move}"
#         puts "FROM COLUMN #{from_column}"
#         puts "TO COLUMN #{to_column}"
#         puts "#{new_arr}"
#         puts "== #{idx} =="
#         puts "------------------------------------------"
#         new_arr[to_column] += sliced_letters
#         new_arr[from_column] = new_arr[from_column].delete!(sliced_letters)

#     end
#     puts "#{new_arr}"
# end

# report_rearrangements(rearrangements)


# day 6
# packets = File.readlines 'packet_data.rb'
# def find_first_marker(list)
#   first_packet = 0

#   i = 13
#   j = 0
#   while i < list[0].length do
#     backward_slice = list[0][j..i].split("").uniq

#     if backward_slice.length == 14
#         first_packet = i
#         break
#     end

#     i += 1
#     j += 1
#   end

#   return first_packet + 1
# end
# puts find_first_marker(packets)


# day 7 with reddit help
# def calculate_filesystem_size
#     folder_sizes = Hash.new(0)

#     File.readlines('day_07_input.txt', chomp: true).map(&:split).each_with_object([]) do |line, stack|
#         case line
#         in ['$', 'cd', '..']
#           stack.pop
#         in ['$', 'cd', folder]
#           stack.push [stack.last, folder].compact.join(' ')
#         in [size, file] if size.match?(/^\d+$/)
#           stack.each { |i| folder_sizes[i] += size.to_i }
#         else
#         end
#     end
#     # part one
#     # return folder_sizes.values.reject { |i| i > 100000 }.sum
#     # part two
#     return folder_sizes.values.reject { |i| i < folder_sizes['/'] - 40000000 }.min
# end
# puts calculate_filesystem_size


# day 8
# tree_patch = File.readlines('day_08_input.txt', chomp: true)
# def calculate_tree_cover(list)
#     visible_interior = 0
    
#     list.each_with_index do |tree_row, idx|
#         next if idx == 0 or idx == list.size
#         tree_row.each_char.with_index do |tree, tree_index|
#             next if tree_index == 0 or tree_index == tree_row.size - 1
#             # consider each direction, mapping the total array in 
#             # each direction to see if the tree should be visible
#             # SKIPPING OTHER CHECKS IF ONE IS FOUND

#             # from left 
#             patch_from_left = tree_row[0..tree_index - 1].split("").map(&:to_i)
#             visible_interior += 1 if tree.to_i > patch_from_left.max()
#             # from right 
#             patch_from_right = tree_row[tree_index + 1..-1].split("").map(&:to_i)
#             visible_interior += 1 if tree.to_i > patch_from_right.max()
#             # from top 
#             patch_from_top = list[0..idx - 1].map { |row| row[tree_index] }.map(&:to_i)
#             visible_interior += 1 if tree.to_i > patch_from_top.max()
#             # from bottom 
#             patch_from_bottom = list[idx+1..-1].map { |row| row[tree_index] }.map(&:to_i)
#             visible_interior += 1 if patch_from_bottom.size > 0 and tree.to_i > patch_from_bottom.max()
#         end
#     end

#     return visible_interior + 396 # all visible from edge
# end
# puts calculate_tree_cover(tree_patch)


# input = File.readlines('day_08_input.txt', chomp: true)
#             .map { |i| i.chars.map { |j| { height: j.to_i, visible: false, scores: [] } } }

# [input, input.transpose].each do |grid|
#   grid.each do |grid_row|
#     [grid_row, grid_row.reverse].each do |row|
#       row.reduce([]) do |memo, cell|
#         cell[:visible] = true if cell[:height] > (memo.max || -1)
#         cell[:scores].push((memo.reverse.index { |i| i >= cell[:height] } || (memo.size - 1)) + 1)
#         memo + [cell[:height]]
#       end
#     end
#   end
# end
# # puts input.flatten.select { |i| i[:visible].eql? true }.count
# puts input.flatten.map { |i| i[:scores].reduce(:*) }.max


# day 9
# require 'matrix'

# input = File.readlines('day_09_input.txt', chomp: true).map { |l|
#   dir, mag = l.split
#   [dir, mag.to_i]
# }

# DIRS = {
#   "U" => Vector[0, -1],
#   "D" => Vector[0, 1],
#   "R" => Vector[1, 0],
#   "L" => Vector[-1, 0],
# }

# def simulate(steps, length=2)
#   raise unless length >= 2
#   tail_positions = Hash.new

#   knots = Array.new(length) { Vector[0, 0] }
#   tail_positions[knots.last] = true

#   steps.each { |dir, mag|
#     mag.times {
#       knots[0] += DIRS[dir]

#       (1...knots.length).each { |i|
#         prev = knots[i-1]
#         knot = knots[i]

#         diff = (prev - knot)

#         if diff.magnitude >= 2
#           normalized = diff.map { |x| x == 0 ? 0 : x / x.abs }
#           knots[i] += normalized
#         end
#       }

#       tail_positions[knots.last] = true
#     }
#   }

#   return tail_positions.values.count(true)
# end

# p simulate(input)
# p simulate(input, 10)

#day 10 
# nums = File.readlines('day_10_input.txt', chomp: true)
# def sum_cycle_nums(path)
#     x = 1
#     count = 1
#     output_idx = 20
#     outputs = []
#     File.readlines('day_10_input.txt', chomp: true).for_each_line(path) do |line|
#       command, val = line.split
#       if count == output_idx
#         outputs << (x * output_idx)
#         output_idx += 40
#       end

#       unless command == 'noop'
#         count += 1
#         if count == output_idx
#           outputs << (x * output_idx)
#           output_idx += 40
#         end
#         x += val.to_i
#       end
#       count += 1
#     end
#     puts outputs.sum
# end
# puts sum_cycle_nums(nums)


# day 11
# monkeys = File.readlines('day_11_input.txt', chomp: true)
# def find_monkey_business(list)
#     puts list
# end
# find_monkey_business(monkeys)
# [{ rounds: 20, div: 3 }, { rounds: 10_000, div: 1 }].each do |part|
#     monkeys = File.read('day_11_input.txt').split("\n\n").map do |i|
#       i = i.split("\n")
  
#       {
#         items: i[1].scan(/\d+/).map(&:to_i),
#         oper: i[2].scan(/[+*]/).first.to_sym,
#         param: i[2].scan(/\d+$/).map(&:to_i).first,
#         test: i[3].scan(/\d+$/).first.to_i,
#         pass: i[4].scan(/\d+$/).first.to_i,
#         fail: i[5].scan(/\d+$/).first.to_i,
#         inspections: 0
#       }
#     end
  
#     lcm = monkeys.map { |i| i[:test] }.reduce(:lcm)
  
#     part[:rounds].times.each do
#       monkeys.each do |monkey|
#         monkey[:inspections] += monkey[:items].size
  
#         while (i = monkey[:items].shift)
#           param = monkey[:param] || i
#           i = (i.method(monkey[:oper]).call(param) / part[:div]) % lcm
  
#           target = (i % monkey[:test]).zero? ? monkey[:pass] : monkey[:fail]
#           monkeys[target][:items] << i
#         end
#       end
#     end
  
#     puts monkeys.map { |i| i[:inspections] }.max(2).reduce(:*)
#   end

# day 12 graph search problem
# path_heights = File.readlines('day_12_input.txt', chomp: true)

# part one
# def find_path(path)
#     map = []
#     File.readlines(path, chomp: true).each do |line|
#         map <<
#         line.chars.map do |x|
#             if %w[S E].include?(x)
#             if x == 'S'
#                 0
#             else
#                 27
#             end
#             else
#             x.ord - 96
#             end
#         end
#     end
#     start_x = 0
#     start_y = 0
#     end_x = 0
#     end_y = 0
#     map.each_with_index do |x, idx|
#         x.each_with_index do |y, idy|
#         if y == 27
#             end_x = idx
#             end_y = idy
#         end
#         if y == 0
#             start_x = idx
#             start_y = idy
#         end
#         end
#     end
#     visited = {}
#     step(start_x, start_y, map, 0, visited)
#     puts visited["#{end_x}:#{end_y}"]
# end

# def step(x, y, map, steps, visited)
#     return visited if !visited["#{x}:#{y}"].nil? && steps >= visited["#{x}:#{y}"]

#     visited["#{x}:#{y}"] = steps
#     current = map[x][y]
#     return visited if current == 27

#     up = (y - 1 >= 0 ? map[x][y - 1] : 30)
#     down = (y + 1 <= map.first.size - 1 ? map[x][y + 1] : 30)
#     left = (x - 1 >= 0 ? map[x - 1][y] : 30)
#     right = (x + 1 <= map.size - 1 ? map[x + 1][y] : 30)

#     visited = step(x, y - 1, map, steps + 1, visited) if up - current < 2 || (current == 25 && up == 27)
#     visited = step(x, y + 1, map, steps + 1, visited) if down - current < 2 || (current == 25 && down == 27)
#     visited = step(x - 1, y, map, steps + 1, visited) if left - current < 2 || (current == 25 && left == 27)
#     visited = step(x + 1, y, map, steps + 1, visited) if right - current < 2 || (current == 25 && right == 27)
#     visited
# end
# find_path('day_12_input.txt')

# part two
# def shortest_path_part_two(path)
#     map = []
#     File.readlines(path, chomp: true).each do |line|
#         map <<
#         line.chars.map do |x|
#             if %w[S E].include?(x)
#             if x == 'S'
#                 0
#             else
#                 27
#             end
#             else
#             x.ord - 96
#             end
#         end
#     end
#     end_x = 0
#     end_y = 0
#     points = []
#     map.each_with_index do |x, idx|
#         x.each_with_index do |y, idy|
#         if y == 27
#             end_x = idx
#             end_y = idy
#         end
#         points << [idx, idy] if y == 1
#         end
#     end
#     paths = []
#     points.each_with_index do |point, idx|
#         puts "#{idx}/#{points.size}"
#         visited = {}
#         step(point[0], point[1], map, 0, visited)
#         paths << visited["#{end_x}:#{end_y}"]
#     end
#     puts paths.compact.min
# end

# def step(x, y, map, steps, visited)
#     return visited if !visited["#{x}:#{y}"].nil? && steps >= visited["#{x}:#{y}"]

#     visited["#{x}:#{y}"] = steps
#     current = map[x][y]
#     return visited if current == 27

#     up = (y - 1 >= 0 ? map[x][y - 1] : 30)
#     down = (y + 1 <= map.first.size - 1 ? map[x][y + 1] : 30)
#     left = (x - 1 >= 0 ? map[x - 1][y] : 30)
#     right = (x + 1 <= map.size - 1 ? map[x + 1][y] : 30)

#     visited = step(x, y - 1, map, steps + 1, visited) if up - current < 2 || (current == 25 && up == 27)
#     visited = step(x, y + 1, map, steps + 1, visited) if down - current < 2 || (current == 25 && down == 27)
#     visited = step(x - 1, y, map, steps + 1, visited) if left - current < 2 || (current == 25 && left == 27)
#     visited = step(x + 1, y, map, steps + 1, visited) if right - current < 2 || (current == 25 && right == 27)
#     visited
# end
# shortest_path_part_two('day_12_input.txt')


# day 13
# def ordered_packets_sum(path)
#       pair1 = nil
#       pair2 = nil
#       pairs = {}
#       idx = 1
#       File.readlines(path, chomp: true).each do |line|
#         if line == ''
#           pairs[idx] = { left: pair1, right: pair2 }
#           idx += 1
#           pair1 = nil
#           pair2 = nil
#         elsif pair1.nil?
#           pair1 = eval(line)
#           pair2 = nil
#         else
#           pair2 = eval(line)
#         end
#       end

#       sum = 0
#       pairs.each do |key, val|
#         pairs[key][:order] = left_vs_right(val[:left], val[:right])
#         sum += key if pairs[key][:order]
#       end
#       puts sum
#     end

#     def left_vs_right(left, right)
#       max_idx = [left.size, right.size].max
#       (0..max_idx - 1).each do |idx|
#         left_val = left[idx]
#         right_val = right[idx]

#         return true if left_val.nil? && !right_val.nil?
#         return false if right_val.nil? && !left_val.nil?

#         if left_val.is_a?(Integer) && right_val.is_a?(Integer)
#           return true if left_val < right_val
#           return false if left_val > right_val
#         end

#         res = left_vs_right([left_val], right_val) if left_val.is_a?(Integer) && right_val.is_a?(Array)
#         res = left_vs_right(left_val, [right_val]) if left_val.is_a?(Array) && right_val.is_a?(Integer)
#         res = left_vs_right(left_val, right_val) if left_val.is_a?(Array) && right_val.is_a?(Array)
#         return res unless res.nil?
#       end
#       nil
# end
# ordered_packets_sum('day_13_input.txt')

# def find_divider_inidices(path)
#     packets = []
#     File.readlines(path, chomp: true).each do |line|
#       packets << eval(line)
#     end
#     packets << [[2]]
#     packets << [[6]]
#     packets = packets.compact

#     packets =
#       packets.sort do |left, right|
#         res = left_vs_right(left, right)
#         if res.nil?
#           0
#         elsif res
#           -1
#         else
#           1
#         end
#       end

#     divider_idxs = []
#     packets.each_with_index do |val, idx|
#       divider_idxs << (idx + 1) if [[[2]], [[6]]].include?(val)
#     end
#     puts divider_idxs.inject(:*)
#   end

#   def left_vs_right(left, right)
#     max_idx = [left.size, right.size].max
#     (0..max_idx - 1).each do |idx|
#       left_val = left[idx]
#       right_val = right[idx]

#       return true if left_val.nil? && !right_val.nil?
#       return false if right_val.nil? && !left_val.nil?

#       if left_val.is_a?(Integer) && right_val.is_a?(Integer)
#         return true if left_val < right_val
#         return false if left_val > right_val
#       end

#       res = left_vs_right([left_val], right_val) if left_val.is_a?(Integer) && right_val.is_a?(Array)
#       res = left_vs_right(left_val, [right_val]) if left_val.is_a?(Array) && right_val.is_a?(Integer)
#       res = left_vs_right(left_val, right_val) if left_val.is_a?(Array) && right_val.is_a?(Array)
#       return res unless res.nil?
#     end
#     nil
#   end
#   find_divider_inidices('day_13_input.txt')


# day 14
# module Visualisation
#     def print_grid(grid, centre_x: 20, centre_y: 20, x_dim: 40, y_dim: 40, sleep: 0.01, spacer: ' ', colour_char: nil, colour: nil)
#       system('clear')
#       x_origin = centre_x - (x_dim / 2) >= 0 ? centre_x - (x_dim / 2) : 0
#       y_origin = centre_y - (y_dim / 2) >= 0 ? centre_y - (y_dim / 2) : 0
#       (x_origin..x_origin + x_dim - 1).each do |x|
#         (y_origin..y_origin + y_dim - 1).each do |y|
#           grid_x = grid[x]
#           val = grid[x].nil? ? nil : grid_x[y]
#           val ||= '.'
#           print_and_flush("#{val}#{spacer}", colour_char, colour)
#         end
#         puts ''.black
#       end
#       sleep(sleep)
#     end
  
#     def print_and_flush(str, colour_char, colour)
#       str = ColorizedString[str].colorize(colour) if str[0] == colour_char
#       print(str)
#       $stdout.flush
#     end
#   end

# def falling_sand_analyzer(path, input_type)
#     map = Array.new(600) { Array.new(600) { '.' } }
#     File.readlines(path, chomp: true).each do |line|
#         rock_path = line.split(' -> ').map { |x| x.split(',').map(&:to_i) }
#         rock_path.each_with_index do |coords, idx|
#         next if rock_path[idx + 1].nil?

#         x1 = coords[0]
#         y1 = coords[1]
#         x2 = rock_path[idx + 1][0]
#         y2 = rock_path[idx + 1][1]
#         if x1 == x2
#             (y1, y2 = y2, y1) if y1 > y2
#             (y1..y2).each do |y|
#             map[y][x1] = '#'
#             end
#         end
#         next unless y1 == y2

#         (x1, x2 = x2, x1) if x1 > x2
#         (x1..x2).each do |x|
#             map[y1][x] = '#'
#         end
#         end
#     end
#     map[0][500] = '+'
#     largest_y = 0
#     2000.times do |num|
#         _, y = fall(map, 500, 0, input_type == 'sample')
#         if y.nil?
#         puts "Steps: #{num}"
#         break
#         elsif y > largest_y
#         largest_y = y
#         end
#     end
#     puts "Largest Y: #{largest_y + 1}"
#     end

#     def fall(map, x, y, vis)
#     print(map) if vis
#     return [nil, nil] if x >= 599 || y >= 599

#     if map[y + 1][x] == '.'
#         map[y][x] = '.'
#         map[y + 1][x] = '+'
#         return fall(map, x, y + 1, vis)
#     end

#     if map[y + 1][x - 1] == '.'
#         map[y][x] = '.'
#         map[y + 1][x - 1] = '+'
#         return fall(map, x - 1, y + 1, vis)
#     end

#     return [x, y] unless map[y + 1][x + 1] == '.'

#     map[y][x] = '.'
#     map[y + 1][x + 1] = '+'
#     fall(map, x + 1, y + 1, vis)
#     end

#     def print(grid)
#         Visualisation.print_grid(grid, centre_x: 6, centre_y: 500, x_dim: 12, y_dim: 23, sleep: 0.02, colour_char: '+', colour: :yellow)
#     end


# falling_sand_analyzer('day_14_input.txt', "")

# part 2
# def number_of_fallen_sand_grains(path, input_type)
#         floor =
#           if input_type == 'sample'
#             9 + 2
#           else
#             160 + 2
#           end
#         map = Array.new(800) { Array.new(800) { '.' } }
#         File.readlines(path, chomp: true).each do |line|
#           rock_path = line.split(' -> ').map { |x| x.split(',').map(&:to_i) }
#           rock_path.each_with_index do |coords, idx|
#             next if rock_path[idx + 1].nil?
  
#             x1 = coords[0]
#             y1 = coords[1]
#             x2 = rock_path[idx + 1][0]
#             y2 = rock_path[idx + 1][1]
#             if x1 == x2
#               (y1, y2 = y2, y1) if y1 > y2
#               (y1..y2).each do |y|
#                 map[y][x1] = '#'
#               end
#             end
#             next unless y1 == y2
  
#             (x1, x2 = x2, x1) if x1 > x2
#             (x1..x2).each do |x|
#               map[y1][x] = '#'
#             end
#           end
#         end
#         map[0][500] = '+'
  
#         800.times do |num|
#           map[floor][num] = '#'
#         end
  
#         100_000.times do |num|
#           x, y = fall(map, 500, 0, input_type == 'sample')
#           if x == 500 && y.zero?
#             puts num + 1
#             break
#           end
#         end
#       end
  
#       def fall(map, x, y, vis)
#         print(map) if vis
#         return [nil, nil] if x >= 799 || y >= 799
  
#         if map[y + 1][x] == '.'
#           map[y][x] = '.'
#           map[y + 1][x] = '+'
#           return fall(map, x, y + 1, vis)
#         end
  
#         if map[y + 1][x - 1] == '.'
#           map[y][x] = '.'
#           map[y + 1][x - 1] = '+'
#           return fall(map, x - 1, y + 1, vis)
#         end
  
#         return [x, y] unless map[y + 1][x + 1] == '.'
  
#         map[y][x] = '.'
#         map[y + 1][x + 1] = '+'
#         fall(map, x + 1, y + 1, vis)
#       end
# number_of_fallen_sand_grains('day_14_input.txt', "input")


# day 17
ROCKS = {
    1 => {
      points: [
        ->(x, y) { [y, x] },
        ->(x, y) { [y, x + 1] },
        ->(x, y) { [y, x + 2] },
        ->(x, y) { [y, x + 3] }
      ],
      width: 4,
      height: 1
    },
    2 => {
      points: [
        ->(x, y) { [y, x + 1] },
        ->(x, y) { [y + 1, x] },
        ->(x, y) { [y + 1, x + 1] },
        ->(x, y) { [y + 1, x + 2] },
        ->(x, y) { [y + 2, x + 1] }
      ],
      width: 3,
      height: 3
    },
    3 => {
      points: [
        ->(x, y) { [y, x] },
        ->(x, y) { [y, x + 1] },
        ->(x, y) { [y, x + 2] },
        ->(x, y) { [y + 1, x + 2] },
        ->(x, y) { [y + 2, x + 2] }
      ],
      width: 3,
      height: 3
    },
    4 => {
      points: [
        ->(x, y) { [y, x] },
        ->(x, y) { [y + 1, x] },
        ->(x, y) { [y + 2, x] },
        ->(x, y) { [y + 3, x] }
      ],
      width: 1,
      height: 4
    },
    5 => {
      points: [
        ->(x, y) { [y, x] },
        ->(x, y) { [y, x + 1] },
        ->(x, y) { [y + 1, x] },
        ->(x, y) { [y + 1, x + 1] }
      ],
      width: 2,
      height: 2
    }
  }.freeze

  WINDOW_SIZE = 1000
  WINDOW_ADJUSTMENT = 10

#   def run(path)
#     jets = File.readlines(path, chomp: true)[0].chars.map { |x| x == '>' ? 1 : -1 }
#     grid = Array.new(WINDOW_SIZE + WINDOW_ADJUSTMENT) { Array.new(7) { '+' } }
#     sum_biggest_height = 0
#     last_biggest_height = 0
#     biggest_height = 0
#     count = 1
#     moves = 0
#     while count < 2023
#       rock_type = (count % 5).zero? ? 5 : count % 5
#       at_rest = false
#       x = 2
#       if biggest_height >= WINDOW_SIZE
#         sum_biggest_height += (biggest_height - last_biggest_height)
#         biggest_height -= WINDOW_ADJUSTMENT
#         last_biggest_height = biggest_height
#         10.times { grid << Array.new(7) { '+' } }
#         10.times { grid.shift }
#       end
#       y = biggest_height + 3
#       until at_rest
#         rock_points = get_grid_points(x, y, rock_type)
#         rock_points.each do |rock_point|
#           grid[rock_point[0]][rock_point[1]] = '#'
#         end
#         print(grid, biggest_height)

#         # move left or right
#         new_x = x + (moves.zero? ? jets[0] : jets[moves % jets.size])
#         check = !new_x.negative? && (new_x + ROCKS[rock_type][:width]) <= 7
#         move = true
#         if check
#           lr_rock_points = get_grid_points(new_x, y, rock_type)
#           (lr_rock_points - rock_points).each do |rock_point|
#             next unless move

#             move = false if grid[rock_point[0]][rock_point[1]] == '#'
#           end
#           if move
#             x = new_x
#             rock_points.each do |rock_point|
#               grid[rock_point[0]][rock_point[1]] = '+'
#             end
#             rock_points = lr_rock_points
#             rock_points.each do |rock_point|
#               grid[rock_point[0]][rock_point[1]] = '#'
#             end
#             print(grid, biggest_height)
#           end
#         end

#         # move down
#         new_y = y - 1
#         move = true
#         if new_y.negative?
#           biggest_height = y + ROCKS[rock_type][:height] if y + ROCKS[rock_type][:height] > biggest_height
#           move = false
#           at_rest = true
#           moves += 1
#           break
#         end
#         d_rock_points = get_grid_points(x, new_y, rock_type)
#         (d_rock_points - rock_points).each do |rock_point|
#           next unless move

#           move = false if grid[rock_point[0]][rock_point[1]] == '#'
#         end
#         if move
#           y = new_y
#           rock_points.each do |rock_point|
#             grid[rock_point[0]][rock_point[1]] = '+'
#           end
#           rock_points = d_rock_points
#           rock_points.each do |rock_point|
#             grid[rock_point[0]][rock_point[1]] = '#'
#           end
#           print(grid, biggest_height)
#         else
#           at_rest = true
#         end

#         if at_rest
#           biggest_height = y + ROCKS[rock_type][:height] if y + ROCKS[rock_type][:height] > biggest_height
#         end

#         moves += 1
#       end
#       if count == 2022
#         sum_biggest_height += (biggest_height - last_biggest_height)
#       end
#       count += 1
#     end
#     puts sum_biggest_height
#   end

#   def get_grid_points(x, y, rock_type)
#     points = []
#     ROCKS[rock_type][:points].each do |point|
#       points << point.call(x, y)
#     end
#     points
#   end

#   def print(grid, y)
#     #Visualisation.print_grid(grid, centre_x: 20, centre_y: 4, x_dim: 40, y_dim: 8, sleep: 0.1, spacer: ' ', colour_char: '#', colour: :red, flip: true)
#   end
# run('input_day_17.txt')


def run_day_two(path)
    jets = File.readlines(path, chomp: true)[0].chars.map { |x| x == '>' ? 1 : -1 }
    grid = Array.new(WINDOW_SIZE + WINDOW_ADJUSTMENT) { Array.new(7) { '+' } }
    sum_biggest_height = 0
    last_biggest_height = 0
    biggest_height = 0
    count = 1
    moves = 0
    while count < 2023
      rock_type = (count % 5).zero? ? 5 : count % 5
      at_rest = false
      x = 2
      if biggest_height >= WINDOW_SIZE
        sum_biggest_height += (biggest_height - last_biggest_height)
        biggest_height -= WINDOW_ADJUSTMENT
        last_biggest_height = biggest_height
        10.times { grid << Array.new(7) { '+' } }
        10.times { grid.shift }
      end
      y = biggest_height + 3
      until at_rest
        rock_points = get_grid_points(x, y, rock_type)
        rock_points.each do |rock_point|
          grid[rock_point[0]][rock_point[1]] = '#'
        end
        print(grid, biggest_height)

        # move left or right
        new_x = x + (moves.zero? ? jets[0] : jets[moves % jets.size])
        check = !new_x.negative? && (new_x + ROCKS[rock_type][:width]) <= 7
        move = true
        if check
          lr_rock_points = get_grid_points(new_x, y, rock_type)
          (lr_rock_points - rock_points).each do |rock_point|
            next unless move

            move = false if grid[rock_point[0]][rock_point[1]] == '#'
          end
          if move
            x = new_x
            rock_points.each do |rock_point|
              grid[rock_point[0]][rock_point[1]] = '+'
            end
            rock_points = lr_rock_points
            rock_points.each do |rock_point|
              grid[rock_point[0]][rock_point[1]] = '#'
            end
            print(grid, biggest_height)
          end
        end

        # move down
        new_y = y - 1
        move = true
        if new_y.negative?
          biggest_height = y + ROCKS[rock_type][:height] if y + ROCKS[rock_type][:height] > biggest_height
          move = false
          at_rest = true
          moves += 1
          break
        end
        d_rock_points = get_grid_points(x, new_y, rock_type)
        (d_rock_points - rock_points).each do |rock_point|
          next unless move

          move = false if grid[rock_point[0]][rock_point[1]] == '#'
        end
        if move
          y = new_y
          rock_points.each do |rock_point|
            grid[rock_point[0]][rock_point[1]] = '+'
          end
          rock_points = d_rock_points
          rock_points.each do |rock_point|
            grid[rock_point[0]][rock_point[1]] = '#'
          end
          print(grid, biggest_height)
        else
          at_rest = true
        end

        if at_rest
          biggest_height = y + ROCKS[rock_type][:height] if y + ROCKS[rock_type][:height] > biggest_height
        end

        moves += 1
      end
      if count == 1000000000000
        sum_biggest_height += (biggest_height - last_biggest_height)
      end
      count += 1
    end
    puts sum_biggest_height
  end

  def get_grid_points(x, y, rock_type)
    points = []
    ROCKS[rock_type][:points].each do |point|
      points << point.call(x, y)
    end
    points
  end

  def print(grid, y)
    #Visualisation.print_grid(grid, centre_x: 20, centre_y: 4, x_dim: 40, y_dim: 8, sleep: 0.1, spacer: ' ', colour_char: '#', colour: :red, flip: true)
  end



run_day_two('input_day_17.txt')