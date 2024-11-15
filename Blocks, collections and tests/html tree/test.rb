require "./HtmlTree.rb"
require "./Tag.rb"

html = "
<div class=\"welcome-section\">
    <h1>Добро пожаловать на наш сайт!</h1>
    <p>Мы рады видеть вас здесь. Ознакомьтесь с нашими услугами и не стесняйтесь задавать вопросы.</p>
    <div class=\"card\">
        <h2>Наши Услуги</h2>
        <p>Мы предлагаем широкий спектр услуг, включая веб-разработку, дизайн и SEO-оптимизацию.</p>
        <button>Узнать больше</button>
		<img src=\"info.svg\" />
    </div>
</div>
"
html_tree = HtmlTree.new(html)

def proceed_dfs(tree)
  iterator = tree.dfs_iterator

  iterator.each do |node|
    puts "Tag: #{node.name}, Attributes: #{node.attributes} Content: #{node.contents}"
  end
end

def proceed_bfs(tree)
  iterator = tree.bfs_iterator

  iterator.each do |node|
    puts "Tag: #{node.name}, Attributes: #{node.attributes} Content: #{node.contents}"
  end
end

proceed_bfs(html_tree)

puts "\n"

puts html_tree.root.count_children

empty_tags = html_tree.select {|tag| tag.contain_attributes?}

empty_tags.each do |tag| 
  puts tag
end