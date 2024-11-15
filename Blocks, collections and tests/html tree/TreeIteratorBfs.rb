require './Tag.rb'
require './TreeIterator.rb'

class TreeIteratorBfs < TreeIterator
    private

    def enumerator
        Enumerator.new do |yielder|
            queue = [self.root]
            until queue.empty?
                current = queue.shift
                yielder << current
                queue.concat(current.children) if current.children
            end
        end
    end
end