class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
        self.name = name
        self.songs = []
    end
    def save
        @@all << self
    end
    def self.all
        @@all
    end
    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end
    def self.destroy_all
        self.all.clear
    end
    def add_song(song)
        song.genre = self unless song.genre != nil
        self.songs << song unless self.songs.include?(song)
    end
    def artists
        @songs.map{|song| song.artist if song.genre == self}.uniq
    end
end








































#
#  class Genre
#     extend Concerns::Findable
#     attr_accessor :name
#     @@all = []
   
#     def initialize(name)
#         @name = name 
#         @songs = []
#         save
#     end

#     def songs
#         @songs
#     end
#     def add_song(song)
#         song.genre = self unless song.genre != nil
#         @songs << song unless @songs.include?(song)
          
#     end
 
#     def self.all
#         @@all
#     end
#     def save
#         @@all << self
#         self
#     end
    
#     def self.destroy_all
#         @@all.clear
#     end
#     def self.create(name)
#         self.new(name).save
#     end
#     def artists
#         @songs.map { |song| song.artist if song.genre == self}.uniq
        
#     end

# end