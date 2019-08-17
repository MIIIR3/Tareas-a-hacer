

print "gib an array of prices (example: [1, 45, 36, 87, 6, 20, 7, 4, 9])"
user_input = gets.chomp
ui = user_input[1...-2].split(',').collect! {|i| i.to_i}

def stock(ui)
    max_profit = 0
    best_days = []
    ui[0..-2].each do |buy|
      ui[ui.index(buy)..-1].each do |sell|
        max_profit < (sell-buy) ? "#{max_profit = (sell-buy)} #{best_days[0] = ui.index(buy)} #{best_days[1] = ui.index(sell)}" : ""
      end
    end
    best_days
  end

  p stock(ui)









