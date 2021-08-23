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
        return self unless self.is_a?(Array)
        [self[0].my_flatten] + [self[1...self.length].my_flatten]
        
    end
end
