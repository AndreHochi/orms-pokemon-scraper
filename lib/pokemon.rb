class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end

    def self.find(id, db)

        found_poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        self.new({id: found_poke[0][0], name: found_poke[0][1], type: found_poke[0][2], db: db})

    end

end
