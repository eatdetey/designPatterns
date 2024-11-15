class Tag
  attr_accessor :name, :attributes, :children, :contents

  def initialize(name:, attributes: {}, children: [], contents: "")
    self.name = name
    self.attributes = attributes
    self.children = []
    self.contents = contents
  end

  def add_child(tag)
    self.children << tag
  end

  def contain_attributes?
    !attributes.empty?
  end

  def count_children
    self.children.size
  end
  
  def self.parse_attributes(attributes_str)
        attributes = {}
        attributes_str.scan(/([a-zA-Z]+)="([^" >]*)"/) do |key, value|
            attributes[key] = value
        end
        attributes
  end

  def to_s
    "\nname: #{self.name}, content: #{self.contents}, children: #{self.children}, attributes: #{self.attributes}"
  end
end
