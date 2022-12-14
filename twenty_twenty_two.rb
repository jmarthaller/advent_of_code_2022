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


# def run_day_two(path)
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
#       if count == 1000000000000
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

# run_day_two('input_day_17.txt')


# day 18
# require "set"

# class Cube
#     attr_reader :x
#     attr_reader :y
#     attr_reader :z

#     def initialize(x, y, z)
#         @x = x
#         @y = y
#         @z = z
#     end

#     def neighbors
#         [
#             Cube.new(@x-1, @y, @z), Cube.new(@x+1, @y, @z),
#             Cube.new(@x, @y-1, @z), Cube.new(@x, @y+1, @z),
#             Cube.new(@x, @y, @z-1), Cube.new(@x, @y, @z+1)
#         ]
#     end

#     def bounded_neighbors(x_bounds, y_bounds, z_bounds)
#         neighbors.select { |c|
#             x_bounds.include?(c.x) && y_bounds.include?(c.y) && z_bounds.include?(c.z) 
#         }
#     end

#     def eql?(other)
#         self.class == other.class && @x == other.x && @y == other.y && @z == other.z
#     end

#     def ==(other)
#         self.eql?(other)
#     end

#     def hash
#         [self.class, @x, @y, @z].hash
#     end

#     def to_s
#         "(#{@x},#{@y},#{@z})"
#     end
# end

# def parse_cube(str)
#     Cube.new *(str.split(",").map { |s| s.to_i })
# end

# def surface_area(cubes)
#     cubes.reduce(0) { |sum, cube| 
#         adjacent = 6 - cube.neighbors.count { |n| cubes.include? n }
#         sum + adjacent
#     }
# end

# def bounding_ranges(cubes)
#     first = cubes.first()
#     min_x = max_x = first.x
#     min_y = max_y = first.y
#     min_z = max_z = first.z
#     cubes.each do |c|
#         min_x = c.x if c.x < min_x
#         max_x = c.x if c.x > max_x
#         min_y = c.y if c.y < min_y
#         max_y = c.y if c.y > max_y
#         min_z = c.z if c.z < min_z
#         max_z = c.z if c.z > max_z
#     end
#     [((min_x - 1)..(max_x + 1)), ((min_y - 1)..(max_y + 1)), ((min_z - 1)..(max_z + 1))]
# end

# def external_surface_area(cubes)
#     external_surfaces = 0
#     (x_range, y_range, z_range) = bounding_ranges(cubes)

#     open_cells = [Cube.new(x_range.first, y_range.first, z_range.first)]
#     closed_cells = open_cells.to_set

#     while open_cells.any?
#         cell = open_cells.pop
#         cell.bounded_neighbors(x_range, y_range, z_range).each do |neighbor|
#             next if closed_cells.include? neighbor
#             if cubes.include? neighbor
#                 external_surfaces += 1
#             else
#                 closed_cells << neighbor
#                 open_cells << neighbor
#             end
#         end
#     end
#     external_surfaces
# end

# cubes = File.read("day_18_input.txt").split.map { |line| parse_cube(line) }.to_set
# puts "Part 1: #{surface_area cubes}"
# puts "Part 2: #{external_surface_area cubes}"


# day 19
# inputList = IO.readlines("day_19_input.txt").map(&:chomp)

# require "set"

# Blueprint = Struct.new(:id, :oreBotOre, :clayBotOre, 
#                        :obsBotOre, :obsBotClay, 
#                        :geodeBotOre, :geodeBotObs)
# blueprints = inputList.map{ |line| Blueprint.new(*line.scan(/(\d+)/).flatten.map(&:to_i)) }

# BotState = Struct.new(:minutes, 
#    :oreBotCnt, :clayBotCnt, :obsBotCnt, :geodeBotCnt, 
#    :ore, :clay, :obs, :geode)

# def getBestGeodes(bp, minutes)
#    best = 0
#    queue = [BotState.new(minutes, 1, 0, 0, 0, 0, 0, 0, 0)]
#    visited = Set.new
#    while(queue.size > 0)
#       curr = queue.shift
#       if(!visited.include?(curr))
#          visited << curr
#          if(curr.minutes==0)
#             if(best < curr.geode)
#                #puts "found new best #{bp.id}: #{curr.geode}"
#                best = curr.geode
#             end
#          # abandon thread if there is no way we could beat the current best
#          #elsif(curr.geode + ((1..curr.minutes).to_a.sum) > best)
#          #elsif(curr.minutes > 20 || curr.geode + ((1...curr.minutes).to_a.sum) > best)
#          else
#             n = BotState.new(
#                curr.minutes - 1,
#                curr.oreBotCnt,
#                curr.clayBotCnt,
#                curr.obsBotCnt,
#                curr.geodeBotCnt,
#                curr.ore + curr.oreBotCnt,
#                curr.clay + curr.clayBotCnt,
#                curr.obs + curr.obsBotCnt,
#                curr.geode + curr.geodeBotCnt
#             )
           
#             # always build geode bot if you can 
#             canBuildGeodeBot = (curr.ore>=bp.geodeBotOre && curr.obs>=bp.geodeBotObs)
#             # don't build obs bot if you can build geode bot
#             canBuildObsBot = !canBuildGeodeBot && 
#                #don't need more obs than 1 geodeBot per min
#                (curr.obsBotCnt<bp.geodeBotObs) &&
#                (curr.ore>=bp.obsBotOre && curr.clay>=bp.obsBotClay)
#             # don't build clay bot if you can build geode bot
#             canBuildClayBot = !canBuildGeodeBot && !canBuildObsBot &&
#                #don't need more clay than 1 obsBot per min
#                (curr.clayBotCnt<bp.obsBotClay) && 
#                (curr.ore>=bp.clayBotOre)
#             canBuildOreBot = !canBuildGeodeBot && !canBuildObsBot &&
#                #don't need more ore than the max any bot could need per min
#                (curr.oreBotCnt<[bp.geodeBotOre,bp.obsBotOre,bp.clayBotOre].max) &&
#                (curr.ore>=bp.oreBotOre)
#             # don't want to hoard if we can build a a geode bot
#             canBuildNothing = !canBuildGeodeBot &&
#                # don't idle if we have already hoarded more clay and ore than we need
#                (curr.ore < 2*[bp.geodeBotOre,bp.obsBotOre,bp.clayBotOre].max) &&
#                (curr.clay < 3*bp.obsBotClay)

#             # push build nothing state only 
#             queue << n if(canBuildNothing)

#                # push build geode bot state
#             queue << BotState.new(
#                n.minutes,
#                n.oreBotCnt, 
#                n.clayBotCnt,
#                n.obsBotCnt, 
#                n.geodeBotCnt + 1,
#                n.ore - bp.geodeBotOre, 
#                n.clay,
#                n.obs - bp.geodeBotObs,
#                n.geode
#             ) if(canBuildGeodeBot)

#             # push build obs bot state
#             queue << BotState.new(
#                n.minutes,
#                n.oreBotCnt, 
#                n.clayBotCnt,
#                n.obsBotCnt + 1, 
#                n.geodeBotCnt,
#                n.ore - bp.obsBotOre,
#                n.clay - bp.obsBotClay,
#                n.obs,
#                n.geode
#             ) if(canBuildObsBot)
            
#             # push build clay bot state
#             queue << BotState.new(
#                n.minutes,
#                n.oreBotCnt, 
#                n.clayBotCnt + 1,
#                n.obsBotCnt, 
#                n.geodeBotCnt,
#                n.ore - bp.clayBotOre,
#                n.clay,
#                n.obs,
#                n.geode
#             ) if(canBuildClayBot)
            
#             # push build ore bot state
#             queue << BotState.new(
#                n.minutes,
#                n.oreBotCnt + 1, 
#                n.clayBotCnt,
#                n.obsBotCnt, 
#                n.geodeBotCnt,
#                n.ore - bp.oreBotOre,
#                n.clay,
#                n.obs,
#                n.geode
#             ) if(canBuildOreBot)
#          end
#       end
#    end
#    return best
# end

# puts blueprints.map { |bp|
#    getBestGeodes(bp, 24) * bp.id
# }.sum

# puts blueprints[0..2].map { |bp|
#    getBestGeodes(bp, 32)
# }.inject(1,:*)

# day 20
# [1, 811589153].each{|n|
#     a = File.readlines('day_20_input.txt').each_with_index.map{[_1.to_i * n, _2]}
#     (n % 71).times{a.size.times{|i| a.insert(
#       ((j = a.index{_1[1] == i}) + a[j][0]) % (a.size - 1), a.delete_at(j))}}
#     p [1, 2, 3].map{|x| a[(a.index{_1[0] == 0} + x * 1000) % a.size]}.sum{_1[0]}}

# day 21
# INPUT = "day_21_input.txt"
#   ROOT = "root"
#   HUMAN = "humn"


#     @monkeys = {}
#     File.readlines(INPUT, chomp: true).each do |line|
#       key, val = line.split(": ")
#       if val =~ /(\w*) ([\+\*\/\-]) (\w*)/
#         @monkeys[key] = [$2, $1, $3]
#       else
#         @monkeys[key] = val.to_i
#       end
#     end


#   def one
#     solve(ROOT)
#   end

#   def two
#     left_path = path_to_human(@monkeys[ROOT][1])
#     right_path = path_to_human(@monkeys[ROOT][2])
#     if left_path.is_a?(Integer)
#       solve_equation(right_path, left_path)
#     else
#       solve_equation(left_path, right_path)
#     end
#   end

#   private def solve(key)
#     return @monkeys[key] if @monkeys[key].is_a?(Integer)

#     op, left, right = @monkeys[key]
#     left_val = solve(left)
#     right_val = solve(right)
#     left_val.send(op, right_val)
#   end

#   private def solve_equation(equation, value)
#     return value if equation == HUMAN
#     op, left, right = equation
#     if op == "+"
#       if left.is_a?(Integer)
#         solve_equation(right, value - left)
#       else
#         solve_equation(left, value - right)
#       end
#     elsif op == "-"
#       if left.is_a?(Integer)
#         solve_equation(right, left - value)
#       else
#         solve_equation(left, right + value)
#       end
#     elsif op == "/"
#       if left.is_a?(Integer)
#         solve_equation(right, left / value)
#       else
#         solve_equation(left, right * value)
#       end
#     else
#       if left.is_a?(Integer)
#         solve_equation(right, value / left)
#       else
#         solve_equation(left, value / right)
#       end
#     end
#   end

#   private def path_to_human(key)
#     return HUMAN if key == HUMAN
#     return @monkeys[key] if @monkeys[key].is_a?(Integer)

#     op, left, right = @monkeys[key]
#     left_val = path_to_human(left)
#     right_val = path_to_human(right)
#     if left_val.is_a?(Integer) && right_val.is_a?(Integer)
#       left_val.send(op, right_val)
#     else
#       [op, left_val, right_val]
#     end
#   end

#   puts one()
#   puts two()


# day 22
# map = {}
# lines = File.readlines("day_22_input.txt")
# place = nil
# lines.each_with_index do |l, y|
#   l.chomp.chars.each_with_index do |c, x|
#     map[[x, y]] = c if c != ' '
#     place = [x, y] unless place
#   end
#   break if l.strip.empty?
# end
# # p lines.last
# x_min, x_max = map.keys.map(&:first).minmax
# y_min, y_max = map.keys.map(&:last).minmax

# facing = [1, 0]
# rotate_right = -> dx, dy { [-dy, dx] }
# rotate_left = -> dx, dy { [dy, -dx] }

# draw = -> {
#   (y_min..y_max).each do |y|
#     (x_min..x_max).each do |x|
#       c = map[[x, y]]
#       if c.nil?
#         print ' '
#       elsif [x, y] == place
#         print case facing
#               when [1, 0] then '>'
#               when [-1, 0] then '<'
#               when [0, 1] then 'v'
#               when [0, -1] then '^'
#               end
#       else
#         print c
#       end
#     end
#     puts
#   end
#   puts '======================='
# }

# p path = lines.last.scan(/\d+|R|L/)
# path.each do |v|
#   if v == 'R'
#     facing = rotate_right[*facing]
#   elsif v == 'L'
#     facing = rotate_left[*facing]
#   else
#     v.to_i.times do
#       next_place = [place.first + facing.first, place.last + facing.last]
#       char = map[next_place]
#       if char.nil?
#         ys_on_x = map.keys.select { |x, y| x == next_place.first }.map(&:last)
#         xs_on_y = map.keys.select { |x, y| y == next_place.last }.map(&:first)
#         if facing == [1, 0]
#           next_place = [xs_on_y.min, next_place.last]
#         elsif facing == [-1, 0]
#           next_place = [xs_on_y.max, next_place.last]
#         elsif facing == [0, 1]
#           next_place = [next_place.first, ys_on_x.min]
#         elsif facing == [0, -1]
#           next_place = [next_place.first, ys_on_x.max]
#         end
#         char = map[next_place]
#       end
#       if char == '#'
#         break
#       end
#       place = next_place
#       # draw[]
#       # sleep 0.1
#     end
#   end
#   # draw[]
#   # sleep 0.1
# end
# draw[]
# p [place, facing]
# facing_score = case facing
#                 when [1, 0] then 0
#                 when [-1, 0] then 2
#                 when [0, 1] then 1
#                 when [0, -1] then 3
#                 end
# row = place[1] + 1
# col = place[0] + 1
# puts row * 1000 + col * 4 + facing_score

# Part 2
# $cube_data = {
#     A: {
#       origin: [1, 0],
#       up: [:F, 1],
#       down: [:C, 0],
#       left: [:E, 2],
#       right: [:B, 0],
#     },
#     B: {
#       origin: [2, 0],
#       up: [:F, 0],
#       down: [:C, 1],
#       left: [:A, 0],
#       right: [:D, 2],
#     },
#     C: {
#       origin: [1, 1],
#       up: [:A, 0],
#       down: [:D, 0],
#       left: [:E, 3],
#       right: [:B, 3],
#     },
#     D: {
#       origin: [1, 2],
#       up: [:C, 0],
#       down: [:F, 1],
#       left: [:E, 0],
#       right: [:B, 2],
#     },
#     E: {
#       origin: [0, 2],
#       up: [:C, 1],
#       down: [:F, 0],
#       left: [:A, 2],
#       right: [:D, 0],
#     },
#     F: {
#       origin: [0, 3],
#       up: [:E, 0],
#       down: [:B, 0],
#       left: [:A, 3],
#       right: [:D, 3],
#     }
#   }
  
#   class Cube
#     def initialize(size)
#       @size = size
#     end
#     def face_coord(point)
#       $cube_data.each do |k, v|
#         origin = v[:origin]
#         if point[0] >= origin[0] * @size && point[0] < (origin[0] + 1) * @size &&
#             point[1] >= origin[1] * @size && point[1] < (origin[1] + 1) * @size
#           return [k, point[0] - origin[0] * @size, point[1] - origin[1] * @size]
#         end
#       end
#       raise "no face for #{point}"
#     end
#     def resolve(from, to)
#       from_face, from_x, from_y = from
#       to_x, to_y = to
#       instructions = nil
#       go = ->(dir, dx, dy) {
#         to_face, rotation = $cube_data[from_face][dir]
#         tx, ty = to_x + dx, to_y + dy
#         rotate_right = -> {
#           tx, ty = @size - ty - 1, tx
#         }
#         rotation.times { rotate_right[] }
#         [to_face, tx, ty, rotation]
#       }
#       if to_y < 0
#         go[:up, 0, @size]
#       elsif to_y >= @size
#         go[:down, 0, -@size]
#       elsif to_x < 0
#         go[:left, @size, 0]
#       elsif to_x >= @size
#         go[:right, -@size, 0]
#       else
#         return [from_face, to_x, to_y, 0]
#       end
#     end
#     def xy_coord(face_coord)
#       face, x, y = face_coord
#       origin = $cube_data[face][:origin]
#       [origin[0] * @size + x, origin[1] * @size + y]
#     end
#   end
  
#   $cube = Cube.new(50)
  
#   map = {}
#   lines = File.readlines("day_22_input.txt")
#   place = nil
#   lines.each_with_index do |l, y|
#     l.chomp.chars.each_with_index do |c, x|
#       if c != ' '
#         map[[x, y]] = c
#         place = [x, y] unless place
#       end
#     end
#     break if l.strip.empty?
#   end
#   # p lines.last
#   x_min, x_max = map.keys.map(&:first).minmax
#   y_min, y_max = map.keys.map(&:last).minmax
  
#   facing = [1, 0]
#   rotate_right = -> dx, dy { [-dy, dx] }
#   rotate_left = -> dx, dy { [dy, -dx] }
#   p board_size = y_max - y_min + 1
  
#   wrap = -> place, next_place, facing {
#     face_coord = $cube.face_coord(place)
#     p ['WRAP', place, next_place, facing, face_coord]
  
#     dx, dy = next_place[0] - place[0], next_place[1] - place[1]
#     next_face, nx, ny, rotations = $cube.resolve(face_coord, [face_coord[1] + dx, face_coord[2] + dy])
#     next_place = $cube.xy_coord([next_face, nx, ny])
#     rotations.times { facing = rotate_right[*facing] }
#     [next_place, facing]
#   }
  
#   draw = -> {
#     (y_min..y_max).each do |y|
#       (x_min..x_max).each do |x|
#         c = map[[x, y]]
#         if c.nil?
#           print ' '
#         elsif [x, y] == place
#           print case facing
#                 when [1, 0] then '>'
#                 when [-1, 0] then '<'
#                 when [0, 1] then 'v'
#                 when [0, -1] then '^'
#                 end
#         else
#           print c
#         end
#       end
#       puts
#     end
#     puts '======================='
#   }
  
#   p path = lines.last.scan(/\d+|R|L/)
#   path.each do |v|
#     if v == 'R'
#       facing = rotate_right[*facing]
#     elsif v == 'L'
#       facing = rotate_left[*facing]
#     else
#       v.to_i.times do
#         next_place = [place.first + facing.first, place.last + facing.last]
#         next_facing = facing
#         char = map[next_place]
#         if char.nil?
#           next_place, next_facing = wrap[place, next_place, facing]
#           char = map[next_place]
#         end
#         if char == '#'
#           break
#         end
#         place = next_place
#         facing = next_facing
#         # draw[]
#         # sleep 0.1
#       end
#     end
#     # draw[]
#     # sleep 0.1
#   end
#   draw[]
#   p [place, facing]
#   facing_score = case facing
#                   when [1, 0] then 0
#                   when [-1, 0] then 2
#                   when [0, 1] then 1
#                   when [0, -1] then 3
#                   end
#   row = place[1] + 1
#   col = place[0] + 1
#   p row * 1000 + col * 4 + facing_score


# day 24
# require 'matrix'

# class Day24
#   def self.minx
#     1
#   end

#   def self.maxx
#     @maxx ||= @grid[0].size - 2
#   end

#   def self.miny
#     @miny ||= 1
#   end

#   def self.maxy
#     @maxy ||= @grid.size - 2
#   end

#   def self.storm_move(storm)
#     pos, dir, name = storm

#     new_pos = Vector[
#       minx + (pos[0] - minx + dir[0]) % maxx,
#       miny + (pos[1] - miny + dir[1]) % maxy
#     ]

#     [new_pos, dir, name]
#   end

#   def self.move_snow(start, stop, storm_index)
#     queue   = [[start, 0, storm_index]]

#     @move_snow ||= {}
#     cache_key    = queue.clone
#     return @move_snow[cache_key] if @move_snow[cache_key]

#     seen    = {}
#     result  = []
#     while queue.count > 0
#       pos, time, storm_index = queue.shift

#       if pos == stop
#         result = [time, pos, storm_index]
#         break
#       end

#       storm_index += 1
#       storms       = @storms_time[storm_index % @storms_time.count]

#       next if !seen.dig(storm_index, pos).nil? && seen.dig(storm_index, pos) <= time
#       seen[storm_index]      ||= {}
#       seen[storm_index][pos] ||= time

#       [
#         Vector[1, 0],
#         Vector[-1, 0],
#         Vector[0, 1],
#         Vector[0, -1],
#         Vector[0, 0],
#       ].each do |dir|
#         next_pos = pos + dir
#         next if next_pos[1] < miny - 1
#         next if next_pos[1] > maxy + 1
#         next if next_pos[0] > maxx
#         next if next_pos[0] < minx
#         next if @walls[next_pos]
#         next if storms[next_pos]

#         queue << [next_pos, time + 1, storm_index]
#       end
#     end

#     @move_snow[cache_key] = result

#     result
#   end

#   def self.part1(part2 = false)
#     @grid = File.read("day_24_input.txt").split("\n").map(&:chars)

#     @walls  = {}
#     storms = []
#     start  = nil
#     stop   = nil

#     @grid.each_with_index do |yv, y|
#       yv.each_with_index do |xv, x|
#         if xv == '#'
#           @walls[Vector[x, y]] = true
#         elsif y == 0 && xv == '.'
#           start = Vector[x, 0]
#         elsif y == @grid.count - 1 && xv == '.'
#           stop = Vector[x, @grid.count - 1]
#         elsif ['>', '<', '^', 'v'].include?(xv)
#           if xv == '>'
#             storms << [Vector[x, y], Vector[1, 0], '>']
#           elsif xv == '<'
#             storms << [Vector[x, y], Vector[-1, 0], '<']
#           elsif xv == '^'
#             storms << [Vector[x, y], Vector[0, -1], '^']
#           elsif xv == 'v'
#             storms << [Vector[x, y], Vector[0, 1], 'v']
#           end
#         end
#       end
#     end

#     @storms_time = [storms.clone]
#     while true do
#       storms = storms.map{|st| storm_move(st) }
#       break if @storms_time.include?(storms)
#       @storms_time << storms.clone
#     end
#     @storms_time = @storms_time.map{|sts| sts.map{|v| [v[0], true] }.to_h }

#     if part2
#       to_goal   = move_snow(start, stop, 0)
#       to_start  = move_snow(stop, start, to_goal[2])
#       back_goal = move_snow(start, stop, to_start[2])

#       return to_goal[0] + to_start[0] + back_goal[0]
#     end

#     move_snow(start, stop, 0)[0]
#   end

#   def self.part2
#     part1(true)
#   end
# end

# puts Day24.part1
# puts Day24.part2

# day 25
NUMERALS = {
    '2' => 2,
    '1' => 1,
    '0' => 0,
    '-' => -1,
    '=' => -2
  }.freeze

  def run(path)
    nums = []
    File.readlines(path, chomp: true).each do |line|
      digits = line.chars.map { |x| NUMERALS[x] }
      sum = 0
      digits.reverse.each_with_index do |digit, power|
        sum += digit * (5**power)
      end
      nums << sum
    end
    snafu = ''
    num = nums.sum
    while num.positive?
      num, rem = num.divmod(5)
      case rem
      when 0, 1, 2
        snafu += rem.to_s
      when 3
        num += 1
        snafu += '='
      when 4
        num += 1
        snafu += '-'
      end
    end
    puts snafu.reverse
  end 


  run("day_25_input.txt")