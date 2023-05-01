class Gossip
    attr_accessor :name, :content
    def initialize(name, content)
        @name = name
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@name, @content]
        end
    end

    def self.all
        return CSV.parse(File.read("./db/gossip.csv"), headers: false)
    end

    def self.find(index)
        index = index.to_i
        data_gossip = CSV.parse(File.read("./db/gossip.csv"), headers: false)
        #condition ternaire
        return(index < data_gossip.length) ? data_gossip[index] : ["",""]
        
        #if index < data_gossip.length
        #    return data_gossip[index]
        #else
        #    return ["",""]
    end
end