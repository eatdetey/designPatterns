require "./Tag.rb"
require "./TreeIteratorBfs.rb"
require "./TreeIteratorDfs.rb"

class HtmlTree
  include Enumerable

  SELF_CLOSING_TAGS = %w[area base br col embed hr img input link meta param source track wbr]

  attr_accessor :root

  def initialize(html_string)
    @root = parse_html(html_string)
  end
  
  def dfs_iterator()
    return TreeIteratorDfs.new(self.root)
  end

  def bfs_iterator()
    return TreeIteratorBfs.new(self.root)
  end

  def each(&block)
    iterator = TreeIteratorDfs.new(self.root)
    iterator.each do |element| 
        block.call(element)
	end
  end
  
  private
    def parse_html(html_string)
        stack = []
        current_parent = nil
    
        html_string.scan(/<[^>]+>|[^<]+/) do |token|
            token.strip!
    
            if token.start_with?("<")
                if token.start_with?("</")
                    process_closing_tag(token, stack)
                    current_parent = stack.last
                elsif token.end_with?("/>")
                    process_self_closing_tag(token, current_parent)
                else
                    current_parent = process_opening_tag(token, stack, current_parent)
                end
            elsif !token.empty?
                process_text(token, current_parent)
            end
        end
    
        self.root
    end
    
    def process_closing_tag(token, stack)
        tag_name = token[2..-2].strip
        if stack.last && stack.last.name == tag_name
            stack.pop
        end
    end
    
    def process_self_closing_tag(token, current_parent)
        tag_content = token[1..-3].strip
        name, attributes_str = tag_content.split(/\s+/, 2)
        attributes = attributes_str ? Tag.parse_attributes(attributes_str) : {}
        tag = Tag.new(name: name, attributes: attributes)
        current_parent.add_child(tag) if current_parent
    end
    
    def process_opening_tag(token, stack, current_parent)
        tag_content = token[1..-2].strip
        name, attributes_str = tag_content.split(/\s+/, 2)
        attributes = attributes_str ? Tag.parse_attributes(attributes_str) : {}
        tag = Tag.new(name: name, attributes: attributes)
    
        if current_parent
            current_parent.add_child(tag)
        else
            self.root = tag
        end
        stack << tag
        tag
    end
    
    def process_text(token, current_parent)
        current_parent.contents += token if current_parent
    end

end