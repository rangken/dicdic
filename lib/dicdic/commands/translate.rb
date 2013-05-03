command :'translate' do |c|
  c.syntax = 'google translater'
  c.summary = 'Using HTML parsing, it translate your sentence to destination language'
  c.description = 'To http://translate.google.com, you translate languate by using your terminal'
  c.option '-s', '--start start_lang','Start language'
  c.option '-d', '--dest destination_lang','Destination language'
  c.action do |args, options|
    sentence = args.join(' ')
    options.start = Locale.current.language if options.start == nil
    options.dest = Locale.candidates.sample.language if options.dest == nil
    until options.dest != options.start
      options.dest = Locale.candidates.sample.language
    end
    
  	try{agent.translate sentence, options.start, options.dest}
  end
end

alias_command :t, :'translate'

