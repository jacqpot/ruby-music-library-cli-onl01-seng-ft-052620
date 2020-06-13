class Song
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []
    def initialize(name, artist = nil, genre = nil)
        self.name = name
        self.artist=(artist) unless artist.nil?
        self.genre=(genre) unless genre.nil?
    end
    def save
        @@all << self
    end
    def self.all
        @@all
    end
    def self.create(name)
        song = self.new(name)
        song.save
        song
    end
    def self.destroy_all
        self.all.clear
    end
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end
    def self.new_from_filename(file_name)
        file = file_name.split(" - ")
        song = self.create(file[1])
        song.artist=(Artist.find_or_create_by_name(file[0]))
        song.genre=(Genre.find_or_create_by_name(file[2].gsub(".mp3", "")))
        song
     end
     def self.create_from_filename(file_name)
        song = Song.new_from_filename(file_name)
        song.save
     end
end


























# class Song
# extend Concerns::Findable
#     attr_accessor :name, :artist, :genre
#     attr_reader 
#     @@all = []
   
#     def initialize(name, artist= nil, genre= nil)
#         @name = name 
#         self.artist=(artist) if artist != nil
#         self.genre=(genre) if genre != nil
#         save
#     end

#     def artist= (artist)
#         @artist = artist unless @artist
#         artist.add_song(self)
#     end
#     def genre= (genre)
#         @genre = genre unless @genre
#         genre.add_song(self)
#     end
#     # def self.find_by_name(name)
#     #     @@all.detect{|artist| artist.name == name}
#     # end


#     def self.all
#         @@all
#     end
#     def save
#         @@all << self
#         # self
#     end
    
#     def self.destroy_all
#         @@all.clear
#     end
#     def self.create(name)
#         song = self.new(name)
#         song.save
#         song 
#     end
#     # def self.find_by_name(name)
#     #     self.all.detect{|element| element if element.name == name}
#     # end
#     # def self.find_or_create_by_name(element)
#     #     output = nil 
#     #     self.find_by_name(element) ? output = self.find_by_name(element) : output = self.create(element)
#     #     output
#     # end

# end