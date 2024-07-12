require_relative 'controller'

class Router
  def initialize
    @controller = Controller.new
  end

  def perform
    puts "BIENVENUE DANS THE GOSSIP PROJECT"
    while true
      puts "Tu veux faire quoi jeune mouss' ?"
      puts "1. Je veux créer un gossip"
      puts "2. Voir la liste des potins"
      puts "3. Supprimer un potin"
      puts "4. Je veux quitter l'app"
      print "> "
      params = gets.chomp.to_i
      case params
      when 1
        puts "Tu as choisi de créer un gossip"
        @controller.create_gossip
      when 2 # Nouveau cas pour afficher la liste des potins
        puts "Tu as choisi de voir la liste des potins"
        @controller.display_gossips
      when 3 # Nouveau cas pour supprimer un potin
        puts "Tu as choisi de supprimer un potin"
        @controller.delete_gossip
      when 4
        puts "À bientôt !"
        break
      else
        puts "Ce choix n'existe pas, merci de ressayer"
      end
    end
  end
end
