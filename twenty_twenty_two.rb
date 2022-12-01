

calorie_list = File.readlines 'calorie_list.rb' 

def find_most_calories(list)
    each_elf_backpack_arr = []
    individual_elf_pack = 0
    list.each do |calorie|
        if calorie.length == 1
            each_elf_backpack_arr.push(individual_elf_pack)
            individual_elf_pack = 0
        else
            individual_elf_pack += calorie.to_i
        end
    end
    max_value = each_elf_backpack_arr.max()
    return max_value
end

puts find_most_calories(calorie_list)