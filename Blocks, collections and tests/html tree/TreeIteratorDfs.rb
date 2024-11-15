require './Tag.rb'
require './TreeIterator.rb'

class TreeIteratorDfs < TreeIterator
    private

    def enumerator
        Enumerator.new do |yielder|
            stack = [self.root]
            until stack.empty?
                current = stack.pop
                yielder << current
                stack.concat(current.children.reverse) if current.children
            end
        end
    end

end