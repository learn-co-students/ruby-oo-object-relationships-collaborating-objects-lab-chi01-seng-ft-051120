require 'pry'
class MP3Importer
attr_accessor :path
@@files = []
  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3") do |filename|
    @@files << filename.gsub("#{@path}/", "")
    end
    @@files
  end

  def import 
    @@files.each do |file_name|
    Song.new_by_filename(file_name)
    end
  end
end