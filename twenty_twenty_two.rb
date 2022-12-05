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
def report_rearrangements(list)
    original_arrangment = list[0..7]
    new_arr =  Array.new(9, "")
    original_arrangment.each do |row|
        row.each_char.with_index do |item, idx|
            if (item != " " and item != "[" and item != "]" and item != "\n")
                if idx == 1
                    new_arr[0] += item
                elsif idx == 5
                    new_arr[1] += item
                elsif idx == 9
                    new_arr[2] += item
                elsif idx == 13
                    new_arr[3] += item
                elsif idx == 17
                    new_arr[4] += item
                elsif idx == 21
                    new_arr[5] += item
                elsif idx == 25
                    new_arr[6] += item
                elsif idx == 29
                    new_arr[7] += item
                elsif idx == 33
                    new_arr[8] += item
                end
                
            end
        end
    end
    puts "#{new_arr}"
    commands_arr = list[10..-1]
    commands_arr.each_with_index do |command, idx|
        num_to_move = command.split("move ")[1].split(" from")[0].to_i
        from_column = command.split("from ")[1].split(" to")[0].to_i - 1
        to_column = command.split("to ")[1].to_i - 1
        sliced_letters = new_arr[from_column].slice(num_to_move * -1, new_arr[from_column].length)
        puts "------------------------------------------"
        puts command
        puts "#{new_arr}"
        puts "== #{idx} =="
        puts "------------------------------------------"
        new_arr[to_column].concat(sliced_letters)
        new_arr[from_column] = new_arr[from_column].delete!(sliced_letters)

    end
    puts "#{new_arr}"
end

report_rearrangements(rearrangements)

