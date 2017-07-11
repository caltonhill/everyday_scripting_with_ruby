def month_before(a_time)
# subtract 28 days of seconds from time now
  a_time - (28 * 24 * 60 * 60)
end

def change_count_for
    Random.rand(17)
end


def extract_change_count_from
  Random.rand(30)
end



def svn_log(subsystem, start_date)
  timespan = "-revision 'HEAD:{#{start_date}}'"
  root = "svn://rubyforge.org//var/svn/churn-demo"

  'svn log #{timespan} #{root}/#{subsystem}'
end

def header(an_svn_date)
  "Changes since #{an_svn_date}"
end

def asterisks_for(num)
  '*' * (num/5.0).round
end


def subsystem_line(subsystem_name, change_count_for)
   if change_count_for >= 5
       asterisks = asterisks_for(change_count_for)
      "#{subsystem_name.rjust(14)} #{asterisks} #{change_count_for}"
   elsif change_count_for > 0 && change_count_for < 5
       asterisks = '*'
      "#{subsystem_name.rjust(14)} #{asterisks} #{change_count_for}"
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
    puts subsystem_line(name, change_count_for)
  end
end