if $0 == __FILE__
  subsystem names = ['audit', 'fulfillment', 'persistence',
                'ui', 'util', 'inventory']
  start_date = svn_date(month.before(Time.now))

  puts header(start_date)
  lines = subsystem_names.collect do |name|
    subsystem_line(name, chage_count_for(name, start_date))
  end

  puts order_by_descending_change_count(lines)
end