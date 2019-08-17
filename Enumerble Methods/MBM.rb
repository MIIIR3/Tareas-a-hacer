module Enumerable
    
    
    def my_each
        if block_given?
            for n in self
                yield(n)
            end
        end
        self
    end


    def my_each_with_index 
        if block_given?
            for n in 0..self.size - 1
                yield(self[n], n)
            end
        end
        self
    end


    def my_select
        given_array = []
        self.my_each {|n| given_array << n if yield(n)}
    end


    def my_all?
        gud_test = []
        self.my_each {|n| gud_test << n if yield(n) == false}
        gud_test.length == 0 ? "#{true}" : "#{false}"
    end


    def my_any?
        gud_test = []
        self.my_each {|n| gud_test << n if yield(n) == true} 
        gud_test.length == 0 ? "#{false}" : "#{true}"
    end


    def my_none?
        return self.to_enum unless block_given?
        none = []
        self.my_each{|n| none << n if yield(n) == true}
        none.length == 0 ? "#{true}" : "#{false}"
    end


    def my_count arg=0
        if arg != 0
            arr = 0
            self.my_select do |n|
                arr += 1 if n == arg
            end
            puts arr
        else
            puts self.size
        end
    end


    def my_map
        arr = []
        self.my_each{|n| arr << yield(n)}
        puts arr
    end


    def my_inject(arg=nil)
        self.my_each {|n| arg = yield(arg, n)}
        puts arg
    end


    def my_map_proc()
        arr = []
        self.my_each {|i| arr << proc.call(i)} if my_map_proc
        puts arr
    end


    def my_map_procORblock(proc=nil)
        arr = []
        if block_given?
            self.my_each {|n| arr << yiel(n)}
        elsif proc
            self.my_each {|n| arr << proc.call(n)}
        end
        puts arr
    end


end


def multiply_els(arr)
    arr.my_inject(1) {|n, i| n*i}
end



#TESTS:

# my_each test: p [1,2,3].my_each {|x| p x}

# my_each_index test: p ['a','b','c'].my_each_with_index {|l, index| p "#{index}. #{l}"}

# my_select test: p (1..5).to_a.my_select {|x| x % 2 == 0}

# my_all? test: p %w[ant bear cat].my_all? { |word| word.length >= 4 }

# my_any? test: p %w[ant bear cat].my_any? { |word| word.length >= 4 }

# my_none? test: p %w{ant bear cat}.my_none? { |word| word.length == 5 }

# my_count test: p [1,2,3,3].my_count

# my_map test: [1,2,3,4,5].my_map {|test| "#{test}!"}

# inject test: [2,3].my_inject(4) {|running, item| running * item}

# multiply_els test: multiply_els([2,4,5])

# my_map_proc test: mp = Proc.new {|number| "@#{number}"}    puts mp