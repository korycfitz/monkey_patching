# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        int_Check = self.all? { |ele| ele.instance_of? Integer }
        self.max - self.min if int_Check
    end

    def average
        return nil if self.length == 0
        int_Check = self.all? { |ele| ele.instance_of? Integer }
        self.sum/(self.count + 0.00) if int_Check
    end

    def median
        return nil if self.length == 0 
        ele_count = self.length
        mid_idx_odd = self.length / 2
        
        if self.length.odd?
            self.sort[mid_idx_odd]
        else 
            (self.sort[mid_idx_odd] +self.sort[mid_idx_odd - 1])/ 2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each { | ele | count[ele] += 1 }
        count
    end

    def my_count(arg)
        counter = self.select { |ele| ele == arg }
        counter.length
    end

    def my_index(arg)
        self.each_with_index { |ele, i| return i if ele == arg }

        nil
    end

    def my_uniq
        new_arr = []
        self.each do |ele|
            new_arr << ele if !new_arr.include?(ele)
        end
        new_arr
    end
    
    def my_transpose
        length = self.length
        width = self[0].length
        new_arr = Array.new(width) { Array.new(0) }
        (0...length).each do |idx1|
            (0...width).each do |idx2| 
                new_arr[idx1][idx2] = self[idx2][idx1]
            end
        end
        
        new_arr
    end
end
