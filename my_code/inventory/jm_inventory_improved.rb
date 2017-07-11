def inventory_from(filename)
  File.open(filename).collect.each do |line|
      line.downcase
    end
end

def boring(line)
  line.split('/').include?('temp') or
      line.split('/').include?('recycler')
end



unless ARGV.length == 2
  puts "Looks like you forgot to give the filenames."
  puts "Try 'jm_inventory_improved.rb [old inventory file] {new inventory file]'"
  exit
end

old_inventory = inventory_from(ARGV[0])
new_inventory = inventory_from(ARGV[1])

new_files =  new_inventory - old_inventory
deleted_files = old_inventory - new_inventory
unchanged_files = new_inventory & old_inventory

puts "The following #{new_files.length} files have been added:--"
puts new_files

puts ""
puts "The following #{deleted_files.length} files have been deleted:--"
puts deleted_files

puts ""
puts "#{unchanged_files.length} files were unchanged:--"
puts unchanged_files
