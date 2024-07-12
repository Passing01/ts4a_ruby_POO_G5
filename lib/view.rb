class View
    def ask_for(question)
      puts ">> #{question}"
      print '> '
      gets.chomp
    end
  
    def display_message(message)
      puts ">> #{message}"
    end
  
    def display_gossips(gossips)
      puts 'Voici les potins :'
      gossips.each_with_index do |gossip, index|
        puts "#{index + 1}. #{gossip.author} : #{gossip.content}"
      end
    end
  
    def ask_for_index
      print '> Quel est le numéro du potin à supprimer ? '
      gets.chomp.to_i - 1
    end
  end
  