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
moves_list = File.readlines 'strategy_list.rb' 
def calculate_score(list)
    total_score = 0
    list.each do |round|
        splitted = round.split(" ")
        round_moves = splitted[0] + "-" + splitted[1]

        # first round conditional logic 
        # case round_moves
        # when "A-X"
        #     total_score += 4 
        # when "A-Y"
        #     total_score += 8 
        # when "A-Z"
        #     total_score += 3 
        # when "B-X"
        #     total_score += 1 
        # when "B-Y" 
        #     total_score += 5 
        # when "B-Z"
        #     total_score += 9 
        # when "C-X"
        #     total_score += 7 
        # when "C-Y"
        #     total_score += 2 
        # when "C-Z"
        #     total_score += 6 
        # else
        #     invalid_input += 1
        # end

        # second round conditional logic
        case round_moves
        when "A-X"
            total_score += 3 #
        when "A-Y"
            total_score += 4 #
        when "A-Z"
            total_score += 8 #
        when "B-X"
            total_score += 1 #
        when "B-Y" 
            total_score += 5 #
        when "B-Z"
            total_score += 9 #
        when "C-X"
            total_score += 2 #
        when "C-Y"
            total_score += 6 #
        when "C-Z"
            total_score += 7 #
        else
            puts "invalid move"
        end
    end
    return total_score
end
puts calculate_score(moves_list)


