class Binary_iterator
    include Enumerable
  
    def initialize(root)
      @root = root
    end
  
    def each(&block)
      traverse_in_order(@root, &block)
    end
  
    private
  
    def traverse_in_order(node, &block)
      return if node.nil?
  
      traverse_in_order(node.left, &block)
      block.call(node.value)
      traverse_in_order(node.right, &block)
    end
  end