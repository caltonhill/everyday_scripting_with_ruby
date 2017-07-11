def month_before(a_time)
# subtract 28 days of seconds from time now
  a_time - (28 * 24 * 60 * 60)
end

def change_count_for(name, start_date)
    extract_change_count_from(svn_log(name, start_date))
end

def extract_change_count_from(log_text)
  lines = log_text.split("\n")
  dashed_lines = lines.find_all do | line |
    line.include?('----')
  end
  dashed_lines.length
end

def svn_log(subsystem, start_date)
  timespan = "-revision 'HEAD:{#{start_date}}'"
  root = "svn://rubyforge.org//var/svn/churn-demo"

  'svn log #{timespan} #{root}/#{subsystem}'
end

def header(an_svn_date)
  "Changes between #{an_svn_date} and #{Time.now.strftime("%Y-%m-%d")}."
end

def asterisks_for(num)
  if change_count > 2
  '*' * (num/5.0).round
  else

  end

end


def subsystem_line(subsystem_name, change_count)
   if change_count >= 3
       asterisks = asterisks_for(change_count)
      "#{subsystem_name.rjust(14)} #{asterisks} #{change_count}"
   elsif change_count > 0 && change_count < 3
      asterisks = 1
      "#{subsystem_name.rjust(14)} #{asterisks} #{change_count}"
   else
      "#{subsystem_name.rjust(14)} -"
  end

  #asterisks = asterisks_for(change_count)
  #"#{subsystem_name.rjust(14)} #{asterisks} #{change_count}"
end

def svn_date(a_time)
  a_time.strftime("%Y-%m-%d")
end





if $0 == __FILE__
  subsystem_names = ['audit','fulfillment', 'persistence',
                      'ui', 'util', 'inventory']
  start_date = svn_date(month_before(Time.now))

  puts header(start_date)
  subsystem_names.each do | name |
    puts subsystem_line(name, change_count_for(name, start_date))
    end
end