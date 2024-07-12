require_relative 'view'
require_relative 'model'

class Controller
  def initialize
    @view = View.new
    @model = Model.new
  end

  def create_gossip
    author = @view.ask_for('auteur')
    content = @view.ask_for('contenu')
    @model.create_gossip(author, content)
    @view.display_message('Le potin a été créé avec succès !')
  end

  def display_gossips
    gossips = @model.all_gossips
    @view.display_gossips(gossips)
  end

  def delete_gossip
    gossips = @model.all_gossips
    @view.display_gossips(gossips)
    index = @view.ask_for_index
    @model.delete_gossip(index)
    @view.display_message('Le potin a été supprimé avec succès !')
  end
end
