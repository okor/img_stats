@basedir = ARGV[0]
@files = []
@jpgs = 0
@pngs = 0
@imgs_size = 0

if !ARGV[0]
  puts "Example: ruby img_stats.rb ~"
  exit
end

def query_files
  @files = Dir.glob(@basedir + '/**/*')
  @files.each do |f|
    img_stats(f)
  end
end


def img_stats(file)
  ext = File.extname(file.downcase)

  if  ext == '.jpg' || ext == '.jpeg'
    @jpgs += 1
    @imgs_size += File.size(file)
  end

  if  ext == '.png'
    @pngs += 1
    @imgs_size += File.size(file)
  end

end


def report
  puts 'Files: ' + @files.length.to_s
  puts 'jpg\'s: ' + @jpgs.to_s
  puts 'png\'s: ' + @pngs.to_s
  puts 'Images total size: ' + (@imgs_size/(1024*1024)).to_s + ' MB'
end



query_files
report