class Array
    def my_each(&prc)
        i = 0
        while i < self.length
          prc.call(self[i])
          i += 1
        end
        self
    end

    def my_select(&prc)
        result = []
        self.my_each do |ele|
            result << ele if prc.call(ele)
        end
        result
    end

    def my_reject(&prc)
        result = []
        self.my_each do |ele|
            result << ele unless prc.call(ele)
        end
        result
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        flag = true
        self.my_each do |ele|
            flag = false unless prc.call(ele)
        end
        flag
    end

    def my_flatten
        result = []
        self.each do |ele|
            result << ele unless ele.is_a?(Array)
            result += ele.my_flatten if ele.is_a?(Array)
        end
        return result
    end

    def my_zip(*args)
        result = Array.new(self.length){Array.new}
        self.each_with_index do |elem, index|
            result[index] << elem
        end
        
        i = 0
        while i < self.length
            args.each do |array|
                if array[i] == nil
                    result[i] << nil
                else
                    result[i] << array[i]
                end
            end
            i += 1
        end
        return result

    end

    def my_rotate(num = 1)
        result = self
        num.times do
            result = result << result.shift
        end
        return result
    end

    def my_join(join_str = "")
        result = ""
        self.each_with_index do |elem, index|
            if self[index+1] == nil
                result << elem
            else
                result << elem + join_str
            end
        end
        return result
    end
end
