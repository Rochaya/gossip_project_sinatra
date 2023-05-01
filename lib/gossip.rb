class Gossip
    attr_accessor :author, :content
    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
    end

    def self.all
        return CSV.parse(File.read("./db/gossip.csv"), headers: false)
    end
end