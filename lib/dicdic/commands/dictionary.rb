command :'search' do |c|
  c.syntax = 'Daum Dictionary'
  c.summary = 'For non-english programmer, it translate a word'
  c.description = 'To http://dic.daum.net, it translate Korean word to other languages'
  c.action do |args, options|
    word = args.first

    title = "Dictionary - #{word}"
  	word_dic = try{agent.dictionary word }
    table = Terminal::Table.new :title => title do |t|
      word_dic.each do |key,value|
        t.add_row [ key ,{:value => value, :alignment => :left} ]
      end
    end
    puts table
  end
end

alias_command :s, :'search'