old_inventory = File.open('../code/inventory/old-inventory.txt').readlines
new_inventory = File.open('../code/inventory/new-inventory.txt').readlines

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
