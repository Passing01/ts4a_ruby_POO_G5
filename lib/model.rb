require 'csv'

class Model
  def initialize
    @gossips = []
    load_gossips
  end

  def create_gossip(author, content)
    gossip = Gossip.new(author, content)
    @gossips << gossip
    save_gossips
  end

  def all_gossips
    @gossips
  end

  def delete_gossip(index)
    @gossips.delete_at(index)
    save_gossips
  end

  private

  def load_gossips
    if File.exist?('db/gossip.csv')
      csv = CSV.read('db/gossip.csv', headers: true, converters: :numeric)
      csv.each do |row|
        @gossips << Gossip.new(row['author'], row['content'])
      end
    end
  end

  def save_gossips
    CSV.open('db/gossip.csv', 'w') do |csv|
      csv << ['author', 'content']
      @gossips.each do |gossip|
        csv << [gossip.author, gossip.content]
      end
    end
  end
end

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end
end
