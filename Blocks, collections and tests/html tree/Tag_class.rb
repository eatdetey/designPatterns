class Tag
  attr_accessor :name, :attributes, :children

  def initialize(name, attributes = {})
    @name = name
    @attributes = attributes
    @children = []
  end

  def add_child(tag)
    @children << tag
  end

  def has_children?
    !@children.empty? 
  end

  def count_children
    @children.size
  end

  def parse_arttributes
    @attributes.map{ |key, value| " #{key}=\"#{value}\"" }.join('')
  end

  def parse_children
    @children.map{ |tag| tag.to_s }.join('')
  end

  def to_s 
    "<#{@name}#{parse_arttributes}>#{parse_children}</#{@name}>>"
  end

end