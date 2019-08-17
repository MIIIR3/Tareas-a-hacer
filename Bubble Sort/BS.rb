print "give a sorted or unsorted array (example: '1, 45, 36, 87, 6, 20, 7, 4, 9')"
user_input = gets.chomp
ui = user_input[1...-2].split(',').collect! {|i| i.to_i}

def bubble_sort(ui)
    ui.each do |n|
     0.upto(ui.size-2) {|i| ui[i], ui[i+1] = ui[i+1], ui[i] if ui[i] > ui[i+1]}
    end
   ui
  end 
      
 p bubble_sort(ui)